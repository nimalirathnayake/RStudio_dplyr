#practice using logical operators

1=1
1==1
1==2
1!=2
1>0
1==c(1,2,3,1,3)
#importing the data and creating an object
gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

#Exploring the data set
dim(gapminder) #dim stands for dimensions
str(gapminder) #str stands for structure, use F1 to get help, here (gapminder) is the argument

#Install package(only once per computer)
install.packages("dplyr")
#load a package anytim you want ot use apackage
library(dplyr)
# function select, first give the name of datasource whcih is gapminder in here and the parameters want to select
#select(gapminder,year,country,gdpPercap)
gap_minder <- select(gapminder, year, country, gdpPercap)
 #Challenge
#Explore dataset Storms which is a part of the dplyr package
View(storms)
dim(storms)
str(storms)
?storms
#selecting variable from the storm dataset
storms_sub <- select(storms, name,year,status,category)
# Filtering observations depending on conditions
Australia <- filter(gapminder, country=="Australia") # This will filter all the details only for Australia
#Column are the variables and Rows are the observations

#filtering observations from storms
Tropical_storm <- filter(storms,status=="tropical storm")

#Arrange function for ascending 
arrange(gapminder,lifeExp)
#Descending/sorting dataset
arrange(gapminder,desc(lifeExp))

#For the storm dataset arrange

category_sort <- arrange(storms, desc(category))

#Mutate for creating new variables
gap_gdp <- mutate(gapminder,gdp=gdpPercap*pop)

View(storms)
rm(storms) #If you replace just remove to get the original data set
View(storms)

#pipiping
storm_mks <- storms %>% mutate(wind=wind*1.852)

#Group observations by continent
group_by(gapminder,continent)
gapminder %>% group_by(continent)

#Calculate mean lifr expectency
gapminder %>% summarise(meanLE=mean(lifeExp))


#Combining functions
gapminder %>% 
  filter(Year==2007)%>%
  group_by(continet)%>%
  summarise(pop=sum(pop))

#Writing the code above in nested form
summarise((group_by((filter(gapminder,year==2007)),continent)), pop=sum(pop))
#data set starwars
View(starwars)
starwars %>%
  group_by(homeworld) %>%
  summarise(height = mean(height))







