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
nullVector <-rep(NA, 10)

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


## Differnce between null and na
naVec <- rep(NA,5)
sum(naVec)          # NA

nullVec <- rep(NULL,5)
sum(nullVec)        # 0


## assign/change value
empty <- rep(NA,10)

for(i in 1:10){       # simple loop in R
  empty[i] <- i**2    
}
