## categories
combined$SMKG203 <- cut(combined$SMKG203_cont, c(0,11,14,17,19,24,29,34,39,44,49,90),  labels=1:11)
combined$SMKG203 <- as.character(combined$SMKG203)
combined$SMKG203[is.na(combined$SMKG203)] <- 99
combined$SMKG203 <- as.factor(combined$SMKG203)

combined$SMKG01C <- cut(combined$SMKG01C_cont, c(0,11,14,17,19,24,29,34,39,44,49,90),  labels=1:11)
combined$SMKG01C <- as.character(combined$SMKG01C)
combined$SMKG01C[is.na(combined$SMKG01C)] <- 99
combined$SMKG01C <- as.factor(combined$SMKG01C)

combined$SMK_09A <- cut(combined$SMK_09A_cont,c(0,1,2,3,8),labels=1:4)
combined$SMK_09A <- as.character(combined$SMK_09A)
combined$SMK_09A[is.na(combined$SMK_09A)] <- 9
combined$SMK_09A <- as.factor(combined$SMK_09A)

## NA
combined$SMK_05C[is.na(combined$SMK_05C)] <- 99

combined$PACDEE[is.na(combined$PACDEE)] <- 99.9

combined$HWTGBMI[is.na(combined$HWTGBMI)] <- 999.99
combined$FVCDVEG[is.na(combined$FVCDVEG)] <- 999.9
combined$FVCDCAR[is.na(combined$FVCDCAR)] <- 999.9
combined$FVCDFRU[is.na(combined$FVCDFRU)] <- 999.9
combined$FVCDSAL[is.na(combined$FVCDSAL)] <- 999.9
combined$FVCDPOT[is.na(combined$FVCDPOT)] <- 999.9
combined$FVCDJUI[is.na(combined$FVCDJUI)] <- 999.9
combined$ALWDWKY[is.na(combined$ALWDWKY)] <- 999
combined$SMK_204[is.na(combined$SMK_204)] <- 999
combined$SMK_208[is.na(combined$SMK_208)] <- 999
combined$SMK_05B[is.na(combined$SMK_05B)] <- 999

## NA(b)
combined$SDCGCGT <- as.character(combined$SDCGCGT)
combined$SDCGCGT[combined$SDCGCGT == "NA(b)"] <- "9"
combined$SDCGCGT <- as.factor(combined$SDCGCGT)

combined$EDUDR04 <- as.character(combined$EDUDR04)
combined$EDUDR04[combined$EDUDR04 == "NA(b)"] <- "9"
combined$EDUDR04 <- as.factor(combined$EDUDR04)

combined$CCC_071 <- as.character(combined$CCC_071)
combined$CCC_071[combined$CCC_071 == "NA(b)"] <- "9"
combined$CCC_071 <- as.factor(combined$CCC_071)

combined$SMKDSTY <- as.character(combined$SMKDSTY)
combined$SMKDSTY[combined$SMKDSTY == "NA(b)"] <- "99"
combined$SMKDSTY <- as.factor(combined$SMKDSTY)

combined$SMK_01A <- as.character(combined$SMK_01A)
combined$SMK_01A[combined$SMK_01A == "NA(b)"] <- "9"
combined$SMK_01A <- as.factor(combined$SMK_01A)

combined$CCC_131 <- as.character(combined$CCC_131)
combined$CCC_131[combined$CCC_131 == "NA(b)"] <- "9"
combined$CCC_131 <- as.factor(combined$CCC_131)

combined$CCC_121 <- as.character(combined$CCC_121)
combined$CCC_121[combined$CCC_121 == "NA(b)"] <- "9"
combined$CCC_121 <- as.factor(combined$CCC_121)

combined$CCC_151 <- as.character(combined$CCC_151)
combined$CCC_151[combined$CCC_151 == "NA(b)"] <- "9"
combined$CCC_151 <- as.factor(combined$CCC_151)

combined$CCC_101 <- as.character(combined$CCC_101)
combined$CCC_101[combined$CCC_101 == "NA(b)"] <- "9"
combined$CCC_101 <- as.factor(combined$CCC_101)

## NA, NA(a), NA(b)
combined$SMKG09C <- as.character(combined$SMKG09C)
combined$SMKG09C[combined$SMKG09C == "NA(a)"] <- "7"
combined$SMKG09C[combined$SMKG09C == "NA(b)"] <- "9"
combined$SMKG09C[is.na(combined$SMKG09C)] <- "6"
combined$SMKG09C <- as.factor(combined$SMKG09C)

combined$CCC_091 <- as.character(combined$CCC_091)
combined$CCC_091[combined$CCC_091 == "NA(a)"] <- "7"
combined$CCC_091[combined$CCC_091 == "NA(b)"] <- "9"
combined$CCC_091[is.na(combined$CCC_091)] <- "6"
combined$CCC_091 <- as.factor(combined$CCC_091)

combined$CCC_280 <- as.character(combined$CCC_280)
combined$CCC_280[combined$CCC_280 == "NA(a)"] <- "7"
combined$CCC_280[combined$CCC_280 == "NA(b)"] <- "9"
combined$CCC_280[is.na(combined$CCC_280)] <- "6"
combined$CCC_280 <- as.factor(combined$CCC_280)

combined$SDCGRES <- as.character(combined$SDCGRES)
combined$SDCGRES[combined$SDCGRES == "NA(a)"] <- "7"
combined$SDCGRES[combined$SDCGRES == "NA(b)"] <- "9"
combined$SDCGRES <- as.factor(combined$SDCGRES)

