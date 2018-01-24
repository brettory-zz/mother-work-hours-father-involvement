# make individiaul level variables

# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(psych, reshape, data.table, foreign, Hmisc, stats, plyr, nFactors, FactoMineR, gdata, XLConnect, diffr) 
# load("between steps data saves/NL&GGS_150118.RData")



# country: 
ggs$country <- ggs$acountry # 17 countries
ggs$acountry <- NULL


# respondent id  
ggs$rid <- ggs$arid
ggs$arid <- NULL
ggs.sort <- ggs[order(ggs$rid),]
# it looks like each country has their own respondent ids, and all start with 1, 
# so there are multiple 1s, 2s, etc. Add country code to beginning of rid
ggs.sort <- ggs.sort[order(ggs.sort$country),]
ggs.sort$cid <- mapvalues(ggs.sort$country, from = c("Bulgaria", "Russia", "Georgia",
                                                     "Germany", "France", "Hungary", 
                                                     "Italy", "Netherlands", "Romania", 
                                                     "Norway", "Austria", "Estonia",
                                                     "Belgium", "Australia", "Lithuania", 
                                                     "Poland", "CzechRepublic"),
                          to = c("BU", "RU", "GE", "DE", "FR", "HU", "IT", "NL", 
                                 "RO", "NO", "AT", "EE", "BE", "AU", "LI", "PO", 
                                 "CZ"))
ggs.sort$respid <- paste(ggs.sort$cid, ggs.sort$rid, sep="")
ggs <- ggs.sort[order(ggs.sort$respid),]
rm(ggs.sort)
ggs$rid <- NULL
ggs$cid <- NULL


# sex of respondent
ggs$female <- ifelse(ggs$asex=="female", 1, 0)
ggs$asex <- NULL


# age 
describe(ggs$maleage) # this variable is pre-calculated by GGS. If male, this is respondent's aage, 
                      # if respondent is female and partnered to a male, this is her partner's age
describe(ggs$femage)
ggs$aage <- NULL


# Male and female hours worked
# partner hours worked, 997, 998, 999 = NA
is.na(ggs$a923) <- which(ggs$a923==997 | ggs$a923==998 | ggs$a923==999)
# respondent hours worked per week
is.na(ggs$a835) <- which(ggs$a835==997 | ggs$a835==998 | ggs$a835==999)
# convert to male/female hours per week
ggs$hrwkMom <- ifelse(ggs$female==1, ggs$a835, ggs$a923)
ggs$hrwkDad <- ifelse(ggs$female==0, ggs$a835, ggs$a923)


# Father involvement: 
# This function creates 8 variables. 6 are measures of relative father involvement based on variables a201a_a to a201a_f, where 
# fi_a) dressing the children, fi_b) put to bed, fi_c) stay home when sick, fi_d) play, fi_e) homework, fi_f) transport. 
# Remaining 2 variables are: 
# fistr) total time structuring involvement measured as mean of fi_a, fi_b, fi_c, and fi_f; 
# fifle) total time flexible involvement measuredd as mean of fi_d and fi_e
# final answer categories are on a scale of 0-4, where 0 = always mother, 4 = always father.
# Note: countries missing extreme categories ("always" categories), got coded as almost always (1 instead of 0, 3 instead of 4)
source("code/fatherinvolvement_function.R")
ggs <- father_involvement_universal_clean(ggs)


# Male education level 
# GGS has a variable maleedu, but it is missing a lot of values, especially if the main respondent was female. 
# Here I recreate this per country.
ggs$maleedu <- mapvalues(ggs$maleeduc, from = c("isced 0 - pre-primary education",
                                                "isced 1 - primary level", 
                                                "isced 2 - lower secondary level",
                                                "isced 3 - upper secondary level",
                                                "isced 4 - post secondary non-tertiary",
                                                "isced 5 - first stage of tertiary",
                                                "isced 6 - second stage of tertiary"),
                         to = c(0, 1, 2, 3, 4, 5, 6))
ggs$maleedu <- as.integer(ggs$maleedu) - 1
ggs$aeduc <- NULL
ggs$maleeduc <- NULL

source("code/male_education_function.R")
ggs <- male_education_universal_clean(ggs)


# Female education level 
ggs$femedu <- mapvalues(ggs$femeduc, from = c("isced 0 - pre-primary education",
                                              "isced 1 - primary level", 
                                              "isced 2 - lower secondary level",
                                              "isced 3 - upper secondary level",
                                              "isced 4 - post secondary non-tertiary",
                                              "isced 5 - first stage of tertiary",
                                              "isced 6 - second stage of tertiary"),
                        to = c(0, 1, 2, 3, 4, 5, 6))
ggs$femedu <- as.integer(ggs$femedu) - 1
ggs$aeduc <- NULL
ggs$femeduc <- NULL

source("code/female_education_function.R")
ggs <- female_education_universal_clean(ggs)


# rural/urban
ggs$domicile <- ggs$atype
ggs$urban <- ifelse((ggs$domicile==2 | ggs$domicile==1201 | ggs$domicile==1202 | ggs$domicile==1203
                     | ggs$domicile==1301 | ggs$domicile==1401 | ggs$domicile==1402 | ggs$domicile==1403
                     | ggs$domicile==1404 | ggs$domicile==1405 | ggs$domicile==1406 | ggs$domicile==1502
                     | ggs$domicile==1503 | ggs$domicile==1801 | ggs$domicile==1802 | ggs$domicile==1803 
                     | ggs$domicile==2004 | ggs$domicile==2401 | ggs$domicile==2402 | ggs$domicile==2504 
                     | ggs$domicile==2505 | ggs$domicile==2602 | ggs$domicile==2603), 1, 0)
ggs$atype <- NULL
ggs$domicile <- NULL


# childcare, 1 if either formal or informal childcare help. a203a = formal, a204a = informal
ggs$helpform <- ifelse((ggs$a203a=="yes"),1,0)
ggs$helpinform <- ifelse((ggs$a204a=="yes"),1,0)
ggs$help <- ifelse((ggs$helpform==1 | ggs$helpinform==1),1,0)
# clean up variables
ggs$a203a <- NULL
ggs$a204a <- NULL


# gender norms
# source code creates one factor measuring gender egalitarian norms called "genegal". This is a mean of the following questions:
# "a1113_a", Opinion: In a couple it is better for the man to be older than the woman  
# "a1113_b", Opinion: If woman earns more than partner, not good for relationship
# "a1113_c", Opinion: On the whole, men make better political leaders than women
# "a1113_h" Opinion: If parents divorce it's better for child stay with mother than father
# final variable is a scale from 0-4, where 0 = conservative gender norms, 4 = progressive gender norms
source("code/gender_norms.R")


# number children at home
ggs$numkid <- ggs$numres
ggs$numres <- NULL


# momlea - is mother on maternal leave
ggs$momlea <- ifelse(ggs$female==1, ggs$a802, ggs$a902)
ggs$momlea <- ifelse((ggs$momlea==1 | ggs$momlea==2 | ggs$momlea==3),1,0)
ggs$momlea <- ifelse((ggs$momlea==1 & !is.na(ggs$momlea)), 1, 0)


# memp - is mother employed
ggs$memp <- ifelse(((ggs$female==1 & ggs$aactstat=="employed or self-employed" |
                       ggs$aactstat=="helping family member in family business" |
                       ggs$aactstat=="maternity,parental,childcare leave" |
                       ggs$aactstat=="military service or social service" |
                       ggs$aactstat=="working pensioner" |
                       ggs$aactstat=="in apprenticeship or paid training") |
                      (ggs$female==0 & ggs$a901=="employed or self-employed" |
                         ggs$a901=="helping family member in a family business or a farm" |
                         ggs$a901=="on maternity leave, parental leave or childcare leave" |
                         ggs$a901=="in military service or social service" |
                         ggs$a901=="working pensioner" | 
                         ggs$a901=="in apprenticeship or paid training")), 1, 0)


# make variable ever taken leave
# for which hh member have you taken leave yourself (ls1 = leave self 1st time = 10th time (I think, but CHECK THIS!!!))
ggs$ls1 <- as.numeric(ggs$a206_1)

# for which hh member has your parter taken leave (lp1 = leave partner 1st time)
ggs$lp1 <- as.numeric(ggs$a207_1)

ggs$leaveself <- ifelse((ggs$ls1>1 & ggs$ls1<=13), 1, 0)
ggs$leavepartner <- ifelse((ggs$lp1>1 & ggs$lp1<=9), 1, 0)
ggs$leavedad <- ifelse(((ggs$leaveself==1 & ggs$female==0) | (ggs$leavepartner==1 & ggs$female==1)), 1, 0)
ggs$leavemom <- ifelse(((ggs$leaveself==1 & ggs$female==1) | (ggs$leavepartner==1 & ggs$female==0)), 1, 0)
ggs$ls1 <- NA
ggs$lp1 <- NA
ggs$leaveself <- NA
ggs$leavepartner <- NA



# save for later. The next step is computationally expensive, so save here in case you want to go back and change something
save(ggs, file="between steps data saves/beforenorms_011216.RData")
# load("between steps data saves/beforenorms_251116.RData")


# Create age children
# This file creates the following variables: 
# "kidage": age of child.      
# "under16": 1 = any children under age 16 (0-15); 0 = no children under 16    
# "under7": 1 = any children under 7; 0 = no children under 7      
# "anyunder4": 1 = any children under 4; 0 = no children under 4
source("code/age_children.R")

# clean up variables
ggs <- ggs[,c("aparstat", "ageyoungest", "ageoldest", "femage", "maleage",
                                    "country",  "respid", "female", "hrwkMom", "hrwkDad", "fi_a",
                                    "fi_b", "fi_c", "fi_d", "fi_e", "fi_f", "fistr", "fifle", "maleedu",
                                    "femedu", "urban", "helpform", "helpinform", "help", "genegal", 
                                    "numkid", "momlea", "memp", "leavedad", "leavemom", "isakid", "kidnum",
                                    "hhmember", "isspouse", "kidage", "under16", "under7", "anyunder4")]


rm(longggs,kidagevars)

# Cohabiting: do mom and dad live together?
ggs$cohab <- ifelse(ggs$aparstat=="co-resident partner", 1, 0)

# save data before subsetting
save(ggs, file="between steps data saves/beforemacro_011216.RData")
# load("between steps data saves/beforemacro_011216.RData")


