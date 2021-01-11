## CCHS Data
cchs2001 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2001-c1-1-general-file_F1.csv")
cchs2003 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2003-c2-1-GeneralFile_F1.csv")
cchs2005 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2005-c3-1-main-file_F1.csv")
cchs2007_2008 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2007-2008-AnnualComponent_F1.csv")
cchs2009_2010 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2009-2010-AnnualComponent_F1.csv")
cchs2011_2012 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2011-2012-Annual-Component_F1.csv")
cchs2013_2014 <- read.csv("~/Undergrad/Honours/cchs-82M0013-E-2013-2014-Annual-Component_F1.csv")

###
library(cchsflow)
library(dplyr)
library(tidyr)

#### Length of time in Canada (2001-2013) ####
Ctime2001 <- rec_with_table(cchs2001, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2001$year <- 2001
Ctime2003 <- rec_with_table(cchs2003, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2003$year <- 2003
Ctime2005 <- rec_with_table(cchs2005, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2005$year <- 2005
Ctime2007_2008 <- rec_with_table(cchs2007_2008, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2007_2008$year <- 2007
Ctime2009_2010 <- rec_with_table(cchs2009_2010, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2009_2010$year <- 2009
Ctime2011_2012 <- rec_with_table(cchs2011_2012, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2011_2012$year <- 2011
Ctime2013_2014 <- rec_with_table(cchs2013_2014, "SDCGRES", log = TRUE, attach_data_name = TRUE)
Ctime2013_2014$year <- 2013

Time_in_Canada <- list(Ctime2001, Ctime2003, Ctime2005, Ctime2007_2008, Ctime2009_2010,Ctime2011_2012, Ctime2013_2014)

Time_in_Canada_combined<- bind_rows(Time_in_Canada)

get_label(Time_in_Canada_combined)
labeled_Time_in_Canada_combined <- set_data_labels(Time_in_Canada_combined,variable_details,variables)
get_label(labeled_Time_in_Canada_combined)

## Immigrant Status SDCFIMM
IS2001 <- rec_with_table(cchs2001, "SDCFIMM", log = TRUE  )
IS2001$year <- 2001
IS2003 <- rec_with_table(cchs2003, "SDCFIMM", log = TRUE  )
IS2003$year <- 2003
IS2005 <- rec_with_table(cchs2005, "SDCFIMM", log = TRUE  )
IS2005$year <- 2005
IS2007_2008 <- rec_with_table(cchs2007_2008, "SDCFIMM", log = TRUE  )
IS2007_2008$year <- 2007
IS2009_2010 <- rec_with_table(cchs2009_2010, "SDCFIMM", log = TRUE  )
IS2009_2010$year <- 2009
IS2011_2012 <- rec_with_table(cchs2011_2012, "SDCFIMM", log = TRUE  )
IS2011_2012$year <- 2011
IS2013_2014 <- rec_with_table(cchs2013_2014, "SDCFIMM", log = TRUE  )
IS2013_2014$year <- 2013

IS <- list(IS2001, IS2003, IS2005, IS2007_2008, IS2009_2010,IS2011_2012, IS2013_2014)
IS_combined<- bind_rows(IS)

get_label(IS_combined)
labeled_IS_combined <- set_data_labels(IS_combined,variable_details,variables)
get_label(labeled_IS_combined)

## Percentage of time in Canada 
pct_time2001 <- rec_with_table(cchs2001, c("DHHGAGE_cont","SDCGCBG", "SDCGRES","pct_time_der"),log=TRUE, attach_data_name = TRUE)
pct_time2001$year <- 2001
pct_time2003 <- rec_with_table(cchs2003, c("DHHGAGE_cont", "SDCGCBG", "SDCGRES", "pct_time_der"), log = TRUE, attach_data_name = TRUE)
pct_time2003$year <- 2003
pct_time2005 <- rec_with_table(cchs2005, c("DHHGAGE_cont", "SDCGCBG", "SDCGRES", "pct_time_der"), log = TRUE, attach_data_name = TRUE)
pct_time2005$year <- 2005
pct_time2007_2008 <- rec_with_table(cchs2007_2008, c("DHHGAGE_cont", "SDCGCBG", "SDCGRES", "pct_time_der"), log = TRUE, attach_data_name = TRUE)
pct_time2007_2008$year <- 2007
pct_time2009_2010 <- rec_with_table(cchs2009_2010, c("DHHGAGE_cont", "SDCGCBG", "SDCGRES", "pct_time_der"), log = TRUE, attach_data_name = TRUE)
pct_time2009_2010$year <- 2009
pct_time2011_2012 <- rec_with_table(cchs2011_2012, c("DHHGAGE_cont", "SDCGCBG", "SDCGRES", "pct_time_der"), log = TRUE, attach_data_name = TRUE)
pct_time2011_2012$year <- 2011
pct_time2013_2014 <- rec_with_table(cchs2013_2014, c("DHHGAGE_cont", "SDCGCBG", "SDCGRES", "pct_time_der"), log = TRUE, attach_data_name = TRUE)
pct_time2013_2014$year <- 2013

pct_time <- list(pct_time2001, pct_time2003, pct_time2005, pct_time2007_2008, pct_time2009_2010,pct_time2011_2012, pct_time2013_2014)

pct_time <- list(pct_time2001, pct_time2003, pct_time2005, pct_time2007_2008, pct_time2009_2010,pct_time2011_2012, pct_time2013_2014) 
pct_time_combined<- bind_rows(pct_time)

get_label(pct_time_combined)
labeled_pct_time_combined <- set_data_labels(pct_time_combined,variable_details,variables)
get_label(labeled_pct_time_combined)

#### Unhealthy habits: Binge drinking, smoking, stress, BMI, METS, Diet ####

## Binge drinker
Bdrinker2001 <- rec_with_table(cchs2001, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2001$year <- 2001
Bdrinker2003 <- rec_with_table(cchs2003, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2003$year <- 2003
Bdrinker2005 <- rec_with_table(cchs2005, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2005$year <- 2005
Bdrinker2007_2008 <- rec_with_table(cchs2007_2008, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2007_2008$year <- 2007
Bdrinker2009_2010 <- rec_with_table(cchs2009_2010, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2009_2010$year <- 2009
Bdrinker2011_2012 <- rec_with_table(cchs2011_2012, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2011_2012$year <- 2011
Bdrinker2013_2014 <- rec_with_table(cchs2013_2014, c(   "ALW_1", "DHH_SEX", "ALW_2A1", "ALW_2A2", "ALW_2A3", "ALW_2A4",   "ALW_2A5", "ALW_2A6", "ALW_2A7", "binge_drinker"), log = TRUE  )
Bdrinker2013_2014$year <- 2013

Bdrinker <- list(Bdrinker2001, Bdrinker2003, Bdrinker2005, Bdrinker2007_2008, Bdrinker2009_2010,Bdrinker2011_2012, Bdrinker2013_2014)
Bdrinker_combined <- bind_rows(Bdrinker)
Bdrinker_combined

get_label(Bdrinker_combined)
labeled_Bdrinker_combined <- set_data_labels(Bdrinker_combined,variable_details,variables)
get_label(labeled_Bdrinker_combined)


## Smoker? SMK_204
Smoker2001 <- rec_with_table(cchs2001, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2001$year <- 2001
Smoker2003 <- rec_with_table(cchs2003, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2003$year <- 2003
Smoker2005 <- rec_with_table(cchs2005, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2005$year <- 2005
Smoker2007_2008 <- rec_with_table(cchs2007_2008, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2007_2008$year <- 2007
Smoker2009_2010 <- rec_with_table(cchs2009_2010, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2009_2010$year <- 2009
Smoker2011_2012 <- rec_with_table(cchs2011_2012, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont"), log = TRUE  )
Smoker2011_2012$year <- 2011
Smoker2013_2014 <- rec_with_table(cchs2013_2014, c("SMK_09A_B","SMKG207_cont","SMK_204","DHHGAGE_cont","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont"), log = TRUE  )
Smoker2013_2014$year <- 2013

Smoker <- list(Smoker2001, Smoker2003, Smoker2005, Smoker2007_2008, Smoker2009_2010,Smoker2011_2012, Smoker2013_2014)
Smoker_combined <- bind_rows(Smoker)

get_label(Smoker_combined)
labeled_Smoker_combined <- set_data_labels(Smoker_combined,variable_details,variables)
get_label(labeled_Smoker_combined)

## Stress? 	GEN_07
Stress2001 <- rec_with_table(cchs2001, "GEN_07", log = TRUE  )
Stress2001$year <- 2001
Stress2003 <- rec_with_table(cchs2003, "GEN_07", log = TRUE  )
Stress2003$year <- 2003
Stress2005 <- rec_with_table(cchs2005, "GEN_07", log = TRUE  )
Stress2005$year <- 2005
Stress2007_2008 <- rec_with_table(cchs2007_2008, "GEN_07", log = TRUE  )
Stress2007_2008$year <- 2007
Stress2009_2010 <- rec_with_table(cchs2009_2010, "GEN_07", log = TRUE  )
Stress2009_2010$year <- 2009
Stress2011_2012 <- rec_with_table(cchs2011_2012, "GEN_07", log = TRUE  )
Stress2011_2012$year <- 2011
Stress2013_2014 <- rec_with_table(cchs2013_2014, "GEN_07", log = TRUE  )
Stress2013_2014$year <- 2013

Stress <- list(Stress2001, Stress2003, Stress2005, Stress2007_2008, Stress2009_2010,Stress2011_2012, Stress2013_2014)
Stress_combined <- bind_rows(Stress)

get_label(Stress_combined)
labeled_Stress_combined <- set_data_labels(Stress_combined,variable_details,variables)
get_label(labeled_Stress_combined)

## METS? PACDEE
METS2001 <- rec_with_table(cchs2001, "PACDEE", log = TRUE )
METS2001$year <- 2001
METS2003 <- rec_with_table(cchs2003, "PACDEE", log = TRUE  )
METS2003$year <- 2003
METS2005 <- rec_with_table(cchs2005, "PACDEE", log = TRUE  )
METS2005$year <- 2005
METS2007_2008 <- rec_with_table(cchs2007_2008, "PACDEE", log = TRUE  )
METS2007_2008$year <- 2007
METS2009_2010 <- rec_with_table(cchs2009_2010, "PACDEE", log = TRUE  )
METS2009_2010$year <- 2009
METS2011_2012 <- rec_with_table(cchs2011_2012, "PACDEE", log = TRUE  )
METS2011_2012$year <- 2011
METS2013_2014 <- rec_with_table(cchs2013_2014, "PACDEE", log = TRUE  )
METS2013_2014$year <- 2013

METS <- list(METS2001, METS2003, METS2005, METS2007_2008, METS2009_2010,METS2011_2012, METS2013_2014)
METS_combined <- bind_rows(METS)
METS_combined

get_label(METS_combined)
labeled_METS_combined <- set_data_labels(METS_combined,variable_details,variables)
get_label(labeled_METS_combined)

## F/V? FVCDTOT
FV2001 <- rec_with_table(cchs2001, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2001$year <- 2001
FV2003 <- rec_with_table(cchs2003, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2003$year <- 2003
FV2005 <- rec_with_table(cchs2005, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2005$year <- 2005
FV2007_2008 <- rec_with_table(cchs2007_2008, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2007_2008$year <- 2007
FV2009_2010 <- rec_with_table(cchs2009_2010, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2009_2010$year <- 2009
FV2011_2012 <- rec_with_table(cchs2011_2012, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2011_2012$year <- 2011
FV2013_2014 <- rec_with_table(cchs2013_2014, c("FVCDCAR","FVCDFRU","FVCDJUI","FVCDPOT","FVCDSAL", "FVCDVEG","FVCDTOT"), log = TRUE  )
FV2013_2014$year <- 2013

FV <- list(FV2001, FV2003, FV2005, FV2007_2008, FV2009_2010,FV2011_2012, FV2013_2014)
FV_combined <- bind_rows(FV)
FV_combined

get_label(FV_combined)
labeled_FV_combined <- set_data_labels(FV_combined,variable_details,variables)
get_label(labeled_FV_combined)

#### Recommended Variables for PBL ####
REC2001 <- rec_with_table(cchs2001, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2003 <- rec_with_table(cchs2003, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2005 <- rec_with_table(cchs2005, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2007_2008 <- rec_with_table(cchs2007_2008, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2009_2010 <- rec_with_table(cchs2009_2010, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2011_2012 <- rec_with_table(cchs2011_2012, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2013_2014 <- rec_with_table(cchs2013_2014, c("WTS_M","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )

REC <- list(REC2001, REC2003, REC2005, REC2007_2008, REC2009_2010,REC2011_2012, REC2013_2014)
REC_combined <- bind_rows(REC)

REC_combined <- REC_combined %>%
  mutate(DHHGAGE=replace_na(DHHGAGE_C,3))  # NA for 18-19 year old category (3) therefore mutate


get_label(REC_combined)
labeled_REC_combined <- set_data_labels(REC_combined,variable_details,variables)
get_label(labeled_REC_combined)

#### COMBINED ####
combined <-cbind(labeled_Time_in_Canada_combined,labeled_Bdrinker_combined, labeled_METS_combined, labeled_Smoker_combined, labeled_Stress_combined, labeled_IS_combined, labeled_FV_combined,labeled_REC_combined)
get_label(combined)
labeled_combined <- set_data_labels(combined,variable_details,variables)
get_label(labeled_combined)

labeled_Time_in_Canada_combined[,c('data_name','year')] <- NULL
labeled_Bdrinker_combined[,c('date_year','year')] <- NULL
labeled_METS_combined[,c('date_year','year')] <- NULL
labeled_Smoker_combined[,c('date_year','year')] <- NULL
labeled_Stress_combined[,c('date_year','year')] <- NULL
labeled_FV_combined[,c('date_year','year')] <- NULL

combined <-cbind(labeled_Time_in_Canada_combined,labeled_Bdrinker_combined, labeled_METS_combined, labeled_Smoker_combined, labeled_Stress_combined, labeled_IS_combined, labeled_FV_combined, labeled_REC_combined)

# refer to PBL modification 

#### Population ####

##Pop number by year (unweighted)
pop2001 <- sum(combined$year== "2001")
pop2003 <- sum(combined$year== "2003")
pop2005 <- sum(combined$year== "2005")
pop2007_2008 <- sum(combined$year== "2007")
pop2009_2010 <- sum(combined$year== "2009")
pop2011_2012 <- sum(combined$year== "2011")
pop2013_2014 <- sum(combined$year== "2013")

pop <- c(pop2001,pop2003,pop2005,pop2007_2008,pop2009_2010,pop2011_2012,pop2013_2014)

##Pop number by year (weighted)
Wpop2001 <- combined %>%
  filter(year == "2001") %>%
  summarise(sum(WTS_M))

Wpop2003 <- combined %>%
  filter(year == "2003") %>%
  summarise(sum(WTS_M))

Wpop2005 <- combined %>%
  filter(year == "2005") %>%
  summarise(sum(WTS_M))

Wpop2007_2008 <- combined %>%
  filter(year == "2007") %>%
  summarise(sum(WTS_M))

Wpop2009_2010 <- combined %>%
  filter(year == "2009") %>%
  summarise(sum(WTS_M))

Wpop2011_2012 <- combined %>%
  filter(year == "2011") %>%
  summarise(sum(WTS_M))

sum(is.na(REC2013_2014$WTS_M)) # 3 NA in the 2013 weights when using flow but no NA is cchs2013_2014 #

# fix WTS_M NA in 2013
combined$WTS_M[is.na(combined$WTS_M)] <- 99999
combined <- combined %>%
  mutate(WTS_M=replace(WTS_M,WTS_M == 99999 & HWTGBMI == 25.14, 1.07))%>%
  mutate(WTS_M=replace(WTS_M,WTS_M == 99999 & HWTGBMI == 23.83, 1.07)) %>%
  mutate(WTS_M=replace(WTS_M, WTS_M== 99999 & HWTGBMI == 26.91, 22.2))

Wpop2013_2014 <- combined %>%
  filter(year == "2013") %>%
  summarise(sum(WTS_M)) 

Wpop <- as.integer(c(Wpop2001,Wpop2003,Wpop2005,Wpop2007_2008,Wpop2009_2010,Wpop2011_2012,Wpop2013_2014))

#### CDN Born
CDN <- subset(combined,SDCFIMM== "2") #immigrant status - non
#### Immigrant
IG <- subset(combined,SDCFIMM== "1") #immigrant status - immigrant


#### Pop by behaviour ####
#High stress (4,5)
ss <- c(4,5)
StressCDN <- CDN %>% 
  filter(GEN_07 %in% ss) %>%
  select(year,GEN_07,WTS_M) %>%
  group_by(year,GEN_07)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(GEN_07,Total)%>%
  rename('Quite a bit'='4',Extremely='5') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

StressIG <- IG %>%
  filter(GEN_07 %in% ss) %>%
  select(year,GEN_07,WTS_M) %>%
  group_by(year,GEN_07)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(GEN_07,Total)%>%
  rename('Quite a bit'='4',Extremely='5') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_StressIG <- IG %>%
  filter(GEN_07 %in% ss) %>%
  select(year,SDCGRES,GEN_07,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1','10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_StressIG1 <- IG %>% 
  filter(GEN_07 %in% ss) %>%
  filter(SDCGRES==1)%>%
  select(year,SDCGRES,GEN_07,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_StressIG2 <- IG %>%
  filter(GEN_07 %in% ss) %>%
  filter(SDCGRES==2)%>%
  select(year,SDCGRES,GEN_07,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

# METS (=<1.5 for inactive)
METSCDN <- CDN %>% #
  filter(PACDEE<=1.5) %>%
  select(year,PACDEE,WTS_M) %>%
  group_by(year,PACDEE)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(PACDEE,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

METSIG <- IG %>%
  filter(PACDEE<=1.5) %>%
  select(year,PACDEE,WTS_M) %>%
  group_by(year,PACDEE)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(PACDEE,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_METSIG <-IG %>%
  filter(PACDEE<=1.5) %>%
  select(year,PACDEE,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1','10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_METSIG1 <-IG %>%
  filter(PACDEE<=1.5) %>%
  filter(SDCGRES==1)%>%
  select(year,PACDEE,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_METSIG2 <-IG %>%
  filter(PACDEE<=1.5) %>%
  filter(SDCGRES==2)%>%
  select(year,PACDEE,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

#Binge drinking (1)
BDrinkerCDN <- CDN %>%
  filter(binge_drinker==1) %>%
  select(year,binge_drinker,WTS_M) %>%
  group_by(year,binge_drinker)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(binge_drinker,Total)%>%
  rename('Binge'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

BDrinkerIG <- IG %>%
  filter(binge_drinker==1) %>%
  select(year,binge_drinker,WTS_M) %>%
  group_by(year,binge_drinker)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(binge_drinker,Total)%>%
  rename('Binge'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_BDrinkerIG <-IG %>%
  filter(binge_drinker==1) %>%
  select(year,binge_drinker,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1','10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_BDrinkerIG1 <-IG %>%
  filter(binge_drinker==1) %>%
  filter(SDCGRES==1)%>%
  select(year,binge_drinker,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_BDrinkerIG2 <-IG %>%
  filter(binge_drinker==1) %>%
  filter(SDCGRES==2)%>%
  select(year,binge_drinker,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)


#Heavy smoker (1 pack)
SmokerCDN <- CDN %>%
  filter(SMK_204>=20) %>%
  select(year,SMK_204,WTS_M) %>%
  group_by(year,SMK_204)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SMK_204,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

SmokerIG <- IG %>%
  filter(SMK_204>=20) %>%
  select(year,SMK_204,WTS_M) %>%
  group_by(year,SMK_204)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SMK_204,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_SmokerIG <-IG %>%
  filter(SMK_204>=20) %>%
  select(year,SMK_204,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1','10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_SmokerIG1 <-IG %>%
  filter(SMK_204>=20)  %>%
  filter(SDCGRES==1)%>%
  select(year,SMK_204,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_SmokerIG2 <-IG %>%
  filter(SMK_204>=20)  %>%
  filter(SDCGRES==2)%>%
  select(year,SMK_204,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

#FV (<5)
FVCDN <- CDN %>%
  filter(FVCDTOT<5) %>%
  select(year,FVCDTOT,WTS_M) %>%
  mutate(FVCDTOT=round(FVCDTOT)) %>%
  group_by(year,FVCDTOT)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(FVCDTOT,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

FVIG <- IG %>%
  filter(FVCDTOT<5) %>%
  select(year,FVCDTOT,WTS_M) %>%
  mutate(FVCDTOT=round(FVCDTOT)) %>%
  group_by(year,FVCDTOT)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(FVCDTOT,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_FVIG <- IG %>%
  filter(FVCDTOT<5) %>%
  select(year,FVCDTOT,SDCGRES,WTS_M) %>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1','10+ years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_FVIG1 <- IG %>%
  filter(FVCDTOT<5) %>%
  filter(SDCGRES==1)%>%
  select(year,FVCDTOT,SDCGRES,WTS_M)%>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

group_FVIG2 <- IG %>%
  filter(FVCDTOT<5) %>%
  filter(SDCGRES==2)%>%
  select(year,FVCDTOT,SDCGRES,WTS_M)%>%
  group_by(year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ years'='2') %>% #weight for 2013=0 because of 3 NA
  replace(is.na(.), 0) %>%
  group_by(year) %>%
  summarise_all(sum)%>%
  mutate(Prevalence=Weight/Wpop)

#### graph ####
require(ggplot2)

#Binge drinker by resettlement
ggplot()+
  geom_line(data=group_BDrinkerIG1 ,aes(x=year,y=Prevalence,color="0-9 years"))+
  geom_line(data=group_BDrinkerIG2 ,aes(x=year,y=Prevalence,color="10+ years"))


#Smoker by resettlement
ggplot()+
  geom_line(data=group_SmokerIG1 ,aes(x=year,y=Prevalence,color="0-9 years"))+
  geom_line(data=group_SmokerIG2 ,aes(x=year,y=Prevalence,color="10+ years")) +
  geom_line(data=SmokerCDN ,aes(x=year,y=Prevalence,color="CDN"))

#METS by resettlement
ggplot()+
  geom_line(data=group_METSIG1 ,aes(x=year,y=Prevalence,color="0-9 years"))+
  geom_line(data=group_METSIG2 ,aes(x=year,y=Prevalence,color="10+ years")) +
  geom_line(data=METSCDN ,aes(x=year,y=Prevalence,color="CDN"))

#Stress by resettlement
ggplot()+
  geom_line(data=group_StressIG1 ,aes(x=year,y=Prevalence,color="0-9 years"))+
  geom_line(data=group_StressIG2 ,aes(x=year,y=Prevalence,color="10+ years")) +
  geom_line(data=StressCDN, aes(x=year, y=Prevalence, color = "CDN"))

#FV by resettlement > error with 2013 for group2
ggplot()+
  geom_line(data=group_FVIG1,aes(x=year,y=Prevalence,color="0-9 years"))+
  geom_line(data=group_FVIG2,aes(x=year,y=Prevalence,color="10+ years"))+
  
  #### Reg ####
IG %>% 
  filter(SDCGRES==1|SDCGRES==2) %>% 
  filter(FVCDTOT<5) %>% 
  ggplot(aes(x =year, y=WTS_M, color= SDCGRES))+ 
  geom_point()+ 
  geom_smooth(method='lm')

IG %>% 
  filter(SDCGRES==1|SDCGRES==2) %>% 
  filter(FVCDTOT<5) %>% 
  ggplot(aes(x =year, y=WTS_M, color= SDCGRES))+ 
  geom_jitter()+ 
  geom_smooth(method='lm')
