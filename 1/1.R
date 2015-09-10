download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="data.csv", method="curl") 
x <- read.csv("data.csv")
sum (x$VAL == 24, na.rm=T)

library(xlsx)
dat <- read.xlsx("data.xlsx", colIndex=7:15, rowIndex=18:23, sheetIndex=1)
sum(dat$Zip*dat$Ext,na.rm=T)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", destfile="data.xml", method="curl") 
library(XML)
x <- xmlTreeParse("data.xml", useInternalNodes=T)
sum((xpathSApply(x, '/response/row/row/zipcode', xmlValue))==21231)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="data2.csv", method="curl") 
library(data.table)
DT <- fread("data2.csv")

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
DT[,mean(pwgtp15),by=SEX]
system.time( DT[,mean(pwgtp15),by=SEX])
## and so on...

