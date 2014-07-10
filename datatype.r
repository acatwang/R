### Simple data manipulation with different data types in R



#################
### Vector    ###
#################

numVector <- c(1,2,3,4)
txtVector <- c("a","b","c")
logicVector <- c(TRUE,FALSE,TRUE,FALSE)

## Empty Vector

newVector <- vector(mode="logical", length=3)  # return FALSE by default
                                              # Argument: mode, length
                                              # mode: numeric, integer, logical, character and more.
naVector <-rep(NA, 10)

## Select data

chars <- c("a","b","c")
chars[1]                    # a
chars[1:2]                  # a,b
chars[c(1,3)]               # a,c
chars[-1]                   # b,c
char[char=="a"]             # a
char[char!="a"]             # b,c
char[char %in% c("a","c")]  # a,c
char[!is.na(char)]          # a,b,c . Called NOT-NA data
char[is.null(char)]         # character(0)




## assign/change value
empty <- rep(NA,10)

for(i in 1:10){       # simple loop in R
  empty[i] <- i**2    
}


##########################################
### Matrix: Data must be same type    ###
#########################################

## Create a matrix

m <- matrix(1, nrow=3,ncol=3)
#	     [,1] [,2] [,3]
#	[1,]    1    1    1
#	[2,]    1    1    1
#	[3,]    1    1    1


m2 <- matrix(1:9, nrow=3,ncol=3, byrow=FALSE)
#   	  [,1] [,2] [,3]
#	[1,]    1    4    7
#	[2,]    2    5    8
#	[3,]    3    6    9

m3 <- matrix(sample(1:5, 20, rep=TRUE), nc=2)	#nc = ncol. 
#      [,1] [,2]
# [1,]    1    4
# [2,]    3    3
# [3,]    1    3
# [4,]    2    2
# [5,]    5    5
# [6,]    4    3
# [7,]    3    3
# [8,]    1    2
# [9,]    5    3
# [10,]   5    1


m4 <- cbind(vec1, vec2)			# matrix can be made by combining row/column

## Useful function
dim(m)
rownames(m) <- rep("row",3)
colnames(m) <- c("1st", "2nd","3rd")
nrow(m)
length(m[,2])	# length of col/row
nchar(m[1,2])	# return number of letters in a char

## Select 
m[1,]		# first row
m[,3]		# 3rd column
m[,'2nd']	# select by col/row name
m3[order(m[,1],m[,2]), ]]	# ordered the matrix by vars/columns

#################################################
### Data Frame : allow diff data type in colums ##
#################################################

## Create a data frame
df <- data.frame(matrix(1:15,nrow=5,ncol=3))
df1 <- read.csv(filePath)
df2 <- cbind(vec1, vec2)	

## Useful function
str(df)
summary(df)
name(df)
head(df)
tail(df)
merge(states,mydata, sort=FALSE, by="region", all.x =TRUE)		#merge two data frame


## Select
df$X1				# select row by name
df[,"X1"]			# select row by name
df[sample(nrow(df), 3), ]	# select 3 rows randomly
df[!is.na(df$X1),]	# select rows where X1 is not NA

#################
## Missing Data##
#################

## Differnce between null and na
naVec <- rep(NA,5)
sum(naVec)          # NA

nullVec <- rep(NULL,5)
sum(nullVec)        # 0

## What to do with missing data
mean(x, na.rm=TRUE)
na.omit(): strip NA value( listwise deletion of missing values.)    
complete.case() :returns a logical vector indicating which cases are complete


