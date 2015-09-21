# week two of the R Programming Course
# 21 Sept 2015

a=1
b=2
f<-function(x){
  print("in f, a is ")
  print(a)
  print("in f, b is")
  print(b)
  a*x +b
}

g<-function(x){
  a=2
  b=1
  f(x)
}
