library(tableone)

T1COMBINED <- combined %>%
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
  factor(T1COMBINED$SDCGRES, levels=c(1,2,7,9),
         labels=c('0-9 years','10+ years',"Don't know",'Not stated'))

#physical activity
factors(T1COMBINED$PACDEE)
T1COMBINED$PACDEE <-
  cut(T1COMBINED$PACDEE,breaks=c(0,1.5,3,98,Inf), labels=c('Inactive','Moderately active','Active','Not stated'))
T1COMBINED$PACDEE[is.na(T1COMBINED$PACDEE)] <- 'Inactive'

#alcohol
levels(T1COMBINED$binge_drinker)
T1COMBINED$binge_drinker <-
  factor(T1COMBINED$binge_drinker, levels=c(1,2,'NA(a)','NA(b)'),
         labels=c('Binge drinker','Regular drinker', "Not applicable",'Not stated'))

#diet
levels(T1COMBINED$FVCDTOT)
T1COMBINED$FVCDTOT <-
  cut(T1COMBINED$FVCDTOT,breaks=c(0,5,30), labels=c('Poor diet','Adequate diet'))
T1COMBINED$FVCDTOT[is.na(T1COMBINED$FVCDTOT)] <- 'Not stated'

#smoking 
levels(T1COMBINED$SMK_204)
T1COMBINED$SMK_204 <-
  cut(T1COMBINED$SMK_204,breaks=c(0,20,90,Inf), labels=c('Light smoker','Heavy smoker','Not stated'))

#immigrant status
levels(T1COMBINED$SDCFIMM)
T1COMBINED$SDCFIMM <-
  factor(T1COMBINED$SDCFIMM, levels=c(1,2,'NA(b)'),
         labels=c('Immigrant','Canadian', 'Not stated'))

# sex, stress, col titles
T1COMBINED <- T1COMBINED %>%
  rename('Sex'=DHH_SEX,'Time in Canada'=SDCGRES,'Alcohol'=binge_drinker,'Physical activity'=PACDEE,'Stress'=GEN_07,'Smoking'=SMK_204,'Diet'=FVCDTOT,'Age'=DHHGAGE_cont,'Immigrant status'=SDCFIMM)%>%
  as_label(Stress)

colnames(T1COMBINED)

###########################
####Table1 total####
c('DHH_SEX','SDCGRES','binge_drinker','PACDEE','GEN_07','SMK_204','FVCDTOT','SDCFIMM','DHHGAGE_cont') #original column names

myVars <- c('Sex','Age','Immigrant status','Time in Canada','Alcohol','Physical activity','Stress','Smoking','Diet' )
tableOne<- CreateTableOne(vars=myVars,data=T1COMBINED)
tb1<- print(tableOne)
write.csv(tb1,"TableOne1.csv")

####Table1 by sex####
myVars <- c('Age','Immigrant status','Time in Canada','Alcohol','Physical activity','Stress','Smoking','Diet' )
tableOne.1 <-CreateTableOne(vars=myVars1, strata='Sex',data=T1COMBINED)

####Table2 strat immigrants####
myVars2 <- c('Sex','Age','Time in Canada','Alcohol','Physical activity','Stress','Smoking','Diet' ) 

tableTwo<- CreateTableOne(vars=myVars2,strata='Immigrant status',data=T1COMBINED)
tb2<- print(tableTwo)
write.csv(tb2,"TableOne2.csv")
