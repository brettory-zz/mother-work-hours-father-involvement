# Father involvement: 
# This function creates 8 variables. 6 are measures of relative father involvement based on variables a201a_a to a201a_f, where 
# fi_a) dressing the children, fi_b) put to bed, fi_c) stay home when sick, fi_d) play, fi_e) homework, fi_f) transport. 
# Remaining 2 variables are: 
# fistr) total time structuring involvement measured as mean of fi_a, fi_b, fi_c, and fi_f; 
# fifle) total time flexible involvement measuredd as mean of fi_d and fi_e
# final answer categories are on a scale of 0-4, where 0 = always mother, 4 = always father.
# Note: countries missing extreme categories ("always" categories), got coded as almost always (1 instead of 0, 3 instead of 4)


father_involvement_universal_clean <- function(df) {

  # fi_a (father involvement _ dress)
  df$fi_a <- mapvalues(df$a201a_a, from = c("always R", "usually R", "R and Partner about equally", 
                                              "usually partner", "always partner", "always or usually other persons in the household", 
                                              "always or usually someone not living in the household", 
                                              "children do it themselves", "does not know", "refusal", 
                                              "not applicable/no response", "usually R", "R and P about equally", 
                                              "usually P", "no response/not applicable", "refusal", 
                                              "does not know", "Always by you", "Usually by you", "Equal",
                                              "Usually by partner", "Always by partner"),
                        to = c(4, 3, 2, 1, 0, 2, 2, 2, 10, 10, 10, 3, 2, 1, 10, 10, 10, 4, 3, 2, 1, 0))
  is.na(df$fi_a) <- which(df$fi_a==10)
  df$fi_a2 <- as.integer(df$fi_a)
  df$fi_a3 <- mapvalues(df$fi_a2, from = c(1, 2, 3, 4, 5), to = c(4, 3, 2, 1, 0))
  df$fi_a <- df$fi_a3
  df$fi_a2 <- NULL
  df$fi_a3 <- NULL
  # if female, reverse code so 0 = all female and 4 = all male
  df$fi_a <- ifelse(df$female==0, df$fi_a, 4 - df$fi_a)
  df$a201a_a <- NULL
  
  
  
  # fi_b (father involvement _ bed)
  df$fi_b <- mapvalues(df$a201a_b, from = c("always R", "usually R", "R and Partner about equally", 
                                              "usually partner", "always partner", "always or usually other persons in the household", 
                                              "always or usually someone not living in the household", 
                                              "children do it themselves", "does not know", "refusal", 
                                              "not applicable/no response", "usually R", "R and P about equally", 
                                              "usually P", "no response/not applicable", "refusal", 
                                              "does not know"),
                        to = c(4, 3, 2, 1, 0, 2, 2, 2, 10, 10, 10, 3, 2, 1, 10, 10, 10))
  is.na(df$fi_b) <- which(df$fi_b==10)
  df$fi_b2 <- as.integer(df$fi_b)
  df$fi_b3 <- mapvalues(df$fi_b2, from = c(1, 2, 3, 4, 5), to = c(4, 3, 2, 1, 0))
  df$fi_b <- df$fi_b3
  df$fi_b2 <- NULL
  df$fi_b3 <- NULL
  # if female, reverse code so 0 = all female and 4 = all male
  df$fi_b <- ifelse(df$female==0, df$fi_b, 4 - df$fi_b)
  df$a201a_b <- NULL
  
  # fi_c (father involvement _ sick)
  df$fi_c <- mapvalues(df$a201a_c, from = c("always R", "usually R", "R and Partner about equally", 
                                              "usually partner", "always partner", "always or usually other persons in the household", 
                                              "always or usually someone not living in the household", 
                                              "children do it themselves", "does not know", "refusal", 
                                              "not applicable/no response", "usually R", "R and P about equally", 
                                              "usually P", "no response/not applicable", "refusal", 
                                              "does not know", "Always by you", "Usually by you", "Equal",
                                              "Usually by partner", "Always by partner"),
                        to = c(4, 3, 2, 1, 0, 2, 2, 2, 10, 10, 10, 3, 2, 1, 10, 10, 10, 4, 3, 2, 1, 0))
  is.na(df$fi_c) <- which(df$fi_c==10)
  df$fi_c2 <- as.integer(df$fi_c)
  df$fi_c3 <- mapvalues(df$fi_c2, from = c(1, 2, 3, 4, 5), to = c(4, 3, 2, 1, 0))
  df$fi_c <- df$fi_c3
  df$fi_c2 <- NULL
  df$fi_c3 <- NULL
  # if female, reverse code so 0 = all female and 4 = all male
  df$fi_c <- ifelse(df$female==0, df$fi_c, 4 - df$fi_c)
  df$a201a_c <- NULL
  
  # fi_d (father involvement _ play)
  df$fi_d <- mapvalues(df$a201a_d, from = c("always R", "usually R", "R and Partner about equally", 
                                              "usually partner", "always partner", "always or usually other persons in the household", 
                                              "always or usually someone not living in the household", 
                                              "children do it themselves", "does not know", "refusal", 
                                              "not applicable/no response", "usually R", "R and P about equally", 
                                              "usually P", "no response/not applicable", "refusal", 
                                              "does not know", "Always by you", "Usually by you", "Equal",
                                              "Usually by partner", "Always by partner", "NaN"),
                        to = c(4, 3, 2, 1, 0, 2, 2, 2, 10, 10, 10, 3, 2, 1, 10, 10, 10, 4, 3, 2, 1, 0, 10))
  is.na(df$fi_d) <- which(df$fi_d==10)
  df$fi_d2 <- as.integer(df$fi_d)
  df$fi_d3 <- mapvalues(df$fi_d2, from = c(1, 2, 3, 4, 5), to = c(4, 3, 2, 1, 0))
  df$fi_d <- df$fi_d3
  df$fi_d2 <- NULL
  df$fi_d3 <- NULL
  # if female, reverse code so 0 = all female and 4 = all male
  df$fi_d <- ifelse(df$female==0, df$fi_d, 4 - df$fi_d)
  df$a201a_d <- NULL
  
  # fi_e (father involvement _ homework)
  df$fi_e <- as.numeric(mapvalues(df$a201a_e, from = c(1, 2, 3, 4, 5, 6, 7, 8, 2201, 2202, 
                                                         2203, 1701, 1702, 1703, 
                                                         1704, 1705, 1706, "Always by you", "Usually by you", "Equal",
                                                         "Usually by partner", "Always by partner"),
                                   to = c(4, 3, 2, 1, 0, 2, 2, 2, 3, 2, 1, 
                                          3, 2, 1, 10, 10, 10, 4, 3, 2, 1, 0)))
  is.na(df$fi_e) <- which(df$fi_e==10)
  # if female, reverse code so 0 = all female and 4 = all male
  df$fi_e <- ifelse(df$female==0, df$fi_e, 4 - df$fi_e)
  df$a201a_e <- NULL
  
  # fi_f (father involvement _ transport)
  df$fi_f <- as.numeric(mapvalues(df$a201a_f, from = c(1, 2, 3, 4, 5, 6, 7, 8, 2201, 2202, 
                                                         2203, 1701, 1702, 1703, 
                                                         1704, 1705, 1706, "Always by you", "Usually by you", "Equal",
                                                         "Usually by partner", "Always by partner"),
                                   to = c(4, 3, 2, 1, 0, 2, 2, 2, 3, 2, 1, 
                                          3, 2, 1, 10, 10, 10, 4, 3, 2, 1, 0)))
  is.na(df$fi_f) <- which(df$fi_f==10)
  # if female, reverse code so 0 = all female and 4 = all male
  df$fi_f <- ifelse(df$female==0, df$fi_f, 4 - df$fi_f)
  df$a201a_f <- NULL
  
  ## create time structuring and time-flexible tasks
  df$fistr <- rowMeans(df[,c("fi_a", "fi_b", "fi_c", "fi_f")], na.rm=T) # Father involvement in structuring childcare
  df$fifle <- rowMeans(df[,c("fi_d", "fi_e")], na.rm=T) # father involvement in flexible childcare

  df
  return(df)

}
