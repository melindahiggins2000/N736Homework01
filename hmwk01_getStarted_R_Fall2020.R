# Getting started
# Homework 01 - Fall 2020

# read in the dataset =====
# load tidyverse and readxl packages
library(tidyverse)
library(readxl)

# used read_excel() from the readxl package
dat <- read_excel("Dataset_02_fixq2.xlsx")

# get basic summary stats =====
# look for missing values NAs and 
# other extremes - look at min and max
# also compare mean and median
summary(dat)

# also look at distributions =====
# use ggplot2 and geom_histogram()
dat %>%
  ggplot() + 
  geom_histogram(mapping = aes(x = Age), 
                 binwidth = 5)
dat %>%
  ggplot() + 
  geom_histogram(mapping = aes(x = q1))
# for smaller sample sizes, dot plots can be useful
dat %>%
  ggplot() + 
  geom_dotplot(mapping = aes(x = q1))

# ON YOUR OWN =====
# add code here to make histograms or dotplots of the other variables




# check values for ordinal or categorical variables =====
# use the table() function
# with the useNA="ifany" option to see missing values
table(dat$SES, useNA = "ifany")
table(dat$GenderSTR, useNA = "ifany")
# notice that the blank value for GenderSTR was set to missing
table(dat$GenderCoded, useNA = "ifany")
table(dat$q1, useNA = "ifany")
table(dat$q2, useNA = "ifany")
table(dat$q3, useNA = "ifany")
table(dat$q4, useNA = "ifany")
table(dat$q5, useNA = "ifany")

# set 9 and 99 for age to missing
# ifelse(test, yes, no) function is useful
dat$age = ifelse(dat$age == 9, 
                 NA,
                 ifelse(dat$age == 99,
                        NA,
                        dat$age))

# recode 11 to 1 for q1 - fix typo of 11
dat$q1 = ifelse(dat$q1 == 11, 1, dat$q1)

# ON YOUR OWN =====
# try this for the other typos to fix
# 40 in q4 and 2.6 for Height






# use factor to add labels =====
# also any levels not defined will be set to missing
# can be an easy way to recode on fly the 9s and 99s

# q3 BEFORE recoding
table(dat$q3, useNA = "ifany")

# recode q3 and add labels and levels
dat$q3 <- factor(dat$q3,
                 levels = c(1,2,3,4,5),
                 labels = c("none of the time",
                            "a little of the time",
                            "some of the time",
                            "a lot of the time",
                            "all of the time"))

# q3 AFTER recoding - notice the 3 9s have moved to NAs
# there are now 4 NAs instead of 3 9s and 1 NA
table(dat$q3, useNA = "ifany")

# Do for other ordinal and categorical data
# for example SES, GenderCoded, and q1-q5 likert scales
# apply the labels and levels using the factor() function
dat$SES <- factor(dat$SES, 
                  levels = c(1,2,3),
                  labels = c("Low Income",
                             "Average Income", 
                             "High Income"))
dat$GenderCoded <- factor(dat$GenderCoded, 
                          levels = c(1,2),
                          labels = c("Male","Female"))
dat$q1 <- factor(dat$q1,
                 levels = c(1,2,3,4,5),
                 labels = c("none of the time",
                            "a little of the time",
                            "some of the time",
                            "a lot of the time",
                            "all of the time"))
dat$q2 <- factor(dat$q2,
                 levels = c(1,2,3,4,5),
                 labels = c("none of the time",
                            "a little of the time",
                            "some of the time",
                            "a lot of the time",
                            "all of the time"))
dat$q4 <- factor(dat$q4,
                 levels = c(1,2,3,4,5),
                 labels = c("none of the time",
                            "a little of the time",
                            "some of the time",
                            "a lot of the time",
                            "all of the time"))
dat$q5 <- factor(dat$q5,
                 levels = c(1,2,3,4,5),
                 labels = c("none of the time",
                            "a little of the time",
                            "some of the time",
                            "a lot of the time",
                            "all of the time"))

# run tables again to check
table(dat$SES, useNA = "ifany")
table(dat$GenderSTR, useNA = "ifany")
table(dat$GenderCoded, useNA = "ifany")
table(dat$q1, useNA = "ifany")
table(dat$q2, useNA = "ifany")
table(dat$q3, useNA = "ifany")
table(dat$q4, useNA = "ifany")
table(dat$q5, useNA = "ifany")

# It is possible to clean up "string" or "text"
# entries using the facotr() function
# let's see of we can clean up GenderSTR

# first create a new factor variable
dat$GenderSTR_clean <- factor(dat$GenderSTR)

# collapse original variations into either Female or Male
levels(dat$GenderSTR_clean) <- 
  list("Female"=c("f", "F", "female"), 
       "Male"=c("m", "M", "male", "Male"))

# check
table(dat$GenderSTR, useNA = "ifany")
table(dat$GenderSTR_clean, useNA = "ifany")
