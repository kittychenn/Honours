####### Pop by behaviour #########

###Perceived stress (GEN_07 (4,5)) ###
High_stress <- c(4,5)

##Immigrant
StressIG <- IG %>%
  filter(GEN_07 %in% High_stress) %>%
  select(pct_time_der,GEN_07,WTS_M) %>%
  group_by(pct_time_der,GEN_07)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(GEN_07,Total)%>%
  rename('Quite a bit'='4',Extremely='5') %>%
  replace(is.na(.), 0) %>%
  group_by(pct_time_der) %>%
  summarise_all(sum)%>%
  mutate(High_Stress_Prevalence=Weight/sum(combined_age$WTS_M)*100)


### METS (=<1.5 for inactive) ###

## Immigrant
METSIG <- IG %>%
  filter(PACDEE<=1.5) %>%
  select(pct_time_der,PACDEE,WTS_M) %>%
  group_by(pct_time_der,PACDEE)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(PACDEE,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(pct_time_der) %>%
  summarise_all(sum)%>%
  mutate(Inactivity_Prevalence=Weight/sum(combined_age$WTS_M)*100)

### Binge drinking (1) ###

## Immigrant
BDrinkerIG <- IG %>%
  filter(binge_drinker==1) %>%
  select(pct_time_der,binge_drinker,WTS_M) %>%
  group_by(pct_time_der,binge_drinker)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(binge_drinker,Total)%>%
  rename('Binge'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(pct_time_der) %>%
  summarise_all(sum)%>%
  mutate(Binge_Drinking_Prevalence=Weight/sum(combined_age$WTS_M)*100)

###Heavy smoker (>=1 pack_year AND SMKDSTY==1 (current))###

SmokerIG <- IG %>%
  filter(SMKDSTY==1 & Smoke_Status >= 1) %>%
  select(pct_time_der,Smoke_Status,WTS_M) %>%
  group_by(pct_time_der,Smoke_Status)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(Smoke_Status,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(pct_time_der) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/sum(combined_age$WTS_M)*100)

### Poor diet (Perez diet score<2) ###

## Immigrants
DietIG <- IG %>%
  filter(Diet_Score < 2) %>%
  select(pct_time_der,Diet_Score,WTS_M) %>%
  mutate(Diet_Score=round(Diet_Score)) %>%
  group_by(pct_time_der,Diet_Score)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(Diet_Score,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(pct_time_der) %>%
  summarise_all(sum)%>%
  mutate(Poor_Diet_Prevalence=Weight/sum(combined_age$WTS_M)*100)

#### Graph ####
require(ggplot2)

# All behaviours 

ggplot()+
  geom_point(data=BDrinkerIG, aes(x=pct_time_der,y=Binge_Drinking_Prevalence, color= "Binge drinker"))+
  geom_point(data=SmokerIG, aes(x=pct_time_der,y=Smoking_Prevalence, color="Heavy smoker"))+
  geom_point(data=METSIG ,aes(x=pct_time_der,y=Inactivity_Prevalence,color='Inactivity'))+
  geom_point(data=StressIG ,aes(x=pct_time_der,y=High_Stress_Prevalence,color='High stress'))+
  geom_point(data=DietIG, aes(x=pct_time_der, y=Poor_Diet_Prevalence, color="Poor diet"))+
  ylab("Prevalence (%)") +
  xlab("Time in Canada (%)")+
  labs(colour="Risk health behaviours")

ggplot(data=PCT_by_prevalence)+
  geom_point(aes(x=pct_time_der,y=Binge_Drinking_Prevalence, color= "Binge drinker"))+
  geom_point(aes(x=pct_time_der,y=Smoking_Prevalence, color="Heavy smoker"))+
  geom_point(aes(x=pct_time_der,y=Inactivity_Prevalence,color='Inactivity'))+
  geom_point(aes(x=pct_time_der,y=High_Stress_Prevalence,color='High stress'))+
  geom_point(aes(x=pct_time_der,y=Poor_Diet_Prevalence, color="Poor diet"))+
  geom_smooth(method='lm',se=FALSE,fullrange=TRUE)


#### Regression ####
#Stress
REG_StressIG <- lm(High_Stress_Prevalence~pct_time_der,data=StressIG)
summary(REG_StressIG)

#Binge drinking
REG_BDrinkerIG <- lm(Binge_Drinking_Prevalence~pct_time_der,data=BDrinkerIG)
summary(REG_BDrinkerIG)

#METS
REG_METSIG <- lm(Inactivity_Prevalence~pct_time_der,data=METSIG)
summary(REG_METSIG)

#Smoking
REG_SmokerIG <- lm(Smoking_Prevalence~pct_time_der,data=SmokerIG)
summary(REG_METSIG)

#Diet
REG_DietIG <- lm(Poor_Diet_Prevalence~pct_time_der,data=DietIG)
summary(REG_DietIG)
