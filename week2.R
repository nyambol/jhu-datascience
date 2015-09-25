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

# c[1:6,'ID' = 3:6]
# c[1:6,'ID' == 3:6]
# c[c$ID==6]
# c[c$ID==8]
# c[c$ID==1]
# c[c$ID]
# c$ID
# c[c$ID==29]
# str(c)
# c[c$ID==29,]
# c['ID' = 3:6,]
# c['ID' == 3:6,]
# c['ID' == 29,]
# c[c$ID==29,]
# c[c$ID==28:29,]
# c[c$ID==c(6,28:29),]
# c['ID'==c(6,28:29),]
# c['ID'==c(6,28:29)]
# c[,'ID'==c(6,28:29)]
# c[c$ID==c(6,28:29),]
# d<-c[c$ID==c(6,28:29),]
# str(d)
# mean(d)
# class(d)
# dim(d)
# d.length
# (lapply(d,mean))
# (lapply(d$nitrate,mean))
