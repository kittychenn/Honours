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
  mutate(High_Stress_Prevalence=Weight/CDN_WPop*100)

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
  mutate(High_Stress_Prevalence=Weight/RecentIG_WPop*100)

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
  mutate(High_Stress_Prevalence=Weight/ResettledIG_WPop*100)

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
  mutate(Inactivity_Prevalence=Weight/CDN_WPop*100)

## Immigrant
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
  mutate(Inactivity_Prevalence=Weight/RecentIG_WPop*100)

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
  mutate(Inactivity_Prevalence=Weight/ResettledIG_WPop*100)

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
  mutate(Binge_Drinking_Prevalence=Weight/CDN_WPop*100)

## Immigrant
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
  mutate(Binge_Drinking_Prevalence=Weight/RecentIG_WPop*100)

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
  mutate(Binge_Drinking_Prevalence=Weight/ResettledIG_WPop*100)


###Heavy daily smoker (>1 pack_year)###
SmokerCDN <- CDN %>%
  filter(SMKDSTY==1 & Smoke_Status >= 1) %>%
  select(Year,Smoke_Status,WTS_M) %>%
  group_by(Year,Smoke_Status)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(Smoke_Status,Total) %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/CDN_WPop*100)

## Immigrant
#0-9 Years
group_SmokerIG1 <-IG %>%
  filter(SMKDSTY==1 & Smoke_Status >= 1)  %>%
  filter(SDCGRES==1)%>%
  select(Year,Smoke_Status,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('0-9 Years'='1') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/RecentIG_WPop*100)

#10+ Years
group_SmokerIG2 <-IG %>%
  filter(SMKDSTY==1 & Smoke_Status >= 1) %>%
  filter(SDCGRES==2)%>%
  select(Year,Smoke_Status,SDCGRES,WTS_M) %>%
  group_by(Year,SDCGRES)%>%
  summarise(Total=n(),Weight=sum(WTS_M))%>%
  spread(SDCGRES,Total)%>%
  rename('10+ Years'='2') %>%
  replace(is.na(.), 0) %>%
  group_by(Year) %>%
  summarise_all(sum)%>%
  mutate(Smoking_Prevalence=Weight/ResettledIG_WPop*100)

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
  mutate(Poor_Diet_Prevalence=Weight/CDN_WPop*100)

## Immigrants
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
  mutate(Poor_Diet_Prevalence=Weight/RecentIG_WPop*100)

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
  mutate(Poor_Diet_Prevalence=Weight/ResettledIG_WPop*100)

#### graph ####
require(ggplot2)

#Binge drinker by resettlement
plot_BDrinker<- ggplot()+
  geom_line(data=BDrinkerCDN, aes(x=Year,y=Binge_Drinking_Prevalence,color="Canadian"))+
  geom_line(data=group_BDrinkerIG1 ,aes(x=Year,y=Binge_Drinking_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_BDrinkerIG2 ,aes(x=Year,y=Binge_Drinking_Prevalence,color="Resettled immigrant"))+
  xlab("Year")+
  ylab("Prevalence (%)") +
  labs(colour="Population Groups")+
  ggtitle("Binge drinking")+
  theme(plot.title = element_text(hjust = 0.5))+ 
  theme(legend.position = "none")+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

#Smoker by resettlement
plot_Smoker <- ggplot()+
  geom_line(data=group_SmokerIG1 ,aes(x=Year,y=Smoking_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_SmokerIG2 ,aes(x=Year,y=Smoking_Prevalence,color="Resettled immigrant")) +
  geom_line(data=SmokerCDN ,aes(x=Year,y=Smoking_Prevalence,color="Canadian"))+
  ylab("Prevalence (%)") +
  labs(colour="Population Groups")+
  ggtitle("Heavy smoking")+
  theme(plot.title = element_text(hjust = 0.5))+ 
  theme(legend.position = "none")+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

#METS by resettlement
plot_METS <-ggplot()+
  geom_line(data=group_METSIG1 ,aes(x=Year,y=Inactivity_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_METSIG2 ,aes(x=Year,y=Inactivity_Prevalence,color="Resettled immigrant")) +
  geom_line(data=METSCDN ,aes(x=Year,y=Inactivity_Prevalence,color="Canadian"))+
  ylab("Prevalence (%)") +
  labs(colour="Population Groups")+
  ggtitle("Inactivity")+
  theme(plot.title = element_text(hjust = 0.5))+ 
  theme(legend.position = "none")+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

#Stress by resettlement
plot_Stress <- ggplot()+
  geom_line(data=group_StressIG1 ,aes(x=Year,y=High_Stress_Prevalence,color="Recent immigrant"))+
  geom_line(data=group_StressIG2 ,aes(x=Year,y=High_Stress_Prevalence,color="Resettled immigrant")) +
  geom_line(data=StressCDN, aes(x=Year, y=High_Stress_Prevalence, color = "Canadian"))+
  ylab("Prevalence (%)") +
  labs(colour="Population Groups")+
  ggtitle("High stress")+
  theme(plot.title = element_text(hjust = 0.5))+ 
  theme(legend.position = "none")+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
#FV by resettlement 
plot_FV <-ggplot()+
  geom_line(data=group_DietIG1,aes(x=Year,y=Poor_Diet_Prevalence, color="Recent immigrant"))+
  geom_line(data=group_DietIG2,aes(x=Year,y=Poor_Diet_Prevalence,color="Resettled immigrant"))+
  geom_line(data=DietCDN, aes(x=Year, y=Poor_Diet_Prevalence, color="Canadian"))+
  ylab("Prevalence (%)") +
  labs(colour="Population groups")+
  ggtitle("Poor diet")+
  theme(plot.title = element_text(hjust = 0.5))+ 
  theme(legend.position = "none")+ 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
plot_FV+ 
  theme(legend.position="bottom")

library(ggpubr)
figure <- ggarrange(plot_BDrinker,plot_FV,plot_METS,plot_Smoker,plot_Stress)
figure 
