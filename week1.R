#------------------------------------------------------------#
# R Programming Course for JHU Data Science on Coursera
# 13 Sept 2015
#------------------------------------------------------------#

####### atomic classes #######

#######vectors and lists #######
# use the c() function

x<-c(T,F)
x
y<-9:29
y
# create an empty vector of specified type and length
x<-vector("numeric",length=10)

# mixing objects in vector creation
# NO ERROR GIVEN

x<-c(1.7,"a")
# coerces the first item to string

y<-c(TRUE,"a")
# coerces TRUE to the string "TRUE", no longer a boolean

# explicit coercion
y <- as.numeric(x)
y

# > x<-c(1.7,"a")
# > y <- as.numeric(x)
# Warning message:
#   NAs introduced by coercion 
# > y
# [1] 1.7  NA
# 

x<-0:6
class(x)

## lists -- vectors with different types of objects
# lists are vectors with each element as a vector

x<-list(1,"yes",TRUE,3.5)

# > x<-list(1,"yes",TRUE,3.5)
# > x
# [[1]]
# [1] 1
# 
# [[2]]
# [1] "yes"
# 
# [[3]]
# [1] TRUE
# 
# [[4]]
# [1] 3.5

y<-list(1,2,3,4)
y

# > y<-list(1,2,3,4)
# > y
# [[1]]
# [1] 1
# 
# [[2]]
# [1] 2
# 
# [[3]]
# [1] 3
# 
# [[4]]
# [1] 4


####### factor #######

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x) #frequency count

unclass(x)
x

y <- factor(c("yes", "yes", "no", "yes", "no"),
            levels=c("yes","no"))

y

####### missing values #######
# NA is.na()
# NaN is.nan()

x<-c(1,2,NA,3,4)
x
is.na(x)
is.nan(x)
x<-c(1,2,NaN,NA,3,4)

####### data frame #######

#read.csv()
#read.table()
#row.names attribute
#convert to matrix with data.matrix()

x<-data.frame(foo=1:4,bar=c(T,T,F,F))
x

####### names attribute #######
x<-1:3
names(x)
names(x)<-c("foo","bar","norf")
y<-list(a=1,b=2,c=3)
y
names(y)
#matrices names
m<-matrix(1:4, nrow=2, ncol=2)
dimnames(m)<-list(c("a","b"),c("c","d"))
#dimnames <- list(row,column)
m
