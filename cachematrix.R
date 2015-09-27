# Michael Powe
# R Programming, Assignment 2
# 27 Sept 2015
# 
# 
# 
# 
# 
# 

# Create matrix mx using rnorm
# Matrix must be square and det(matrix) != 0
# Make a caching version of the matrix, mx_c, with makeCacheMatrix
# 
# Cache the inverse, mx_c_i, of mx_c with cacheSolve
# The first time mx_c_i is created, there should be no message from cacheSolve
# After that, "getting cached data" should appear
# 

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mat = matrix()) {
        inversecache <- NULL
        set <- function(newmatrix) {
                mat <<- newmatrix
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


## Write a short comment describing this function

cacheSolve <- function(cachingMatrix, ...) {
        ## Return a matrix that is the inverse of 'x'
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
