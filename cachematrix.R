
## I relied heavily the examples of makeVector en chacheVector.
## I stated both functions at the bottom 
## Tested the scripts and they seem to work

makeCacheMatrix <- function(x = matrix()) {
        ## initialise the matrix m
        m <- NULL
        
        ## define setmatrix
        
        setmatrix <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        ## define function getmatrix
        getmatrix <- function() x
        
        ## define functione setcache
        setcache <- function(inverse) m <<- inverse
        
        ## define function getcache
        getcache <- function() m
        
        ## list name of methods
        list(setmatrix = setmatrix,
             getmatrix = getmatrix,
             setcache = setcache,
             getcache = getcache)
}

## function cachesolve, return the inverse of a given matrix m

cachesolve <- function(x, ...) {
        
        m <- x$getcache()
        
        ## if not NULL then return m
        if(!is.null(m)) {
                message("load cache matrix")
                return(m)
        }
        
        ## if empty then use the cache matrix m
        else {
                dmatrix <- x$getmatrix()
                m <- solve(dmatrix, ...)
                x$setcache(m)
                m
        }
        
        
}
                

## Example from Coursera Week 3 Programming

## makeVector <- function(x = numeric()) {
##        m <- NULL
##        set <- function(y) {
##                x <<- y
##                m <<- NULL
##        }
##        get <- function() x
##        setmean <- function(mean) m <<- mean
##        getmean <- function() m
##        list(set = set, get = get,
##             setmean = setmean,
##             getmean = getmean)
##}

## cachemean <- function(x, ...) {
##        m <- x$getmean()
##        if(!is.null(m)) {
##                message("getting cached data")
##                return(m)
##        }
##        data <- x$get()
##        m <- mean(data, ...)
##        x$setmean(m)
##        m
##}

