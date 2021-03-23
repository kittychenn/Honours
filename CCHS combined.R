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

#### Length of time in Canada SDCGRES ####
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
IS2001$Year <- 2001
IS2003 <- rec_with_table(cchs2003, "SDCFIMM", log = TRUE  )
IS2003$Year <- 2003
IS2005 <- rec_with_table(cchs2005, "SDCFIMM", log = TRUE  )
IS2005$Year <- 2005
IS2007_2008 <- rec_with_table(cchs2007_2008, "SDCFIMM", log = TRUE  )
IS2007_2008$Year <- 2007
IS2009_2010 <- rec_with_table(cchs2009_2010, "SDCFIMM", log = TRUE  )
IS2009_2010$Year <- 2009
IS2011_2012 <- rec_with_table(cchs2011_2012, "SDCFIMM", log = TRUE  )
IS2011_2012$Year <- 2011
IS2013_2014 <- rec_with_table(cchs2013_2014, "SDCFIMM", log = TRUE  )
IS2013_2014$Year <- 2013

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
pct_time_combined<- bind_rows(pct_time)

get_label(pct_time_combined)
labeled_pct_time_combined <- set_data_labels(pct_time_combined,variable_details,variables)
get_label(labeled_pct_time_combined)

#### Unhealthy habits: Binge drinking, smoking, stress,  METS, Diet ####

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

get_label(Bdrinker_combined)
labeled_Bdrinker_combined <- set_data_labels(Bdrinker_combined,variable_details,variables)
get_label(labeled_Bdrinker_combined)


## Smoker 
Smoker2001 <- rec_with_table(cchs2001, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2001$year <- 2001
Smoker2003 <- rec_with_table(cchs2003, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2003$year <- 2003
Smoker2005 <- rec_with_table(cchs2005, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2005$year <- 2005
Smoker2007_2008 <- rec_with_table(cchs2007_2008, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2007_2008$year <- 2007
Smoker2009_2010 <- rec_with_table(cchs2009_2010, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2009_2010$year <- 2009
Smoker2011_2012 <- rec_with_table(cchs2011_2012, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2011_2012$year <- 2011
Smoker2013_2014 <- rec_with_table(cchs2013_2014, c("SMKG207_cont","SMK_204","SMK_01A","SMK_05B","SMK_05C","SMK_09A_cont","SMK_208","SMKDSTY","SMKG01C_cont","SMKG09C","SMKG203_cont","pack_years_der"), log = TRUE  )
Smoker2013_2014$year <- 2013

Smoker <- list(Smoker2001, Smoker2003, Smoker2005, Smoker2007_2008, Smoker2009_2010,Smoker2011_2012, Smoker2013_2014)
Smoker_combined <- bind_rows(Smoker)

get_label(Smoker_combined)
labeled_Smoker_combined <- set_data_labels(Smoker_combined,variable_details,variables)
get_label(labeled_Smoker_combined)

## Stress	GEN_07
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

## METS PACDEE
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

get_label(METS_combined)
labeled_METS_combined <- set_data_labels(METS_combined,variable_details,variables)
get_label(labeled_METS_combined)

## F/V FVCDTOT
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

get_label(FV_combined)
labeled_FV_combined <- set_data_labels(FV_combined,variable_details,variables)
get_label(labeled_FV_combined)

#### Recommended Variables for PBL ####
REC2001 <- rec_with_table(cchs2001, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2003 <- rec_with_table(cchs2003, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2005 <- rec_with_table(cchs2005, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2007_2008 <- rec_with_table(cchs2007_2008, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2009_2010 <- rec_with_table(cchs2009_2010, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2011_2012 <- rec_with_table(cchs2011_2012, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )
REC2013_2014 <- rec_with_table(cchs2013_2014, c("WTS_M","DHHGAGE_cont","DHHGAGE_C","ALWDWKY","CCC_071","CCC_091","CCC_101","CCC_121","CCC_131","CCC_151","CCC_280","EDUDR04","HWTGBMI","SDCGCGT"), log = TRUE  )

REC <- list(REC2001, REC2003, REC2005, REC2007_2008, REC2009_2010,REC2011_2012, REC2013_2014)
REC_combined <- bind_rows(REC)

REC_combined <- REC_combined %>%
  mutate(DHHGAGE=replace_na(DHHGAGE_C,3))  # NA for 18-19 year old category (3) therefore mutate


get_label(REC_combined)
labeled_REC_combined <- set_data_labels(REC_combined,variable_details,variables)
get_label(labeled_REC_combined)

#### COMBINED ####
combined <-cbind(labeled_Time_in_Canada_combined,labeled_Bdrinker_combined, labeled_METS_combined, labeled_Smoker_combined, labeled_Stress_combined, labeled_IS_combined, labeled_FV_combined,labeled_REC_combined, labeled_pct_time_combined)
get_label(combined)
labeled_combined <- set_data_labels(combined,variable_details,variables)
get_label(labeled_combined)

labeled_Time_in_Canada_combined[,c('data_name','year')] <- NULL
labeled_Bdrinker_combined[,c('date_year','year')] <- NULL
labeled_METS_combined[,c('date_year','year')] <- NULL
labeled_Smoker_combined[,c('date_year','year')] <- NULL
labeled_Stress_combined[,c('date_year','year')] <- NULL
labeled_FV_combined[,c('date_year','year')] <- NULL

combined <-cbind(labeled_Time_in_Canada_combined,labeled_Bdrinker_combined, labeled_METS_combined, labeled_Smoker_combined, labeled_Stress_combined, labeled_IS_combined, labeled_FV_combined, labeled_REC_combined, labeled_pct_time_combined)

#### Population greater than 20 ####
combined_age <- subset(combined,DHHGAGE_cont >=20)

# refer to PBL modification when uploading csv to PBL calculator
# refer to Diet function.R and Smoking function.R to include diet score and pack-year cols

#### Prevalence (not necessary) ####
combined <- combined %>%
  mutate(Prevalence=as.numeric(ifelse(Year==2001,WTS_M/25787334,
                                      ifelse(Year==2003, WTS_M/26555430,
                                             ifelse(Year==2005, WTS_M/27126165,
                                                    ifelse(Year==2007, WTS_M/28017372,
                                                           ifelse(Year==2009,WTS_M/28725105,
                                                                  ifelse(Year==2011,WTS_M/29335211,
                                                                         ifelse(Year==2013,WTS_M/30002838,"missing")))))))))

#### Population ####

##Pop number by Year (unweighted)
pop2001 <- sum(combined_age$Year== "2001")
pop2003 <- sum(combined_age$Year== "2003")
pop2005 <- sum(combined_age$Year== "2005")
pop2007_2008 <- sum(combined_age$Year== "2007")
pop2009_2010 <- sum(combined_age$Year== "2009")
pop2011_2012 <- sum(combined_age$Year== "2011")
pop2013_2014 <- sum(combined_age$Year== "2013")

pop <- c(pop2001,pop2003,pop2005,pop2007_2008,pop2009_2010,pop2011_2012,pop2013_2014)


##Pop number by Year (weighted)
Wpop2001 <- combined_age %>%
  filter(Year == "2001") %>%
  summarise(sum(WTS_M))

Wpop2003 <- combined_age %>%
  filter(Year == "2003") %>%
  summarise(sum(WTS_M))

Wpop2005 <- combined_age %>%
  filter(Year == "2005") %>%
  summarise(sum(WTS_M))

Wpop2007_2008 <- combined_age %>%
  filter(Year == "2007") %>%
  summarise(sum(WTS_M))

Wpop2009_2010 <- combined_age %>%
  filter(Year == "2009") %>%
  summarise(sum(WTS_M))

Wpop2011_2012 <- combined_age %>%
  filter(Year == "2011") %>%
  summarise(sum(WTS_M))

sum(is.na(REC2013_2014$WTS_M)) # 3 NA in the 2013 weights when using flow but no NA is cchs2013_2014 #

combined_age$WTS_M[is.na(combined_age$WTS_M)] <- 99999
combined_age <- combined_age %>%
  mutate(WTS_M=replace(WTS_M,WTS_M == 99999 & HWTGBMI == 25.14, 1.07))%>%
  mutate(WTS_M=replace(WTS_M,WTS_M == 99999 & HWTGBMI == 23.83, 1.07)) %>%
  mutate(WTS_M=replace(WTS_M, WTS_M== 99999 & HWTGBMI == 26.91, 22.2))

Wpop2013_2014 <- combined_age %>%
  filter(Year == "2013") %>%
  summarise(sum(WTS_M)) 

Wpop <- as.integer(c(Wpop2001,Wpop2003,Wpop2005,Wpop2007_2008,Wpop2009_2010,Wpop2011_2012,Wpop2013_2014))


#### CDN Born
CDN <- subset(combined_age,SDCFIMM== "2") #immigrant status - non
#### Immigrant
IG <- subset(combined_age,SDCFIMM== "1") #immigrant status - immigrant
