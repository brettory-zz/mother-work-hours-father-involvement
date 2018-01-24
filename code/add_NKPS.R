# Take father involvement information from NKPS (source file for Wave 1 Dutch GGS), and merge with Dutch GGS.
# Merge Dutch GGS country file with harmonized GGS, replace old Dutch information. 
# Working with GGS Dutch version Wave1_Netherlands_V.4.2, Downloaded in Jan 2016, and NKPS Wave_1_-_v2.0_July_21_2005, Downloaded in 2016


# if running directly from file and not sourcing:
# setwd("/Users/Brett/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - ASR/data/NL/")
# pacman::p_load(psych, reshape, data.table, foreign, Hmisc, stats, plyr, nFactors, FactoMineR, gdata, XLConnect, diffr) 


# load ggs data
ggsnl <- read.dta("data/GGS_Wave1_Netherlands_V.4.2.dta")

# variables harmonized: 
describe(ggsnl$a201a_a) # bathe
describe(ggsnl$a201a_c) # ill
# but, talk/discipline is used and transport in NKPS, not reported in GGS

# load nkps data
nkps <- read.dta("data/NKPS_main_wave1.dta")

# dvs:
describe(nkps$as14a) # bathing and dressing children
describe(nkps$ascp90a) # asked of current partner. 
describe(nkps$as14b) # ill
describe(nkps$ascp90b)
describe(nkps$as14c) # talk/discpline
describe(nkps$ascp90c)
describe(nkps$as14d) # transport
describe(nkps$ascp90d)

# alternate vars:
describe(nkps$as13a) # read
describe(nkps$ascp89a) # partner
describe(nkps$as13b) # play
describe(nkps$ascp89b) # partner
describe(nkps$as13c) # hmwk
describe(nkps$ascp89c) # parnter
describe(nkps$as13d) # transport
describe(nkps$ascp89d) # partner

# create data.table to add variables to ggs data
nkpsje <- data.table(nkps$famnum, nkps$as14a, nkps$ascp90a, nkps$as14b, nkps$ascp90b, nkps$as14c,
                     nkps$ascp90c, nkps$as14d, nkps$ascp90d, nkps$as13a, nkps$ascp89a, nkps$as13b, 
                     nkps$ascp89b, nkps$as13c, nkps$ascp89c, nkps$as13d, nkps$ascp89d)
setnames(nkpsje, c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11", "V12",
                   "V13", "V14", "V15", "V16", "V17"), 
         c("arid", "bathyyp", "bathpyp", "illyyp", "illpyp", "talkyyp", "talkpyp", 
           "transportyyp", "transportpyp", "readyf", "readpf", "playyf", "playpf",
           "hmwkyf", "hmwkpf", "transportyf", "transportpf"))

# merge
ggsnl <- merge(ggsnl, nkpsje, by = intersect(names(ggsnl), names(nkpsje)))

# cleanup workspace
rm(nkps, nkpsje)

# compare ggs data to nkps data
table(ggsnl$a201a_a, ggsnl$bathyyp)
table(ggsnl$a201a_a, ggsnl$bathpyp)
table(ggsnl$bathyyp, ggsnl$bathpyp)
describe(ggsnl$a201a_a)
describe(ggsnl$bathyyp) # frequency is higher with bathyyp


# keep selected variables
ggsnl <- ggsnl[ ,c("acountry", "arid", "aage", "asex", "aeduc", "aparstat", "atype", 
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
                   "a203a", "a204a", "femeduc", "a148", "a308", "bathyyp", "bathpyp", "illyyp", 
                   "illpyp", "talkyyp", "talkpyp", "transportyyp", "transportpyp", "readyf", 
                   "readpf", "playyf", "playpf", "hmwkyf", "hmwkpf", "transportyf", 
                   "transportpf")]

save(ggsnl, file="between steps data saves/ggsnl_011216.RData")

