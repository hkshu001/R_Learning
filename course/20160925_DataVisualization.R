library(ggplot2)
library(dplyr)
library(magrittr)

# ============= ggplot2 plotting basic template===============
# ggplot(data = <DATA>) + # Data
#   geom_<xxx>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>,
#     position = <POSITION>
#     ) + # Layers & Aesthetic mappings
#   scale_<xxx>() + coord_<xxx>() + facet_<xxx>() # Position
# theme_()

## ggplot: data source assign
## geom: visual marks that represent data points
## Notice:
## In each geom_<xxx> is with a default stat_<xxx>
## geom_point(stat="identity); geom_bar(stat="count")
## It is important to make sure what's the default stat_<xxx> before plot
## A better way is to calculate stats manual before plot
# ==============================================================

# Scatter plot: geom_point()
#----------------------------------------------------------------
# Usage:
  geom_point(mapping = NULL, data = NULL, stat = "identity",
             position = "identity", ..., na.rm = FALSE, show.legend = NA,
             inherit.aes = TRUE)
# Aesthetics:
  # required: x, y
  # optional: alpha, color, fill, shape, size
#----------------------------------------------------------------
  # Examples:
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy))
  
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = hwy, y = cyl))
  
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = class, y = drv))

  # Scatter plot: class group is presented by different colors 
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class))
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, fill = class)) 
  
  
  
  # Scatterplots; class group is presented by the transparent
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
  # Scatterplots; class group is presented by legend shape
  ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, shape = class))


# aes() can be put in different position
# ggplot(aes())
# with "memory effect"(become a default setting for all layers)
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

# ... + aes(), as a function of variables 
# with "memory effect"(become a default setting for all following layers)
ggplot(data = mpg) +
  aes(x = displ, y = hwy, color = class) +
  geom_point()

# geom_<xxx>(aes())
# without "memory effect"(only for the specific geom)

ggplot(data = mpg) +
  geom_point(mapping= aes(x = displ, y = hwy, color = class))

# to override the default aesthetics setting, the parameter must to be:
# geom_<xxx>(inherit.aes=FALSE)


# to assign a specific color in the diagram 
# Correct example: color setting is out of aes()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
# Failed example: color setting is in the aes()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# Notice:
# If the aesthetic in aes(): it is a map aesthetic and legend be created automatically
# If the aesthetic out of aes(): a specific aesthetic can be tuned by manual



# geoms example: smooth line plotting
# plot scatterplot:
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
# plot smooth line:
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# combine point and smooth two diagram
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping= aes(x = displ, y = hwy))

# the same aes() can be put in ggplot()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()



# geoms example: Bar chart
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class))

# Notice:
# the default stats in geom_bar is "count"
# the following is an example to treat stats "count" then use ggplot2
d<- mpg %>% 
    group_by(class) %>%
    summarise(count=n())

ggplot(data=d) + 
  geom_bar(aes(x=class, y=count),
           stat="identity")

# Exercise: to plot the bar chart "mean hwy" vs "class"
d1<- mpg %>%
     group_by(class) %>% 
     summarise(mean_hwy=mean(hwy))

ggplot(data=d1)+
  geom_bar(aes(x=class, y=mean_hwy),
           stat="identity")


# geoms example: bar chart: order by the x-axis variables  
ggplot(data=d) + 
  geom_bar(aes(x=reorder(class, -count), y=count),
           stat="identity")
# geoms example: bar chart: to fill colors in bar area
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = class))
# geoms example: bar chart: to fill colors in bar boundary line
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, color = class))
# geoms example: bar chart: to show count value on bar diagram
# 1) static counted by ggplot geom
ggplot(data = mpg, aes(x = class)) +
  geom_bar() +
  geom_text(stat = "count",
            aes(label = ..count.., y =..count..),
            vjust = "bottom")
# 2) static counted by manual
d<- mpg %>% 
  group_by(class) %>%
  summarise(count=n())

ggplot(data=d,aes(x=class, y=count)) +
  geom_bar(stat= "identity") +
  geom_text(aes(label=count),
            vjust="bottom")

# geoms example: bar chart: manufacturer group is presented by different colors
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = manufacturer))

# The "position" is a parameter for how to show the group data in the diagram
# position="identity": all data will be show in the same position; the back
#                      layers will be covered blanketed with frony layers
# position="stack": all data will be shown in as a stacked bar
# position="dodge": all data will be shown side by side
# position="fill":  all data will be shown in stack mode and move the scale to 100%
# position="jitter": the points are with a small shift to prevent blanketed each other

# Example of position="stack"
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = manufacturer),
           position = "identity") +
  ggtitle('Position = "stack" example')

# Example of position="identity"
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = manufacturer),
           position = "identity", alpha = .4) +
  ggtitle('Position = "identity"')

# Example of position="dodge"
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = manufacturer),
           position = "dodge") +
  ggtitle('Position = "dodge"')

# Example of position="fill"
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = manufacturer),
           position = "fill") +
  ggtitle('Position = "fill"')

# Example of "facet"
# facets divide a plot into subplots based on the values of 
# one or more discrete variables
ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class)) +
  facet_wrap( ~ manufacturer, ncol = 3)

# Exercise of facet
# 畫出各車廠(manufacturer)在不同車型(class)的平均油耗效率(hwy) bar chart
summary_hwy <- mpg %>% 
  group_by(manufacturer,class) %>%
  summarise(mean_hwy= mean(hwy))  

ggplot(data= summary_hwy) +
  geom_bar(aes(x= class,
               y= mean_hwy),
           stat="identity")+
  facet_wrap(~manufacturer, ncol=3)


# geoms example: Boxplot
ggplot(data=mpg)+
  geom_boxplot(mapping= aes(x=class, y=hwy))


# Example of labels: ggtitle(), xlab(), ylab()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() + 
  ggtitle("Fuel efficiency vs. Engine size")+
  xlab("Engine size") +
  ylab("HWY")


# Example of labels: labs()
# note: color in labs() means the legend title
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() + 
  labs(title = "Fuel efficiency vs. Engine size",
       x="Engine size",
       y="HWY",
       color = "Car Class")


# Example of themes
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() +
  theme_bw()

# 看到這裡..P133/162
# Example of scale: scale_y_continuous 
library(ggplot2movies) # IMDB data
View(movies)

ggplot(data=movies)+
  geom_point((aes(x=rating, y=votes))) 

+
  scale_y_continuous(name="number of votes",labels=scales::comma) +
  scale_x_continuous(limits=c(8,9))


View(presidential)
d <- presidential %>%
  mutate(id = 33 + row_number())  # id: 屆數

ggplot(d, aes(x = start, y = id)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  geom_text(aes(label = name), hjust = 0,  vjust = 0, nudge_y = 0.2) +
  scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y")

library(RColorBrewer)
display.brewer.all()



p <- ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()
plot(p)

p + scale_color_brewer(palette = "PRGn") # default color scheme


d <- presidential %>%
  mutate(id = 33 + row_number())

ggplot(d, aes(start, id, colour = party)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  geom_text(aes(label = name), hjust = 0,  vjust = 0, nudge_y = 0.2) +
  scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y") +
  scale_colour_manual(values = c(Republican = "Red", Democratic = "Blue"))

library(plotly)
p <- ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, color = class))
ggplotly(p)
