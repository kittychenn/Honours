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

ggplot(data=tBehaviour,aes(x=pct_time_der,y=Prevalence, col=Behaviour))+
  geom_line()+
  geom_point()+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))+
  ylab("Prevalence (%)") +
  xlab("Time in Canada (%)")+ 
  theme(legend.position="bottom")

