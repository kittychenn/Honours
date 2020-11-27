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


## Smoker? SMKDSTY
Smoker2001 <- rec_with_table(cchs2001, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
Smoker2001$year <- 2001
Smoker2003 <- rec_with_table(cchs2003, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
Smoker2003$year <- 2003
Smoker2005 <- rec_with_table(cchs2005, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
Smoker2005$year <- 2005
Smoker2007_2008 <- rec_with_table(cchs2007_2008, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
Smoker2007_2008$year <- 2007
Smoker2009_2010 <- rec_with_table(cchs2009_2010, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
Smoker2009_2010$year <- 2009
Smoker2011_2012 <- rec_with_table(cchs2011_2012, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
Smoker2011_2012$year <- 2011
Smoker2013_2014 <- rec_with_table(cchs2013_2014, c(   "SMKDSTY", "DHHGAGE_cont", "SMK_09A_B", "SMKG09C",   "SMKG203_cont", "SMKG207_cont", "SMK_204", "SMK_05B", "SMK_208",   "SMK_05C", "SMK_01A", "SMKG01C_cont", "pack_years_der" ), log = TRUE  )
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

## BMI? HWTGBMI
BMI2001 <- rec_with_table(cchs2001, c("HWTGHTM", "HWTGWTK",
                                        "HWTGBMI_der"), log = TRUE  )
BMI2001$year <- 2001
BMI2003 <- rec_with_table(cchs2003, c("HWTGHTM", "HWTGWTK", "HWTGBMI_der"), log = TRUE  )
BMI2003$year <- 2003
BMI2005 <- rec_with_table(cchs2005, c("HWTGHTM", "HWTGWTK", "HWTGBMI_der"), log = TRUE  )
BMI2005$year <- 2005
BMI2007_2008 <- rec_with_table(cchs2007_2008, c("HWTGHTM", "HWTGWTK", "HWTGBMI_der"), log = TRUE  )
BMI2007_2008$year <- 2007
BMI2009_2010 <- rec_with_table(cchs2009_2010, c("HWTGHTM", "HWTGWTK", "HWTGBMI_der"), log = TRUE  )
BMI2009_2010$year <- 2009
BMI2011_2012 <- rec_with_table(cchs2011_2012, c("HWTGHTM", "HWTGWTK", "HWTGBMI_der"), log = TRUE  )
BMI2011_2012$year <- 2011
BMI2013_2014 <- rec_with_table(cchs2013_2014, c("HWTGHTM", "HWTGWTK", "HWTGBMI_der"), log = TRUE  )
BMI2013_2014$year <- 2013

BMI <- list(BMI2001, BMI2003, BMI2005, BMI2007_2008, BMI2009_2010,BMI2011_2012, BMI2013_2014)
BMI_combined <- bind_rows(BMI)

get_label(BMI_combined)
labeled_BMI_combined <- set_data_labels(BMI_combined,variable_details,variables)
get_label(labeled_BMI_combined)

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
FV2001 <- rec_with_table(cchs2001, "FVCDTOT", log = TRUE  )
FV2001$year <- 2001
FV2003 <- rec_with_table(cchs2003, "FVCDTOT", log = TRUE  )
FV2003$year <- 2003
FV2005 <- rec_with_table(cchs2005, "FVCDTOT", log = TRUE  )
FV2005$year <- 2005
FV2007_2008 <- rec_with_table(cchs2007_2008, "FVCDTOT", log = TRUE  )
FV2007_2008$year <- 2007
FV2009_2010 <- rec_with_table(cchs2009_2010, "FVCDTOT", log = TRUE  )
FV2009_2010$year <- 2009
FV2011_2012 <- rec_with_table(cchs2011_2012, "FVCDTOT", log = TRUE  )
FV2011_2012$year <- 2011
FV2013_2014 <- rec_with_table(cchs2013_2014, "FVCDTOT", log = TRUE  )
FV2013_2014$year <- 2013

FV <- list(FV2001, FV2003, FV2005, FV2007_2008, FV2009_2010,FV2011_2012, FV2013_2014)
FV_combined <- bind_rows(FV)
FV_combined

get_label(FV_combined)
labeled_FV_combined <- set_data_labels(FV_combined,variable_details,variables)
get_label(labeled_FV_combined)

#### Survey Weights ####
SW2001 <- rec_with_table(cchs2001, "WTS_M", log = TRUE  )
SW2003 <- rec_with_table(cchs2003, "WTS_M", log = TRUE  )
SW2005 <- rec_with_table(cchs2005, "WTS_M", log = TRUE  )
SW2007_2008 <- rec_with_table(cchs2007_2008, "WTS_M", log = TRUE  )
SW2009_2010 <- rec_with_table(cchs2009_2010, "WTS_M", log = TRUE  )
SW2011_2012 <- rec_with_table(cchs2011_2012, "WTS_M", log = TRUE  )
SW2013_2014 <- rec_with_table(cchs2013_2014, "WTS_M", log = TRUE  )

SW <- list(SW2001, SW2003, SW2005, SW2007_2008, SW2009_2010,SW2011_2012, SW2013_2014)
SW_combined <- bind_rows(SW)
SW_combined

get_label(SW_combined)
labeled_SW_combined <- set_data_labels(SW_combined,variable_details,variables)
get_label(labeled_SW_combined)

#### COMBINED ####
combined <-cbind(labeled_Bdrinker_combined, labeled_BMI_combined, labeled_METS_combined, labeled_Smoker_combined, labeled_Stress_combined, labeled_IS_combined, labeled_pct_time_combined,labeled_FV_combined,labeled_SW_combined)
get_label(combined)
labeled_combined <- set_data_labels(combined,variable_details,variables)
get_label(labeled_combined)

labeled_Bdrinker_combined[,c('date_year','year')] <- NULL
labeled_BMI_combined[,c('date_year','year')] <- NULL
labeled_METS_combined[,c('date_year','year')] <- NULL
labeled_Smoker_combined[,c('date_year','year')] <- NULL
labeled_Stress_combined[,c('date_year','year')] <- NULL
labeled_FV_combined[,c('date_year','year')] <- NULL
labeled_pct_time_combined[,c('date_name','year')] <- NULL

combined <-cbind(labeled_Bdrinker_combined, labeled_BMI_combined, labeled_METS_combined, labeled_Smoker_combined, labeled_Stress_combined, labeled_IS_combined, labeled_pct_time_combined, labeled_FV_combined, labeled_SW_combined)

#### CDN Born
CDN <- subset(combined,SDCFIMM== "2") #immigrant status - non
CDN1 <- subset(combined,SDCGCBG== "1") #CoB - Canada

pop2001 <- sum(combined$year== "2001")
pop2003 <- sum(combined$year== "2003")
pop2005 <- sum(combined$year== "2005")
pop2007_2008 <- sum(combined$year== "2007")
pop2009_2010 <- sum(combined$year== "2009")
pop2011_2012 <- sum(combined$year== "2011")
pop2013_2014 <- sum(combined$year== "2013")
pop <- c(pop2001,pop2003,pop2005,pop2007_2008,pop2009_2010,pop2011_2012,pop2013_2014)

#### Immigrant
IG <- subset(combined,SDCFIMM== "1") #immigrant status - immigrant 
IG1 <- subset(combined,SDCGCBG== "2") # CoB - other

#High stress (4,5) where n_CDN=1185 and n_IG=185

ss <- c(4,5)
StressCDN <- CDN %>%
  filter(GEN_07 %in% ss) %>%
  select(year,GEN_07,) %>%
  group_by(year)%>%
  count(GEN_07) %>%
  spread(GEN_07,n)%>%
  data.frame() %>%
  mutate(total=rowSums(.[2:3])) %>%
  mutate(proportion= total/pop)

StressIG <- IG %>%
  filter(GEN_07 %in% ss) %>%
  select(year,GEN_07) %>%
  group_by(year)%>%
  count(GEN_07) %>%
  spread(GEN_07,n)%>%
  data.frame() %>%
  mutate(total=rowSums(.[2:3])) %>%
  mutate(proportion= total/pop)

PStressIG <- IG %>%
  filter(GEN_07 %in% ss) %>%
  select(year,SDCGRES,GEN_07) %>%
  group_by(year,SDCGRES)%>%
  summarise(stress=n())%>%
  spread(SDCGRES,stress)

#BMI
BMICDN <- CDN %>%
  filter(HWTGBMI_der>25) %>%
  select(HWTGBMI_der,year) %>%
  mutate(HWTGBMI_der=round(HWTGBMI_der)) %>%
  group_by(year)%>%
  count(HWTGBMI_der) %>%
  spread(HWTGBMI_der,n)%>%
  mutate_all(~replace(., is.na(.), 0)) %>%
  data.frame() %>%
  mutate(total=rowSums(.[2:36])) %>%
  mutate(proportion= total/pop)

BMIIG <- IG %>%
  filter(HWTGBMI_der>25) %>%
  select(HWTGBMI_der,year) %>%
  mutate(HWTGBMI_der=round(HWTGBMI_der)) %>%
  group_by(year)%>%
  count(HWTGBMI_der) %>%
  spread(HWTGBMI_der,n)%>%
  mutate_all(~replace(., is.na(.), 0)) %>%
  data.frame() %>%
  mutate(total=rowSums(.[2:32])) %>%
  mutate(proportion= total/pop)

PBMIIG <-IG %>%
  filter(HWTGBMI_der>25) %>%
  select(year,HWTGBMI_der,SDCGRES) %>%
  group_by(year,SDCGRES)%>%
  summarise(BMI=n())%>%
  spread(SDCGRES,stress)

# METS (=<1.5 for inactive)
METSCDN <- CDN %>%
  filter(PACDEE<=1.5) %>%
  select(year,PACDEE) %>%
  group_by(year)%>%
  count(PACDEE) %>%
  spread(PACDEE,n)%>%
  data.frame() %>%
  mutate(total=rowSums(.[2:17])) %>%
  mutate(proportion= total/pop)

METSIG <- IG %>%
  filter(PACDEE<=1.5) %>%
  select(year,PACDEE) %>%
  group_by(year)%>%
  count(PACDEE) %>%
  spread(PACDEE,n)%>%
  data.frame() %>%
  mutate(total=rowSums(.[2:17])) %>%
  mutate(proportion= total/pop)

PMETSIG <-IG %>%
  filter(PACDEE<=1.5) %>%
  select(year,PACDEE,SDCGRES) %>%
  group_by(year,SDCGRES)%>%
  summarise(METS=n())%>%
  spread(SDCGRES,METS)

#Binge drinking (1)
BDrinkerCDN <- CDN %>%
  filter(binge_drinker==1) %>%
  select(year,binge_drinker) %>%
  group_by(year)%>%
  count(binge_drinker) %>%
  spread(binge_drinker,n)%>%
  data.frame() %>%
  mutate(proportion= X1/pop)

BDrinkerIG <- IG %>%
  filter(binge_drinker==1) %>%
  select(year,binge_drinker) %>%
  group_by(year)%>%
  count(binge_drinker) %>%
  spread(binge_drinker,n)%>%
  data.frame() %>%
  mutate(proportion= X1/pop)

PBDrinkerIG <-IG %>%
  filter(binge_drinker==1) %>%
  select(year,binge_drinker,SDCGRES) %>%
  group_by(year,SDCGRES)%>%
  summarise(binge=n())%>%
  spread(SDCGRES,binge)

#Heavy smoker (1 pack)
SmokerCDN <- CDN %>%
  filter(SMK_204>=20) %>%
  select(year,SMK_204) %>%
  group_by(year)%>%
  count(SMK_204) %>%
  spread(SMK_204,n)%>%
  mutate_all(~replace(., is.na(.), 0)) %>%
  data.frame() %>%
  mutate(total=rowSums(.[2:49])) %>%
  mutate(proportion= total/pop)

SmokerIG <- IG %>%
  filter(SMK_204>=20) %>%
  select(year,SMK_204) %>%
  group_by(year)%>%
  count(SMK_204) %>%
  spread(SMK_204,n)%>%
  mutate_all(~replace(., is.na(.), 0)) %>%
  data.frame() %>%
  mutate(total=rowSums(.[2:30])) %>%
  mutate(proportion= total/pop)

PSmokerIG <-IG %>%
  filter(SMK_204>=20) %>%
  select(year,SMK_204,SDCGRES) %>%
  group_by(year,SDCGRES)%>%
  summarise(smoker=n())%>%
  spread(SDCGRES,smoker)

#FV (<5)
FVCDN <- CDN %>%
  filter(FVCDTOT<5) %>%
  select(year,FVCDTOT) %>%
  mutate(FVCDTOT=round(FVCDTOT)) %>%
  group_by(year)%>%
  count(FVCDTOT) %>%
  spread(FVCDTOT,n)%>%
  mutate_all(~replace(., is.na(.), 0)) %>%
  data.frame() %>%
  mutate(total=rowSums(.[2:7])) %>%
  mutate(proportion= total/pop)

FVIG <- IG %>%
  filter(FVCDTOT<5) %>%
  select(year,FVCDTOT) %>%
  mutate(FVCDTOT=round(FVCDTOT)) %>%
  group_by(year)%>%
  count(FVCDTOT) %>%
  spread(FVCDTOT,n)%>%
  mutate_all(~replace(., is.na(.), 0)) %>%
  data.frame() %>%
  mutate(total=rowSums(.[2:7])) %>%
  mutate(proportion= total/pop)

PFVIG <- IG %>%
  filter(FVCDTOT<5) %>%
  select(year,FVCDTOT,SDCGRES) %>%
  group_by(year,SDCGRES)%>%
  summarise(diet=n())%>%
  spread(SDCGRES,diet)