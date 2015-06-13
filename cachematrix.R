## This is a library for creating and using matrices whose inverse can be cached
## Calculating a matrix inverse is a relatively expensive operation so we cache
## the inverse once it's been calculated.


## makeCacheMatrix(x) accepts a matrix x and returns an object that can hold
## both the matrix and its inverse

## Usage:
## cm<-makeCacheMatrix(m)
## cm$get() returns m
## cm$getinverse() returns the cached inverse of m; returns NULL if there is
##    no cached inverse
## cm$set(m) caches a new matrix m, and clears the cached inverse
## cm$setInv(newInv) caches newInv as the inverse of m

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(newInv) inv <<- newInv
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve(x) accepts an object x that was produced by makeCacheMatrix()
## If x already has a cached inverse, that is returned
## Otherwise the inverse is calculated, cached to x, and returned

## Note that x is assumed to be invertible

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  inverse <- x$get()
  inv <- solve(inverse, ...)
  x$setinverse(inv)
  inv
}
