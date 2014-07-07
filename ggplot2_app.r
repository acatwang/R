library(ggplot2)
library(plyr)
library(scales)

## Plot time series data

ggplot(data, aes(x=as.Date(time),y=freq))+
  geom_line()+
  scale_x_date(labels = date_format("%m/%y"))
  

## Legend positioning
# [WAY 1]
ggplot(ford_by_m,aes(x=factor(month), y=freq,fill=factor(year)))+
  geom_bar(stat="identity")+
  theme(legend.justification=c(0,1), legend.position=c(0,1))

# [WAY 2]
ggplot(rev(stock),aes(x=as.Date(time),y=close))+   #rev: retrun reversal
  geom_line()+
  theme(legend.position="top")                    # Place a row of legend on the top of plot
  


## Grid
# [Facet]
ggplot(daily_car_by_type, aes(x=as.Date(time.x),y=freq),stat="identity")+
  geom_line()+
  facet_grid(veh_type ~ .,scales="free_y")+
  scale_x_date(labels = date_format("%m/%d/%y"))
  
# [gridExtra]
require(gridExtra)
plot1 <- ggplot(agg_top5, aes(x=as.Date(time),y=sum))+
          geom_bar(stat="identity")

plot2 <-  ggplot(agg_by_date[agg_by_date$make == c("FORD","CHEV","GMC","DODG","TOYT"),], 
                  aes(x=as.Date(time),y=freq,colour=make, label=freq))+
            geom_point(na.rm=TRUE, size=3.5)+
            geom_line(size=1)

grid.arrange(plot1, plot2)

        
