add2<-function(x,y){
  
  x+y
}

# Calculate means of every column in the data set
# Defaults to removing NA before calculation
# Lexical scoping!!!!!

# always returns last expression evaluation (just like lisp)
# functions are first-class objects, just like Javascript

#
# is there hoisting in R?
#

# varargs, use ...
# you can have as many args as wanted, similar to the argument object in JS
# named arguments only after the three dots
# functions can return a function


colMean<-function(x, removeNA=TRUE){
  numCols<-ncol(x)
  means<-numeric(numCols)
  for(i in 1:numCols){
    means[i]<-mean(x[, i], na.rm = removeNA)
  }
  means
}


c2<-function(x){
  d<-x*y
  if(exists(y)) print("y exists;")
  y<-4
  d
}

