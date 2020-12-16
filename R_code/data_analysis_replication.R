library(memisc)
library(stargazer)
library(reshape)
library(plyr)
library(xtable)
library(ggplot2)
library(effects)
library(lme4)
library(gplots)
library(plm)
library(car)
library(scales)


###############
#LOAD THE DATA
###############

data <- read.csv("data/data_paper5.csv",sep=",")

###################
#DATA DESCRIPTION
###################

# alpha = ISO Country code 
# year = Year
# country.x = Country name
# dm.output = Absolute number of data mining papers
# total.output = Absolute number of research output
# dm.share = Share of papers on data mining (dm.output / total.output)*1000
# category2 = Level of copyright restriction
# NY.GDP.PCAP.KD = GDP/capita ($)
# RL.EST = Level of Rule of Law 
# SP.POP.TOTL = Country population size


###############
#DATA MUNGING
###############

#Only observations after 1991
data <- subset(data,data$year>1991)

#Set the reference category for the main independent variable
data$category2 <- relevel(data$category2,ref="restricted")

#Transform GDP/capita into $1,000 units
data$gdp.cap.k <- sapply(data$NY.GDP.PCAP.KD, function(x) x/1000)
data$gdp.cap.k <- data$NY.GDP.PCAP.KD/1000

#Set year as a categorical variable
data$year <- as.factor(data$year)

#Create variable for EU-15 membership
data$eu15 <- ifelse(data$alpha=="AT" |
                      data$alpha=="BE" |
                      data$alpha=="DK" |
                      data$alpha=="FI" |
                      data$alpha=="FR" |
                      data$alpha=="DE" |
                      data$alpha=="GR" |
                      data$alpha=="IE" |
                      data$alpha=="IT" |
                      data$alpha=="NL" |
                      data$alpha=="PT" |
                      data$alpha=="ES" |
                      data$alpha=="SE" |
                      data$alpha=="GB",
                    c("1"), c("0"))

#Logarithmic transformation of population and total research output variables
data$log.pop <- log(data$SP.POP.TOTL)
data$log.output <- log(data$total.output)


###############################
#PANEL DATA REGRESSION MODELS
###############################

library(plm)

#We fit a random effects model due to the relevance of time invariant variables in the models
m2h <- plm(dm.share~category2,data=data, index=c("alpha","year"),model="random")

m2j <- update(m2h,.~. + gdp.cap.k + log.pop + RL.EST)

m2jb <- update(m2j,.~. + eu15)

m2k <- update(m2jb,.~. + log.output)

m2l <- update(m2k,.~. + RL.EST*category2)


#Regression table
library(stargazer)

stargazer(m2h,m2j,m2jb,m2k, m2l,type="text",no.space=TRUE)


