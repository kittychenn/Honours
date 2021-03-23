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
  mutate(Prevalence=Weight/WpopIG*100)


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
  mutate(Prevalence=Weight/WpopIG*100)

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
  mutate(Prevalence=Weight/WpopIG*100)

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
  mutate(Prevalence=Weight/WpopIG*100)

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
  mutate(Prevalence=Weight/WpopIG*100)

#### Graph ####
require(ggplot2)

# All behaviours 
Behaviour1 <- StressIG %>%
  select(pct_time_der,Prevalence)%>%
  mutate(Behaviour="High stress")
Behaviour2 <- SmokerIG %>%
  select(pct_time_der,Prevalence)%>%
  mutate(Behaviour="Heavy smoking")
Behaviour3 <- METSIG %>%
  select(pct_time_der,Prevalence)%>%
  mutate(Behaviour="Inactivity")
Behaviour4 <- DietIG %>%
  select(pct_time_der,Prevalence)%>%
  mutate(Behaviour="Poor diet")
Behaviour5 <- BDrinkerIG %>%
  select(pct_time_der,Prevalence)%>%
  mutate(Behaviour="Binge drinking")

tBehaviour=bind_rows(Behaviour1,Behaviour2,Behaviour3,Behaviour4,Behaviour5)

ggplot(data=tBehaviour,aes(x=pct_time_der,y=Prevalence,color=Behaviour))+
  geom_line()+
  geom_point()+
  geom_smooth(method="lm",se=FALSE,linetype="dashed")+
  ylab("Prevalence (%)") +
  xlab("Time in Canada (%)")+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+ 
  theme(legend.position="bottom")

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
