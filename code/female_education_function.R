## make female education variable
## Some countries had their own education codes, which I translate here to ISCED 7 (on a scale of 0-6)

female_education_universal_clean <- function(df) {
  
  df$femedu <- (ifelse(df$female==1, df$a148, 
                       ifelse(df$female==0, df$a308, NA)
  ))
  
  df$femedu <- ifelse(df$country=="France", mapvalues(df$femedu, from = c(24, 25, 26, 27, 28, 29, 30),
                                                        to = c(0, 2, 3, 3, 3, 5, 5)), df$femedu) # didn't translate any 24:30 to 1:7
  df$femedu <- ifelse(df$country=="Italy", mapvalues(df$femedu, from = c(1, 2, 3, 4, 31, 32, 33),
                                                       to = c(0, 1, 2, 3, 5, 5, 5)), df$femedu)
  df$femedu <- ifelse(df$country=="Bulgaria", mapvalues(df$femedu, from = c(1, 2, 3, 4, 6, 7, 20),
                                                          to = c(0, 1, 2, 3, 5, 6, 0)), df$femedu)
  df$femedu <- ifelse(df$country=="Russia", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                        to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Georgia", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Germany", mapvalues(df$femedu, from = c(2, 3, 4, 5, 6, 7, 21, 22, 23),
                                                         to = c(1, 2, 3, 4, 5, 6, NA, NA, NA)), df$femedu) ## didn't translate 12:23 to NA
  df$femedu <- ifelse(df$country=="Hungary", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6),
                                                         to = c(0, 1, 2, 3, 4, 5)), df$femedu)
  df$femedu <- ifelse(df$country=="Netherlands", mapvalues(df$femedu, from = c(1, 2, 3, 4, 6, 7),
                                                             to = c(0, 1, 2, 3, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Romania", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Norway", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                        to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Austria", mapvalues(df$femedu, from = c(2, 3, 4, 5, 6, 7),
                                                         to = c(1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Estonia", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Belgium", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                         to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Australia", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7, 34, 37),
                                                           to = c(0, 1, 2, 3, 4, 5, 6, NA, NA)), df$femedu)
  df$femedu <- ifelse(df$country=="Lithuania", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                           to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="Poland", mapvalues(df$femedu, from = c(1, 2, 3, 4, 5, 6, 7),
                                                        to = c(0, 1, 2, 3, 4, 5, 6)), df$femedu)
  df$femedu <- ifelse(df$country=="CzechRepublic", mapvalues(df$femedu, from = c(3, 4, 5, 6, 7),
                                                               to = c(2, 3, 4, 5, 6)), df$femedu)
  df
  return(df)
}













