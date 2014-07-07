# Libraries required
library(ggplot2)
library(zipcode)

# Load zipcode dataset that contains lag/long 
data(zipcode)
head(zipcode)

# Load mydata
disaster <- read.csv("C:\\Users\\awang\\Desktop\\DISASTER.csv")

# R read the zip as integer by default. Transform it so 0 at the first won't disappear
disaster$zip <- as.character(disaster$zip)
for (i in 1:length(disaster$zip)){
  if (nchar(disaster$zip[i])<5){
    disaster$zip[i]<- paste("0",disaster$zip[i],sep="")
  }   
}

disaster$disaster <- 1

# Merge mydata with zipcode data
zipcode <- merge(zipcode,disaster, by="zip",all.x=TRUE)
zipcode[is.na(zipcode$disaster),]$disaster=0
head(zipcode)

# Plot using ggplot2
zipcode$region = substr(zipcode$zip, 1, 1)
ggplot(data=zipcode)+geom_point((aes(x=longitude, y=latitude,color=factor(disaster))))+
  scale_x_continuous(limits = c(-125,-66), breaks = NA)+
  scale_y_continuous(limits = c(25,50), breaks = NA)+
  ggtitle("Disaster happened in the US by ZIP")+
  theme(legend.position="none")
  

