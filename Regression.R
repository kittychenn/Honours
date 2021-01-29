####### Pop by behaviour #########

###Perceived stress (GEN_07 (4,5)) ###

##Canadian
High_stress <- c(4,5)
StressCDN <- CDN %>% 
  filter(GEN_07 %in% High_stress) %>%
  select(Year,GEN_07,WTS_M) %>%
  group_by(Year,GEN_07)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(GEN_07,Total)%>%
  rename('Quite a bit'='4',Extremely='5') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(High_Stress_Prevalence=Weight/Wpop)

##Immigrant
StressIG <- IG %>%
  filter(GEN_07 %in% High_stress) %>%
  select(Year,GEN_07,WTS_M) %>%
  group_by(Year,GEN_07)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(GEN_07,Total)%>%
  rename('Quite a bit'='4',Extremely='5') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(High_Stress_Prevalence=Weight/Wpop)

#By immigrant group
group_StressIG <- IG %>%
  filter(GEN_07 %in% High_stress) %>%
  select(Year,SDCGRES,GEN_07,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1','10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(High_Stress_Prevalence=Weight/Wpop)

#0-9 Years
group_StressIG1 <- IG %>% 
  filter(GEN_07 %in% High_stress) %>%
  filter(SDCGRES==1)%>%
  select(Year,SDCGRES,GEN_07,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(High_Stress_Prevalence=Weight/Wpop)

#10+ Years
group_StressIG2 <- IG %>%
  filter(GEN_07 %in% High_stress) %>%
  filter(SDCGRES==2)%>%
  select(Year,SDCGRES,GEN_07,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(High_Stress_Prevalence=Weight/Wpop)

### METS (=<1.5 for inactive) ###

## Canadian
METSCDN <- CDN %>% #
  filter(PACDEE<=1.5) %>%
  select(Year,PACDEE,WTS_M) %>%
  group_by(Year,PACDEE)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(PACDEE,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Inactivity_Prevalence=Weight/Wpop)

## Immigrant
METSIG <- IG %>%
  filter(PACDEE<=1.5) %>%
  select(Year,PACDEE,WTS_M) %>%
  group_by(Year,PACDEE)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(PACDEE,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Inactivity_Prevalence=Weight/Wpop)

#By immigrant group
group_METSIG <-IG %>%
  filter(PACDEE<=1.5) %>%
  select(Year,PACDEE,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1','10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Inactivity_Prevalence=Weight/Wpop)

#0-9 Years
group_METSIG1 <-IG %>%
  filter(PACDEE<=1.5) %>%
  filter(SDCGRES==1)%>%
  select(Year,PACDEE,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Inactivity_Prevalence=Weight/Wpop)

#10+ Years
group_METSIG2 <-IG %>%
  filter(PACDEE<=1.5) %>%
  filter(SDCGRES==2)%>%
  select(Year,PACDEE,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Inactivity_Prevalence=Weight/Wpop)

### Binge drinking (1) ###

## Canadian
BDrinkerCDN <- CDN %>%
  filter(binge_drinker==1) %>%
  select(Year,binge_drinker,WTS_M) %>%
  group_by(Year,binge_drinker)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(binge_drinker,Total)%>%
  rename('Binge'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Binge_Drinking_Prevalence=Weight/Wpop)

## Immigrant
BDrinkerIG <- IG %>%
  filter(binge_drinker==1) %>%
  select(Year,binge_drinker,WTS_M) %>%
  group_by(Year,binge_drinker)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(binge_drinker,Total)%>%
  rename('Binge'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Binge_Drinking_Prevalence=Weight/Wpop)

# By immigrant
group_BDrinkerIG <-IG %>%
  filter(binge_drinker==1) %>%
  select(Year,binge_drinker,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1','10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Binge_Drinking_Prevalence=Weight/Wpop)

#0-9 Years
group_BDrinkerIG1 <-IG %>%
  filter(binge_drinker==1) %>%
  filter(SDCGRES==1)%>%
  select(Year,binge_drinker,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Binge_Drinking_Prevalence=Weight/Wpop)

#10+ Years
group_BDrinkerIG2 <-IG %>%
  filter(binge_drinker==1) %>%
  filter(SDCGRES==2)%>%
  select(Year,binge_drinker,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Binge_Drinking_Prevalence=Weight/Wpop)


###Heavy smoker (1 pack)###
SmokerCDN <- CDN %>%
  filter(SMK_204>=20) %>%
  select(Year,SMK_204,WTS_M) %>%
  group_by(Year,SMK_204)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SMK_204,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/Wpop)

SmokerIG <- IG %>%
  filter(SMK_204>=20) %>%
  select(Year,SMK_204,WTS_M) %>%
  group_by(Year,SMK_204)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SMK_204,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/Wpop)

group_SmokerIG <-IG %>%
  filter(SMK_204>=20) %>%
  select(Year,SMK_204,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1','10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/Wpop)

group_SmokerIG1 <-IG %>%
  filter(SMK_204>=20)  %>%
  filter(SDCGRES==1)%>%
  select(Year,SMK_204,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/Wpop)

group_SmokerIG2 <-IG %>%
  filter(SMK_204>=20)  %>%
  filter(SDCGRES==2)%>%
  select(Year,SMK_204,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/Wpop)

### Poor diet (Perez diet score<2) ###

## Canadian
DietCDN <- CDN %>%
  filter(Diet_Score<2) %>%
  select(Year,Diet_Score,WTS_M) %>%
  mutate(Diet_Score=round(Diet_Score)) %>%
  group_by(Year,Diet_Score)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(Diet_Score,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Poor_Diet_Prevalence=Weight/Wpop)

## Immigrants
DietIG <- IG %>%
  filter(Diet_Score<2) %>%
  select(Year,Diet_Score,WTS_M) %>%
  mutate(Diet_Score=round(Diet_Score)) %>%
  group_by(Year,Diet_Score)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(Diet_Score,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Poor_Diet_Prevalence=Weight/Wpop)

#Immigrant groups
group_DietIG <- IG %>%
  filter(Diet_Score<2) %>%
  select(Year,Diet_Score,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1','10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Poor_Diet_Prevalence=Weight/Wpop)

#0-9 Years
group_DietIG1 <- IG %>%
  filter(Diet_Score<2) %>%
  filter(SDCGRES==1)%>%
  select(Year,Diet_Score,SDCGRES,WTS_M)%>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Poor_Diet_Prevalence=Weight/Wpop)

#10+ Years
group_DietIG2 <- IG %>%
  filter(Diet_Score<2) %>%
  filter(SDCGRES==2)%>%
  select(Year,Diet_Score,SDCGRES,WTS_M)%>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ Years'='2') %>% #weight for 2013=0 because of 3 NA
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Poor_Diet_Prevalence=Weight/Wpop)

#### graph ####
require(ggplot2)

#Binge drinker by resettlement
plot_BDrinker<- ggplot()+
  geom_line(data=BDrinkerCDN, aes(x=Year,y=Binge_Drinking_Prevalence,color="Canadian"))+
  geom_line(data=group_BDrinkerIG1 ,aes(x=Year,y=Binge_Drinking_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_BDrinkerIG2 ,aes(x=Year,y=Binge_Drinking_Prevalence,color="Resettled immigrant"))
plot_BDrinker +
  ylab("Prevalence") +
  labs(colour="Population Groups")+
  ggtitle("Prevalence of Binge Drinking from 2001-2013")

#Smoker by resettlement
plot_Smoker <- ggplot()+
  geom_line(data=group_SmokerIG1 ,aes(x=Year,y=Smoking_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_SmokerIG2 ,aes(x=Year,y=Smoking_Prevalence,color="Resettled immigrant")) +
  geom_line(data=SmokerCDN ,aes(x=Year,y=Smoking_Prevalence,color="Canadian"))
plot_Smoker +
  ylab("Prevalence") +
  labs(colour="Population Groups")+
  ggtitle("Prevalence of Smoking from 2001-2013")

#METS by resettlement
plot_METS <-ggplot()+
  geom_line(data=group_METSIG1 ,aes(x=Year,y=Inactivity_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_METSIG2 ,aes(x=Year,y=Inactivity_Prevalence,color="Resettled immigrant")) +
  geom_line(data=METSCDN ,aes(x=Year,y=Inactivity_Prevalence,color="Canadian"))
plot_METS +
  ylab("Prevalence") +
  labs(colour="Population Groups")+
  ggtitle("Prevalence of Inactivity from 2001-2013")

#Stress by resettlement
plot_Stress <- ggplot()+
  geom_line(data=group_StressIG1 ,aes(x=Year,y=High_Stress_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_StressIG2 ,aes(x=Year,y=High_Stress_Prevalence,color="Resettled immigrant")) +
  geom_line(data=StressCDN, aes(x=Year, y=High_Stress_Prevalence, color = "Canadian"))
plot_Stress +
  ylab("Prevalence") +
  labs(colour="Population Groups")+
  ggtitle("Prevalence of High Stress from 2001-2013")

#FV by resettlement 
plot_FV <-ggplot()+
  geom_line(data=group_DietIG1,aes(x=Year,y=Poor_Diet_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_DietIG2,aes(x=Year,y=Poor_Diet_Prevalence,color="Resettled immigrant"))+
  geom_line(data=DietCDN, aes(x=Year, y=Poor_Diet_Prevalence, color="Canadian"))
plot_FV +
  ylab("Prevalence") +
  labs(colour="Population Groups")+
  ggtitle("Prevalence of Smoking from 2001-2013")

  
#### Regression ####
#Stress
REG_StressCDN <- lm(High_Stress_Prevalence~Year,data=StressCDN)
REG_StressIG <- lm(High_Stress_Prevalence~Year,data=StressIG)
REG_group_StressIG <- lm(High_Stress_Prevalence~Year,data=group_StressIG)
REG_group_StressIG1 <- lm(High_Stress_Prevalence~Year,data=group_StressIG1)
REG_group_StressIG2 <- lm(High_Stress_Prevalence~Year,data=group_StressIG2)

#Binge drinking
REG_BDrinkerCDN <- lm(Binge_Drinking_Prevalence_Prevalence~Year,data=BDrinkerCDN)
REG_BDrinkerIG <- lm(Binge_Drinking_Prevalence_Prevalence~Year,data=BDrinkerIG)
REG_group_BDrinkerIG <- lm(Binge_Drinking_Prevalence_Prevalence~Year,data=group_BDrinkerIG)
REG_group_BDrinkerIG1 <- lm(Binge_Drinking_Prevalence_Prevalence~Year,data=group_BDrinkerIG1)
REG_group_BDrinkerIG2 <- lm(Binge_Drinking_Prevalence_Prevalence~Year,data=group_BDrinkerIG2)

#METS
REG_METSCDN <- lm(Inactivity_Prevalence_Prevalence~Year,data=METSCDN)
REG_METSIG <- lm(Inactivity_Prevalence_Prevalence~Year,data=METSIG)
REG_group_METSIG <- lm(Inactivity_Prevalence_Prevalence~Year,data=group_METSIG)
REG_group_METSIG1 <- lm(Inactivity_Prevalence_Prevalence~Year,data=group_METSIG1)
REG_group_METSIG2 <- lm(Inactivity_Prevalence_Prevalence~Year,data=group_METSIG2)

#Smoking
REG_SmokerCDN <- lm(Smoking_Prevalence_Prevalence~Year,data=SmokerCDN)
REG_SmokerIG <- lm(Smoking_Prevalence_Prevalence~Year,data=SmokerIG)
REG_group_SmokerIG <- lm(Smoking_Prevalence_Prevalence~Year,data=group_SmokerIG)
REG_group_SmokerIG1 <- lm(Smoking_Prevalence_Prevalence~Year,data=group_SmokerIG1)
REG_group_SmokerIG2 <- lm(Smoking_Prevalence_Prevalence~Year,data=group_SmokerIG2)

#Diet
REG_DietCDN <- lm(Poor_Diet_Prevalence~Year,data=DietCDN)
REG_DietIG <- lm(Poor_Diet_Prevalence~Year,data=DietIG)
REG_group_DietIG <- lm(Poor_Diet_Prevalence~Year,data=group_DietIG)
REG_group_DietIG1 <- lm(Poor_Diet_Prevalence~Year,data=group_DietIG1)
REG_group_DietIG2 <- lm(Poor_Diet_Prevalence~Year,data=group_DietIG2)
