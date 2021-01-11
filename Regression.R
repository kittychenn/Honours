#reg on canadian
lm(WTS_M~year, data=CDN)

#reg on immigrant
lm(WTS_M~year, data=IG)

#reg on both 
lm(WTS_M~year, data=T2COMBINED)

