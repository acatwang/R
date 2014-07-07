#libraries required
library(maps)
library(ggplot2)
library(mapproj)
library(plyr)

# Load data with a State abbre
mydata <- read.csv("C:\\Users\\awang\\Desktop\\cott.csv")

# map_data has the US state lag/long, but does not has state abbrevieation
# State abbr data is available in the "state" data in mapproj
# Merge your own data and the two state data for plot

states <- map_data("state") # No abbr.
head(states)

data(state) # load from mapproj library
state_dict<- data.frame(cbind(state.abb,state.name))
names(state_dic) <- c("STATE","region")
mydata <- join(mydata,state_dict, by="STATE")
head(mydata)

mydata$region <- tolower(mydata$region) # first letter is capitalized in state.name


tfmerge <- merge(states,mydata, sort=FALSE, by="region", all.x =TRUE)
tfmerge <- tfmerge[order(tfmerge$order), ] # keep data sorted by polygon order


# Fill the missing data 
tfmerge[is.na(tfmerge$Frequency),]$Frequency <- 0
nrow(table(tfmerge$Frequency))

#  Plot using ggplot2
qplot(long, lat, data = tfmerge, group = group, fill = Frequency,
      geom="polygon", main="Cottage Industry in the US")


