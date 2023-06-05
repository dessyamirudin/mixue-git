setwd("C:/xxxxxxx")

library(tidyverse)
library(readxl)
library(lubridate)
library(ggmap)

# reading data
all_sheet = excel_sheets("Mixue Clean.xlsx")

# number of store
nstore = read_excel("Mixue Clean.xlsx",sheet="Summary")

# plot beautiful line chart
ggplot(nstore, aes(x = Date, y = `Number of Store`)) +
  geom_line(color = "#0099f9", size = 1) +
  geom_point(color = "#0099f9", size = 5) +
  geom_text(aes(label = `Number of Store`),
            nudge_x = 0.5,
            nudge_y = 1,
            check_overlap = TRUE,
            size = 5)+
  geom_text(aes(label = Date),
            nudge_x = -0.25,
            nudge_y = -1,
            check_overlap = TRUE,
            size = 4)+
  labs(
    title = "Number of Mixue Store in South Tangerang",
    subtitle = "Data March to May 2023",
    caption = "Source: Amir Harjo Analysis and Google Map"
  ) +
  xlab("Observation Date")+
  ylab("Number of Mixue Store")+
  coord_cartesian(xlim =c(as.POSIXct('2023-02-01',format = "%Y-%m-%d"),as.POSIXct('2023-06-01',format = "%Y-%m-%d")), 
                  ylim = c(30, 40))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))


# longitude and latitude data
lon_lat = read_excel("Mixue Clean.xlsx",sheet="Store Long Lat")
colnames(lon_lat)[6] ="New Store (April 2023 Onwards)"

# plotting longitude and latitude
map_key <-  # "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
register_google(key = map_key)

# load South Tangerang Map
ts_map <- get_map("South Tangerang", zoom=12)

# create circle map 500 meters from the minimarket
p <- ggmap(ts_map)
p <- p + geom_point(data=lon_lat, aes(x=long, y=lat,color=`New Store (April 2023 Onwards)`),size=3,
                    alpha=2)
p

# dbscan

# distribution of score

