##
## makeCacheMatrix: This function creates a special "list matrix" object that can cache its inverse.
##
## The function recieves an atomic matrix object that is assumed to be an invertable matrix.
## The function returns a list object.
## 	The list object contains four functions
##		setx 	: Recieves a PASSED matrix object and sets the values of the GLOBAL matrix object x to the values of y.
##				Since the GLOBAL matrix object x has new values,
##				GLOBAL matrix object ix is set to NULL, since the inverse of the new values hasn't been calculated yet.
##		setix : Recieves a PASSED matrix object and sets the values of the GLOBAL matrix object ix to the values of y.
##		returnx : Returns the LOCAL (CASHED) value of x 
## 		returnix: Returns the LOCAL (CASHED) value of ix
##

makeCacheMatrix <- function(x = matrix()) 
{
		
	## create a function "setx" that replaces the matrix x with the passed matrix y: GLOBALLY
	## also sets the inverse of x to NULL : GLOBALLY
	## use this function to initialize a new "list" matrix object
	
	setx <- function(y) 
	{
		x <<- y
		ix <<- NULL
	}

	## create a function "setix" that sets ix (the inverse) to invx (the passed variable): GOBALLY

      setix <- function(invx)
	{
		ix <<- invx
	}

	## create a function "returnx" that simply returns the LOCAL value of x
	## LOCAL Value = CACHED Value

      returnx <- function() 
	{
		x
	}

	## set initial LOCAL value of ix (inverse of x) to NULL at execution of makeCacheMatrix()
	## this sets the initial cached value of ix to NULL.
	## Note: x is already set as the atomic matrix object passed on calling makeCacheMatrix

	ix <- NULL	

	## create a function "returnix" that simply returns the LOCAL value of ix, the inverse of the matrix x
	## LOCAL Value = CACHED Value

      returnix <- function() 
	{
		ix
	}

	## Create a list object, which will be returned by the makeCacheMatrix function
	## Each of the four list items are the functions created by makeCacheMatrix

        list( setx = setx, setix = setix, returnx = returnx, returnix = returnix )
}

##
## cacheSolve: This function returns the inverse of a matrix.
##
##	It calculates, caches, and returns the inverse of the matrix if that inverse doesn't exist.
##	It returns the cached value of the inverse if the value has been previouly calculated.
## 	Note:
##		The matrix passed to this function must be a "list" matrix object created by makeCacheMatrix.
##		This function does not accept "atomic" matrix object.
##	Also note:
##		The values will be returned in the GLOBAL objects 
##			x : an "atomic" matrix object and
##			ix : an "atomic" matrix object containing either the inverse of x or a NULL value
##		The values will not be returned 

cacheSolve <- function(x, ...) 
{    
	## x is a "list" matrix object created by makeCacheMatrix.
	## invx is inverse of the matrix x. x is assumed to be invertable.

	## get cached value of inverse for recieved matrix object

      invx <- x$returnix()	## assume x is a "special list" matrix object.
					## getinv() is a function in that list matrix object.
					## get inv() returns the inverse or a NULL value.
					## if x isn't a "special list" matirx object
					## 	assume NULL will be returned anyway.

	## if value of invx is not null, return the cached value

	if (!is.null(invx))
	{
		print("cached inverse returned")
		return(invx)
	}

	## if value of invx hasn't been returned, it must be a NULL value
	## so we now caculate the value of invx, cache that value, then return the value

	data <- x$returnx()	## call function that gets CACHED matix from "special list" matrix object.
	invx <- solve(data)	## calculate inverse 
	x$setix(invx)		## call function that cashes value of inverse in the "special list" matrix object.
	print("calculated inverse returned")
	invx				## implicityly return the calculated value of the inverse of the matrix.

}