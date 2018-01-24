## make male education variable
## Some countries had their own education codes, which I translate here to ISCED 7 (on a scale of 0-6)

male_education_universal_clean <- function(df) {
  
  df$maleedu <- (ifelse(df$female==0, df$a148, 
                        ifelse(df$female==1, df$a308, NA)
  ))

  df$maleedu <- ifelse(df$country=="France", mapvalues(df$maleedu, from = c(24, 25, 26, 27, 28, 29, 30),
                           to = c(0, 2, 3, 3, 3, 5, 5)), df$maleedu) # didn't translate any 24:30 to 1:7
  df$maleedu <- ifelse(df$country=="Italy", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 31, 32, 33),
                                                       to = c(0, 1, 2, 3, 5, 5, 5)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Bulgaria", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 6, 7, 20),
                                                          to = c(0, 1, 2, 3, 5, 6, 0)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Russia", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                        to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Georgia", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Germany", mapvalues(df$maleedu, from = c(2, 3, 4, 5, 6, 7, 21, 22, 23),
                                                         to = c(1, 2, 3, 4, 5, 6, NA, NA, NA)), df$maleedu) ## didn't translate 12:23 to NA
  df$maleedu <- ifelse(df$country=="Hungary", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6),
                                                         to = c(0, 1, 2, 3, 4, 5)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Netherlands", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 6, 7),
                                                             to = c(0, 1, 2, 3, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Romania", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                                          to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Norway", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                        to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Austria", mapvalues(df$maleedu, from = c(2, 3, 4, 5, 6, 7),
                                                         to = c(1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Estonia", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Belgium", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Australia", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7, 34, 37),
                                                           to = c(0, 1, 2, 3, 4, 5, 6, NA, NA)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Lithuania", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                           to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="Poland", mapvalues(df$maleedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                        to = c(0, 1, 2, 3, 4, 5, 6)), df$maleedu)
  df$maleedu <- ifelse(df$country=="CzechRepublic", mapvalues(df$maleedu, from = c(3, 4, 5, 6, 7),
                                                              to = c(2, 3, 4, 5, 6)), df$maleedu)
  df
  return(df)
}













