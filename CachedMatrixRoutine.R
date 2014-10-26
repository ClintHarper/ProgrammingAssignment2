## Example Command line returns that works for
## makeCacheMatrix() and
## cacheSolve()

mat1 <- matrix(1:4, 2, 2)		# create atomic matrix object mat1
mat1Cache <- makeCacheMatrix(mat1)	# create CacheMatrix object from mat1
cacheSolve(mat1Cache)			# solve mat1 via CacheMatrix object
						# this first solution is calculated 
cacheSolve(mat1Cache)			# solve again, this time result is from cache

mat2 <- matrix(21:24, 2, 2)		# create atomic matrix object mat2
mat2Cache <- makeCacheMatrix(mat2)	# create CacheMatrix object from mat2
cacheSolve(mat2Cache)			# solve mat2 via CacheMatrix object
						# this first solution is calculated 
cacheSolve(mat2Cache)			# solve again, this time result is from cache