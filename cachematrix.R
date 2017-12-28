## Caching the inverse of a matrix

## The following functions are used to create a matrix an

## The makeCacheMatrix function creates 4 additional functions
## (2 to get and set a matrix, 2 to get and set the inverse of the matrix)
## used to cache a given matrix

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setInv <- function(inv) m <<- inv
	getInv <- function() m
	
	# Assign names to the functions defined above
	list(set=set, get=get,
	     setInv=setInv,
	     getInv=getInv)
}

## The cacheSolve function computes the inverse of a matrix.
## It checks to see if the inverse has been previously calculated.
## If it has, then the function retrieves the cached inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInv()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setInv(m)
	m
}
