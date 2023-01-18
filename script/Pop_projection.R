# Reshaping Rwanda Population Projection Data
#--------------------------------------------

# Importing needed libraries
library("tidyverse")
library("readxl")
library("janitor")

# Working directory
#getwd()
#setwd("C:/Users/ENVYLL/Downloads")

# Reading excel Rwanda Population data
pop_rwanda <- readxl::read_excel("pop_data/pop_projection_data.xlsx", col_names=TRUE, .name_repair = "minimal")

#Create long dataframe with year, population and age group
year <- pop_rwanda %>%
          pivot_longer(cols = !'5 year age group', names_to="Year", values_to = "Population")%>%
          drop_na()%>%
          select(Year, '5 year age group', Population)


#Create long data frame with sex, population and age group

sex <- pop_rwanda %>%
          row_to_names(row_number=1, remove_row = TRUE)
#change NA column name
colnames(sex)[1]  <- '5 year age group'
#make data long
sex <- sex %>%
      pivot_longer(cols = !'5 year age group', names_to="Sex", values_to = "Population")%>%
      select('5 year age group', Population, Sex)

#Combine data frames using population and age group as an index
combined <- sex %>%
        inner_join(year, by = c('5 year age group', 'Population'))

