## Life expectancy
require(ggplot2)


cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Diet
Life_exp_Diet <-ggplot(data=Life_exp,aes(x=Year,y=`Poor diet`,colour=Group))+
  geom_point()+
  geom_line()+
  scale_fill_manual(values=cbPalette)+
  ylab("Life expectancy at birth (year)")+
  labs(colour="Population groups")+
  ggtitle("Poor diet")+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))+
  scale_x_discrete(limits=c(2001,2005,2009,2013))+
  scale_y_continuous(limit=c(75,91))

# Binge drinking
Life_exp_Bdrink <-ggplot(data=Life_exp,aes(x=Year,y=`Binge drinking`,colour=Group))+
  geom_point()+
  geom_line()+
  scale_fill_manual(values=cbPalette)+
  ylab("Life expectancy at birth (year)")+
  labs(colour="Population groups")+
  ggtitle("Binge drinking")+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))+
  scale_x_discrete(limits=c(2001,2005,2009,2013))+
  scale_y_continuous(limit=c(75,91))

# Inactivity 
Life_exp_Inactivity <-ggplot(data=Life_exp,aes(x=Year,y=`Inactivity`,colour=Group))+
  geom_point()+
  geom_line()+
  scale_fill_manual(values=cbPalette)+
  ylab("Life expectancy at birth (year)")+
  labs(colour="Population groups")+
  ggtitle("Inactivity")+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))+
  scale_x_discrete(limits=c(2001,2005,2009,2013))+
  scale_y_continuous(limit=c(75,91))

# Stress
Life_exp_Stress <-ggplot(data=Life_exp,aes(x=Year,y=`High stress`,colour=Group))+
  geom_point()+
  geom_line()+
  scale_fill_manual(values=cbPalette)+
  ylab("Life expectancy at birth (year)")+
  labs(colour="Population groups")+
  ggtitle("High stress")+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))+
  scale_x_discrete(limits=c(2001,2005,2009,2013))+
  scale_y_continuous(limit=c(75,91))

# Heavy smoker
Life_exp_Smoke <-ggplot(data=Life_exp,aes(x=Year,y=`Heavy smoking`,colour=Group))+
  geom_point()+
  geom_line()+
  scale_fill_manual(values=cbPalette)+
  ylab("Life expectancy at birth (year)")+
  labs(colour="Population groups")+
  ggtitle("Heavy smoking")+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))+
  scale_x_discrete(limits=c(2001,2005,2009,2013))+
  scale_y_continuous(limit=c(75,91))
Life_exp_Smoke+ 
  theme(legend.position="bottom")


library(ggpubr)
figure3 <- ggarrange(Life_exp_Bdrink,Life_exp_Diet,Life_exp_Inactivity,Life_exp_Smoke,Life_exp_Stress)
figure3
