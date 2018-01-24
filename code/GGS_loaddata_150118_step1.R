## File loads GGS data & uses NKPS data for Dutch GGS
## working with GGS Wave1_V.4.2 downloaded in fall 2015 

# load data
ggs <- read.dta("data/GGS_Wave1_V.4.2.dta")

# keep selected variables
ggs <- ggs[ ,c("acountry", "arid", "aage", "asex", "aeduc", "aparstat", "atype", 
               "numres", "ageyoungest", "ageoldest", "ahg3_1", "ahg3_2", "ahg3_3", 
               "ahg3_4", "ahg3_5", "ahg3_6", "ahg3_7", "ahg3_8", "ahg3_9", 
               "ahg3_10", "ahg3_11", "ahg3_12", "ahg3_13", "ahg3_14", "ahg3_15", 
               "ahg3_16", "ahg3_17", "ahg5_1", "ahg5_2", "ahg5_3", "ahg5_4", 
               "ahg5_5", "ahg5_6", "ahg5_7", "ahg5_8", "ahg5_9", "ahg5_10", "ahg5_11", 
               "ahg5_12", "ahg5_13", "ahg5_14", "ahg5_15", "ahg5_16", "ahg5_17", 
               "ahg8_1", "ahg8_2", "ahg8_3", "ahg8_4", "ahg8_5", "ahg8_6", "ahg8_7", 
               "ahg8_8", "ahg8_9", "ahg8_10", "ahg8_11", "ahg8_12", "ahg8_13", "ahg8_14", 
               "ahg8_15", "ahg8_16", "ahg8_17", "a201a_a", "a201a_b", "a201a_c", 
               "a201a_d", "a201a_e", "a201a_f", "a835", "a901", "a923", "a1113_a", 
               "a1113_b", "a1113_b_2400", "a1113_c",  "a1113_c_2400", "a1113_d", "a1113_e", 
               "a1113_f", "a1113_f_2400", "a1113_g", "a1113_g_2400", "a1113_h", 
               "a1113_h_2400", "femage", "maleage", "maleeduc", "aactstat", "a802", "a902", 
               "a203a", "a204a", "femeduc", "a148", "a308", "a206_1", "a206_2", "a206_3",
               "a206_4", "a206_5", "a206_6", "a206_7", "a206_8", "a206_9", "a206_10",
               "a207_1", "a207_2", "a207_3", "a207_4", "a207_5", "a207_6", "a207_7", 
               "a207_8", "a207_9", "a207_10")]

save(ggs, file="between steps data saves/firstsave_150118.RData")
# load("between steps data saves/firstsave_150118.RData")

# load Dutch data
source("code/add_NKPS.R")
# load("data/ggsnl_011216.RData")

## prep ggsnl for combining with ggs

### dependent variables
ggsnl$a201a_a <- ggsnl$bathyyp # bathing the child. who does it more, you or your partner
ggsnl$a201a_c <- ggsnl$illyyp # staying home when ill. who does it more, you or your partner
ggsnl$a201a_f <- ggsnl$transportyyp # transporting the child. who does it more, you or your partner

### helping the child with homework is absolute involvement, but we have data from partners, so we can make it relative
# respondent's frequency
ggsnl$hmwkyf <- (as.numeric(mapvalues(ggsnl$hmwkyf, from = c("No answer", "Not at all", "Occasionally",
                                                             "Several times", "Yes (SPVA)"),
                                      to = c(NA, 0, 1, 2, NA)))) - 1 # 0 = not at all; 1 = occassionally; 2 = several times
# partner's frequency
ggsnl$hmwkpf <- as.numeric(ggsnl$hmwkpf) - 1
# convert absolute to relative frequency
ggsnl$a201a_etemp <- as.factor((ggsnl$hmwkyf)/(ggsnl$hmwkyf + ggsnl$hmwkpf))
# convert from numeric to factor
ggsnl$a201a_e <- mapvalues(ggsnl$a201a_etemp, from = c(0, 0.333333333333333, 0.5, 0.666666666666667, 1),
                           to = c("Always by you", "Usually by you", "Equal", "Usually by partner", "Always by partner"))

### playing with the child, frequency not relative measure
ggsnl$playyf <- (as.numeric(mapvalues(ggsnl$playyf, from = c("No answer", "Not at all", "Occasionally",
                                                             "Several times", "Yes (SPVA)"),
                                      to = c(NA, 0, 1, 2, NA)))) - 1 # 0 = not at all; 1 = occassionally; 2 = several times
ggsnl$playpf <- as.numeric(ggsnl$playpf) - 1
ggsnl$a201a_dtemp <- as.factor((ggsnl$playyf)/(ggsnl$playyf + ggsnl$playpf))
ggsnl$a201a_d <- mapvalues(ggsnl$a201a_dtemp, from = c(0, 0.333333333333333, 0.5, 0.666666666666667, 1),
                           to = c("Always by you", "Usually by you", "Equal", "Usually by partner", "Always by partner"))


# ggsnl & ggs have to have the same # (and names) of variables to use rbind to combine, so even tho NL doesn't have
# data on leave, include as emptty variable

# first find variable names
names(ggs)
names(ggsnl)

# manually save names list as two text files, then use diffr to compare differences
diffr("/Users/Brett/Dropbox/Fatherinvolv_jmf_s1/difference between R code/ggs.txt", 
      "/Users/Brett/Dropbox/Fatherinvolv_jmf_s1/difference between R code/ggsnl.txt", contextSize = 0, minJumpSize = 500)

# names(ggs[,c(95:114)]) needs to be added to ggsnl, and names(ggsnl[,(95:112)]) needs to be deleted from ggsnl
# first delete extra variables from ggsnl
ggsnl <- ggsnl[,-(95:112)]
# then add missing names to ggsnl
namevector <- names(ggs[,c(95:114)])
ggsnl[,namevector] <- NA

# combine ggs & ggsnl
ggscombi <- ggs
ggscombi <- ggscombi[ggscombi$acountry!="Netherlands",]
ggs <- as.data.frame(rbind(ggscombi, ggsnl))

# check that it worked
table(ggs$acountry, ggs$a201a_a) # looks good!

# clean up work space
rm(ggscombi, ggsnl, namevector)

# save data
save(ggs, file="between steps data saves/NL&GGS_150118.RData")

