library(tableone)
library(survey)
rm(T1COMBINED)
T1COMBINED <- combined_age %>%
  filter(SDCFIMM==1|SDCFIMM==2)

####Rename ####
#sex
levels(T1COMBINED$DHH_SEX)
T1COMBINED$DHH_SEX <-
  factor(T1COMBINED$DHH_SEX, levels=c(1,2),
         labels=c('Male','Female'))

#years in Canada
levels(T1COMBINED$SDCGRES)
T1COMBINED$SDCGRES <-
  factor(T1COMBINED$SDCGRES, levels=c(1,2),
         labels=c('0-9 years','10+ years'))

#physical activity
T1COMBINED$PACDEE <-
  cut(T1COMBINED$PACDEE,breaks=c(0,1.5,3,98), labels=c('Inactive','Moderately active','Active'))
T1COMBINED$PACDEE[is.na(T1COMBINED$PACDEE)] <- 'Not stated'

#alcohol
levels(T1COMBINED$binge_drinker)
T1COMBINED$binge_drinker <-
  factor(T1COMBINED$binge_drinker, levels=c(1,2,'NA(a)','NA(b)'),
         labels=c('Binge drinker','Regular drinker', "Not applicable",'Not stated'))

#diet
levels(T1COMBINED$Diet_Score)

T1COMBINED$Diet_Score <-
  cut(T1COMBINED$Diet_Score,breaks=c(0,2,7.9,10), labels=c('Poor diet','Fair diet','Adequate diet'))
T1COMBINED$Diet_Score[is.na(T1COMBINED$Diet_Score)] <- 'Not stated'

#smoking
attach(T1COMBINED)
T1COMBINED$Smoke <-ifelse(SMKDSTY==1 & Smoke_Status >= 1, "Heavy smoker",
                          ifelse(SMKDSTY==1 & Smoke_Status < 1 , "Light smoker",
                                 ifelse(SMKDSTY==2 & Smoke_Status < 1 | SMKDSTY==3 & Smoke_Status < 1 |SMKDSTY==4 & Smoke_Status < 1 |SMKDSTY==5 & Smoke_Status < 1, "Former light smoker",
                                        ifelse(SMKDSTY==2 & Smoke_Status >= 1 | SMKDSTY==3 & Smoke_Status >= 1 |SMKDSTY==4 & Smoke_Status >= 1 |SMKDSTY==5 & Smoke_Status >= 1, "Former heavy smoker",
                                               ifelse(SMKDSTY==6, "Non-smoker",
                                                      ifelse(SMKDSTY=="NA(b)", "Not applicable",0))))))
T1COMBINED$Smoke[is.na(T1COMBINED$Smoke)] <- "Not applicable"

#immigrant status
levels(T1COMBINED$SDCFIMM)
T1COMBINED$SDCFIMM <-
  factor(T1COMBINED$SDCFIMM, levels=c(1,2),
         labels=c('Immigrant','Canadian'))

# sex, stress, col titles
T1COMBINED <- T1COMBINED %>%
  rename('Sex'=DHH_SEX,'Time_in_Canada'=SDCGRES,'Alcohol'=binge_drinker,'Physical_activity'=PACDEE,'Stress'=GEN_07,'Smoke_status'=Smoke,'Diet'=Diet_Score,'Age'=DHHGAGE_cont,'Immigrant_status'=SDCFIMM)%>%
  as_label(Stress)

colnames(T1COMBINED)

t1 <- svydesign(~0,weights= ~WTS_M, data=T1COMBINED)

###########################
####Table1 total####
c('DHH_SEX','SDCGRES','binge_drinker','PACDEE','GEN_07','Smoke','FVCDTOT','SDCFIMM','DHHGAGE_cont') #original column names

myVars <- c('Sex','Age','Immigrant status','Time in Canada','Alcohol','Physical activity','Stress','Smoke status','Diet' )
tableOne<- CreateTableOne(vars=myVars,data=T1COMBINED)
tb1<- print(tableOne)
write.csv(tb1,"TableOne1.csv")

####Table1 by sex####
myVars <- c('Age','Immigrant_status','Time_in_Canada','Alcohol','Physical_activity','Stress','Smoke_status','Diet' )
tableOne.1 <-svyCreateTableOne(vars=myVars, strata='Sex',data=t1)
tb1<- print(tableOne.1)
write.csv(tb1,"tb1.csv")

####Table2 strat immigrants####
myVars2 <- c('Sex','Age','Time_in_Canada','Alcohol','Physical_activity','Stress','Smoke_status','Diet') 

tableTwo<- svyCreateTableOne(vars=myVars2,strata='Immigrant_status',data=t1)
tb2<- print(tableTwo)
write.csv(tb2,"tb2.csv")

####Table3 strat immigrant groups ####
myVars3 <- c('Sex','Age','Alcohol','Physical_activity','Stress','Smoke_status','Diet') 
tableThree<- svyCreateTableOne(vars=myVars2,strata='Time_in_Canada',data=t1)
tb3<- print(tableThree)
write.csv(tb3,"tb3.csv")
