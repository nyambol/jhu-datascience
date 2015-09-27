# Michael Powe
# R Programming, Assignment 2
# 27 Sept 2015
# 
# Two functions to be used in tandem. 
# 

# Test process
# Create matrix 'mx' using rnorm
# Matrix must be square and det(matrix) != 0
# Make a caching version of the matrix, 'mx_c', with makeCacheMatrix
# 
# Cache the inverse, 'mx_c_i', of 'mx_c' with cacheSolve
# The first time 'mx_c_i' is created, there should be no message from cacheSolve
# After that, "getting cached data" should appear
# 

# mx <- matrix(rnorm(36), nrow = 6, ncol = 6 )
# det(mx)
# mx_c <- makeCacheMatrix(mx)
# mx_c_i <- cacheSolve(mx_c)

# makeCacheMatrix creates an object (a list) that consists of a square matrix and 
# four functions to manipulate it. 
# makeCacheMatrix will throw an exception and exit if the input matrix is not square.
# 
makeCacheMatrix <- function(mat = matrix()) {
        if(ncol(mat) != nrow(mat)){
                stop("Must be a square matrix.")
        }
                
        inversecache <- NULL
        set <- function(newmatrix) {
                mat <<- newmatrix
                # if the caching function has been run previously on
                # a different matrix, kill the cache
                inversecache <<- NULL
        }
        get <- function() {
                mat
        }
        setinverse <- function(minverse){
                inversecache <<- minverse      
        } 
        getinverse <- function() {
                inversecache
        }
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

# cacheSolve uses the object created by makeCacheMatrix. If the matrix 
# is 'singular,' that is, a matrix with a determinant of zero, the function
# will throw an exception and exit.  You cannot take the inverse of a 
# singular matrix.
#
cacheSolve <- function(cachingMatrix, ...) {
        
        # cachingMatrix was created by makeCacheMatrix
        # (It's really a list with a matrix as one element.)
        inversecache <- cachingMatrix$getinverse()
        if(!is.null(inversecache)) {
                message("getting cached data")
                return(inversecache)
        }
        
        newmatrix <- cachingMatrix$get()
        if(det(newmatrix) == 0){
                stop("The input matrix is singular, and cannot be inverted.")
        }
        inversecache <- solve(newmatrix, ...)
        cachingMatrix$setinverse(inversecache)
        inversecache
}
