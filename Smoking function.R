## pack year function
attach(labeled_Smoker_combined)
pack_years_fun <-
  function(SMKDSTY, DHHGAGE_cont, SMK_09A_cont, SMKG09C, SMKG203_cont,
           SMKG207_cont, SMK_204, SMK_05B,
           SMK_208, SMK_05C, SMKG01C_cont, SMK_01A) {
    # Age verification
    if (is.na(DHHGAGE_cont)) {
      return(tagged_na("b"))
    } else if (DHHGAGE_cont < 0) {
      return(tagged_na("b"))
    }
    
    # Time since quit for former daily smokers
    tsq_ds_fun <- function(SMK_09A_cont, SMKG09C) {
      SMKG09C <-
        if_else2(
          SMKG09C == 1, 4,
          if_else2(
            SMKG09C == 2, 8,
            if_else2(SMKG09C == 3, 12, NA)
          )
        )
      tsq_ds <-
        if_else2(
          SMK_09A_cont == 1, 0.5,
          if_else2(
            SMK_09A_cont == 2, 1.5,
            if_else2(
              SMK_09A_cont == 3, 2.5,
              if_else2(SMK_09A_cont == 4, SMKG09C, NA)
            )
          )
        )
    }
    tsq_ds <- tsq_ds_fun(SMK_09A_cont, SMKG09C)
    # PackYears for Daily Smoker
    if_else2(
      SMKDSTY == 1, pmax(((DHHGAGE_cont - SMKG203_cont) *
                            (SMK_204 / 20)), 0.0137),
      # PackYears for Occasional Smoker (former daily)
      if_else2(
        SMKDSTY == 2, pmax(((DHHGAGE_cont - SMKG207_cont - tsq_ds) *
                              (SMK_208 / 20)), 0.0137) + (pmax((SMK_05B * SMK_05C / 30), 1) * tsq_ds),
        # PackYears for Occasional Smoker (never daily)
        if_else2(
          SMKDSTY == 3, (pmax((SMK_05B * SMK_05C / 30), 1) / 20) *
            (DHHGAGE_cont - SMKG01C_cont),
          # PackYears for former daily smoker (non-smoker now)
          if_else2(
            SMKDSTY == 4, pmax(((DHHGAGE_cont - SMKG207_cont - tsq_ds) *
                                  (SMK_208 / 20)), 0.0137),
            # PackYears for former occasional smoker (non-smoker now) who
            # smoked at least 100 cigarettes lifetime
            if_else2(
              SMKDSTY == 5 & SMK_01A == 1, 0.0137,
              # PackYears for former occasional smoker (non-smoker now) who have
              # not smoked at least 100 cigarettes lifetime
              if_else2(
                SMKDSTY == 5 & SMK_01A == 2, 0.007,
                # Non-smoker
                if_else2(SMKDSTY == 6, 0, tagged_na("b"))
              )
            )
          )
        )
      )
    )
  }


x <-list(Smoker_combined$SMKDSTY, Smoker_combined$DHHGAGE_cont, Smoker_combined$SMK_09A_cont, Smoker_combined$SMKG09C, Smoker_combined$SMKG203_cont,
     SMKG207_cont, Smoker_combined$SMK_204, Smoker_combined$SMK_05B,
     SMK_208, Smoker_combined$SMK_05C, Smoker_combined$SMKG01C_cont, Smoker_combined$SMK_01A)
Smoker_combined$smoke_status<-lapply(x, pack_years_fun(x))

pack_years_fun(1,1,1,1,1,1,1,1,1,1,1,1)

                                     