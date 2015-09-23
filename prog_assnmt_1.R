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

# 21 sept 2015

# count col ncol(x), count rows nrow(x)
# colnames(x) for column names

# format of columns
# "Date","sulfate","nitrate","ID"
# "2003-01-01",NA,NA,1
# "2003-01-02",NA,NA,1
# "2003-01-03",NA,NA,1
#

# all the files in the specdata directory
# d <- dir("~/src/jhu_data_science/specdata/",pattern="\\d{3}\\.csv")

# avoid magic constants, put the dir path in a var

# d <- dir(specdata,pattern="\\d{3}\\.csv")
# length(dtest)
# testdata<-lapply(dtestdir, read.csv)
# testdata<-read.csv(paste(specdata,"001.csv",sep = ""),header = TRUE)
# testdata<-read.csv(paste(specdata,dtestfiles,sep="/"),header = TRUE)

# collect the csv files in the specdata directory

specdata<-"~/src/jhu_data_science/specdata"
dtestfiles<-list.files(specdata,pattern="00[1-9]+\\.csv")

dtestdir<-dir(specdata,pattern="00[1-9]+\\.csv",full.names = TRUE)


testdata<-NULL
dtest1<-read.csv(paste(specdata,"001.csv",sep = "/"),header = TRUE)
dtest2<-read.csv(paste(specdata,"002.csv",sep = "/"),header = TRUE)

testdata<-lapply(dtestdir, read.csv)

# if data frame is NULL, add the first file's data and pop off the file from the vector
# this is somewhat naughty, but saves from hitting the conditional on every step of the loop

if (is.null(testdata)){
  testdata<-read.csv(dtest,header = TRUE)
}

for(d in dtest){
  print(d)
}

for(d in dtest){
  print(paste("file: ",d))
  testdata<-rbind(testdata,read.csv(dtest,header = TRUE))
  
}
nrow(testdata)

# function to read in data files and create a single data frame 
getspecdata<-function(filelist){
  
  
}
reader <- function(x) {
        read.csv(file = x, header = TRUE)
}

