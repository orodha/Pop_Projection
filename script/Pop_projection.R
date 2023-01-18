# Reshaping Rwanda Population Projection Data
#--------------------------------------------

# Importing needed libraries
library("tidyverse")
library("readxl")

# Working directory
getwd()
setwd("C:/Users/ENVYLL/Downloads")

# Reading excel Rwanda Population data
pop_rwanda <- readxl::read_excel("dataset_melt.xlsx")
pop_rwanda
