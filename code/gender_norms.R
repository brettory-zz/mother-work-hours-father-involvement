# create gender egalitarian attitudes


# "a1113_a", Opinion: In a couple it is better for the man to be older than the woman  
ggs$oldman <- as.integer(ggs$a1113_a) 
ggs$oldman <- ggs$oldman - 1  
# 0 = strongly agree, 4 = strongly disagree
ggs$a1113_a <- NULL


# "a1113_b", Opinion: If woman earns more than partner, not good for relationship
ggs$richman <- as.integer(ggs$a1113_b)
ggs$richman <- ggs$richman - 1 
ggs$richman.au <- mapvalues(ggs$a1113_b_2400, from = c(1,2,3,4,5,6,7),
                            to = c(0,0,1,2,3,4,4))
ggs$richman <- ifelse(ggs$country=="Australia", ggs$richman.au, ggs$richman)
# 0 = strongly agree, 4 = strongly disagree
ggs$a1113_b <- NULL
ggs$a1113_b_2400 <- NULL
ggs$richman.au <- NULL


# "a1113_c", Opinion: On the whole, men make better political leaders than women
ggs$polmen <- as.integer(ggs$a1113_c)
ggs$polmen <- ggs$polmen - 1
ggs$polmen.au <- mapvalues(ggs$a1113_c_2400, from = c(1,2,3,4,5,6,7),
                           to = c(0,0,1,2,3,4,4))
ggs$polmen <- ifelse(ggs$country=="Australia", ggs$polmen.au, ggs$polmen)
# 0 = strongly agree, 4 = strongly disagree
ggs$a1113_c <- NULL
ggs$a1113_c_2400 <- NULL
ggs$polmen.au <- NULL


# "a1113_d", Opinion: Women should be able decide how to spend money without asking partner
ggs$spewo <- as.integer(ggs$a1113_d)
ggs$spewo <- 5 - ggs$spewo
# 0 = strongly disagree, 4 = strongly agree


# "a1113_e", Opinion: Looking after the home/family is just as fulfilling as working for pay
ggs$homful <- as.integer(ggs$a1113_e)
ggs$homful <- 5 - ggs$homful
# 0 = strongly disagree, 4 = strongly agree
ggs$a1113_e <- NULL


# "a1113_f", Opinion: A pre-school child is likely to suffer if his/her mother works
ggs$momwor <- as.integer(ggs$a1113_f)
ggs$momwor <- 5 - ggs$momwor
ggs$momwor.au <- mapvalues(ggs$a1113_f_2400, from = c(1,2,3,4,5,6,7),
                           to = c(4,4,3,2,1,0,0))
ggs$momwor <- ifelse(ggs$country=="Australia", ggs$momwor.au, ggs$momwor)
# 0 = strongly disagree, 4 = strongly agree
ggs$momwor.au <- NULL
ggs$a1113_f <- NULL
ggs$a1113_f_2400 <- NULL
# oops, this variable should be coded where agree = 0, disagree = 4
ggs$momwor <- 4 - as.numeric(ggs$momwor)


# "a1113_g", Opinion: Children often suffer because fathers concentrate too much on work
ggs$dadwor <- as.integer(ggs$a1113_g)
ggs$dadwor <- 5 - ggs$dadwor 
ggs$dadwor.au <- mapvalues(ggs$a1113_g_2400, from = c(1,2,3,4,5,6,7),
                           to = c(4,4,3,2,1,0,0))
ggs$dadwor <- ifelse(ggs$country=="Australia", ggs$dadwor.au, ggs$dadwor)
# 0 = strongly disagree, 4 = strongly agree
ggs$a1113_g <- NULL
ggs$a1113_g_2400 <- NULL
ggs$dadwor.au <- NULL  


# "a1113_h" Opinion: If parents divorce it's better for child stay with mother than father
ggs$divmom <- as.integer(ggs$a1113_h)
ggs$divmom <- ggs$divmom - 1 
ggs$divmom.au <- mapvalues(ggs$a1113_h_2400, from = c(1,2,3,4,5,6,7),
                           to = c(0,0,1,2,3,4,4))
ggs$divmom <- ifelse(ggs$country=="Australia", ggs$divmom.au, ggs$divmom)
# 0 = strongly agree, 4 = strongly disagree
ggs$a1113_h <- NULL
ggs$a1113_h_2400 <- NULL
ggs$divmom.au <- NULL


# note: norms only available for respondent, not spouse
# eigenvalue for 3 factors = 1.0245220, we take only factor directly related to gender egal:
# oldman, richman, polmen, & divmom
ggs$richman <- as.numeric(ggs$richman)
ggs$polmen <- as.numeric(ggs$polmen)
ggs$divmom <- as.numeric(ggs$divmom)
ggs$genegal <- rowMeans(ggs[,c("oldman", "richman", "polmen", "divmom")], na.rm = FALSE)

# cleanup old variables
ggs$oldman <- NULL
ggs$richman <- NULL
ggs$polmen <- NULL
ggs$spewo <- NULL
ggs$homful <- NULL
ggs$momwor <- NULL
ggs$dadwor <- NULL
ggs$divmom <- NULL