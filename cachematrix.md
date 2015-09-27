---
title: "Caching A Matrix Inverse"
author: "Michael Powe"
date: "September 27, 2015"
output: html_document
---

Two functions to be used in tandem.

```makeCacheMatrix``` creates an object (a list) that consists of a square matrix and four functions to manipulate it. 

```makeCacheMatrix``` will throw an exception and exit if the input matrix is not square.

```cacheSolve``` uses the object created by ```makeCacheMatrix```. If the matrix is 'singular,' that is, a matrix with a determinant of zero, the function will throw an exception and exit.  You cannot take the inverse of a singular matrix.

### Test process

- Create matrix 'mx' using ```rnorm```
- Matrix must be square and ```det(matrix) != 0```
- Make a caching version of the matrix, 'mx_c', with ```makeCacheMatrix```
 
- Cache the inverse, 'mx_c_i', of 'mx_c' with ```cacheSolve```
- The first time 'mx_c_i' is created, *there should be no message* from ```cacheSolve```
- After that, "getting cached data" should appear
 
```{r}
mx <- matrix(rnorm(36), nrow = 6, ncol = 6 )
det(mx)
mx_c <- makeCacheMatrix(mx)
mx_c_i <- cacheSolve(mx_c)
```
