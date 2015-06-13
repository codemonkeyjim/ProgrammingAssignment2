n = 25

# Make a n x n matrix
m<-matrix(rnorm(n^2), n, n)
cm<-makeCacheMatrix(m)

# Uncached
cacheSolve(cm)
# Cached
cacheSolve(cm)
