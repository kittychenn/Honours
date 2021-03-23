## diet score fun
diet_score_fun <-
  function(FVCDFRU, FVCDSAL, FVCDPOT, FVCDCAR, FVCDVEG, FVCDJUI, DHH_SEX) {
    
    # Total fruit and vegetables, excluding fruit juice
    total_fruitveg <- 
      if_else2(!is.na(FVCDFRU) & !is.na(FVCDSAL) & !is.na(FVCDPOT) & 
                 !is.na(FVCDCAR)  & !is.na(FVCDVEG), FVCDFRU + FVCDSAL + 
                 FVCDPOT + FVCDCAR + FVCDVEG, NA)
    
    # Maximum total fruit and vegetables = 8
    max_fruitveg <-
      if_else2(is.na(total_fruitveg), NA,
               if_else2(total_fruitveg>8, 8, total_fruitveg))
    
    # High potato intake flag
    daily_pot_limit <-
      if_else2(DHH_SEX==1, 1,
               if_else2(DHH_SEX==2, 5/7, NA))
    FVCDPOT_high <-
      if_else2(is.na(FVCDPOT), NA,
               if_else2(FVCDPOT>=(daily_pot_limit), 1, 0))
    
    # No carrot intake flag
    FVCDCAR_nil <-
      if_else2(is.na(FVCDCAR), NA,
               if_else2(FVCDCAR==0, 1, 0))
    
    # High juice intake flag
    FVCDJUI_high <-
      if_else2(is.na(FVCDJUI), NA,
               if_else2(FVCDJUI <=1, 0, FVCDJUI - 1))
    
    diet_raw_score <- if_else2(!is.na(max_fruitveg) & !is.na(FVCDPOT_high) & 
                                 !is.na(FVCDCAR_nil) & !is.na(FVCDJUI_high),  2 +
                                 max_fruitveg - (2*FVCDPOT_high) - (2*FVCDCAR_nil) - 
                                 (2*FVCDJUI_high), NA)
    
    diet_score <- if_else2(diet_raw_score <0, 0,
                           if_else2(diet_raw_score >10, 10,
                                    if_else2(!is.na(diet_raw_score), diet_raw_score,
                                             tagged_na("b"))))
    return(diet_score)
  }

attach(combined_age)
combined_age$Diet_Score <- diet_score_fun(FVCDFRU, FVCDSAL, FVCDPOT, FVCDCAR, FVCDVEG, FVCDJUI, DHH_SEX)