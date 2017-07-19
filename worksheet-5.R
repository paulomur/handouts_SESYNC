## Getting started
library(dplyr)
library(ggplot2)


animals <- read.csv("data/animals.csv", na.strings = "") %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight))

## Constructing layered graphics in ggplot
ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_point()
#############################3
ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot()

##################################

ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(stat = 'summary',
             fun.y = 'mean',
             col=  'red')

##################################

ggplot(data = animals,
       aes(x = species_id, y = weight, color = species_id)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean")

## Exercise 1

DM <- read.csv("data/animals.csv", na.strings = "") %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight),(species_id=='DM'))


ggplot(data = DM,
       aes(x = year, y = weight, color = sex)) +
  #geom_() +
  geom_line(stat = "summary",
             fun.y = "mean")+
  geom_smooth(method = 'lm')





## Adding a regression line

levels(animals$sex) <- c('Female', 'Male')
animals_dm <- filter(animals, ...)
ggplot(...,
       aes(x = year, y = weight)) +
  geom_point(...,
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  ...

ggplot(data = animals_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(...)

ggplot(data = animals_dm,
       aes(...,
           ...,
           ...) + 
  geom_point(aes(shape = sex),
             size = 3,
	           stat = 'summary',
	           fun.y = 'mean') +
  geom_smooth(method = 'lm')

# Storing and re-plotting

year_wgt <- ggplot(data = DM,
                   aes(x = year,
                       y = weight,
                       color = sex)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean")) +   geom_smooth(method = "lm")

year_wgt +  scale_color_manual(values = c("darkblue", "orange"))



## Exercise 2

year_wgt <- ggplot(data = DM,
                   aes(x = weight,
                       fill = sex)) + 
  geom_histogram(binwidth  = 5)

year_wgt +  scale_color_manual(values = c("darkblue", "orange"))


  


## Axes, labels and themes

histo <- ggplot(data = DM,
                aes(x = weight, fill = sex)) +
  geom_histogram(binwidth = 3, color = "white")

histo

histo <- histo + 
  labs(title = "Dipodomys merriami weight distribution",
       x = "Weight (g)",
       y = "Count") +
  scale_x_continuous(limits = c(20, 60),
                     breaks = c(20, 30, 40, 50, 60))
histo

histo <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1), 
        axis.title.x = element_text(size = 13, vjust = 1))
histo

## Facets

###################################################

animals_common <- filter(animals, species_id %in% c('DM', 'PP', 'DO'))
ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species", 
       x = "Count",
       y = "Weight (g)")

############################################

ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram(data = select(animals_common, -species_id),
                 alpha = 0.2) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

###########################################################
ggplot(data = animals_common,
       aes(x = weight, ...)) +
  geom_histogram(...) +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)		

## Exercise 3

...

