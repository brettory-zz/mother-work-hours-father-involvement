# subset data

# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(psych, reshape, data.table, foreign, Hmisc, stats, plyr, nFactors, FactoMineR, gdata, XLConnect, diffr) 
# load("between steps data saves/ggs_presubset_081214.RData")



# made wide again by selecting only respondent:
ggs.resp <- ggs[ggs$hhmember=="respondent",] # after this selection 82605 resp 


# respondent lives with partner with at least one children, oldest under 13, partner works 1+ hour/week
ggs.resp <- ggs.resp[ggs.resp$cohab==1,] # 69220
ggs.resp <- ggs.resp[ggs.resp$numkid>=1,] # 0 missing, 69220
ggs.resp <- ggs.resp[ggs.resp$under16==1,] # 36814 left
ggs.resp <- ggs.resp[ggs.resp$memp==1,] # 26361
ggs.resp <- ggs.resp[ggs.resp$momlea==0,] # 22611


# If running analysis also on moms who don't work, don't run last two lines above. Also, run this:
# ggs.resp$hrwkMom <- ifelse(is.na(ggs.resp$hrwkMom), 0, ggs.resp$hrwkMom)


# topcode & mean center variables - RESPONDENT DATA - NOTE: TOPCODING DONE USING WEIGHTS, NOT CENTERING
# group center based on national averages
# first, aggregate age, edu, hrwk
# 1. create data.table to make aggregated variable. we will later merge this with ggs.resp
tempdata <- data.table(ggs.resp$maleedu, ggs.resp$femedu, 
                       ggs.resp$maleage, ggs.resp$hrwkMom, ggs.resp$hrwkDad,
                       ggs.resp$respid, ggs.resp$country)
aggdat1 <- tempdata[, mean(V1, na.rm=T), by=V7] 
aggdat1$maleeduag <- aggdat1$V1
aggdat1$V1 <- NULL
aggdat2 <- tempdata[, mean(V2, na.rm=T), by=V7]
aggdat2$femeduag <- aggdat2$V1
aggdat2$V1 <- NULL
aggdat3 <- tempdata[, mean(V3, na.rm=T), by=V7] 
aggdat3$maleageag <- aggdat3$V1
aggdat3$V1 <- NULL
aggdat4 <- tempdata[, mean(V4, na.rm=T), by=V7] 
aggdat4$hrwkMomag <- aggdat4$V1
aggdat4$V1 <- NULL
aggdat5 <- tempdata[, mean(V5, na.rm=T), by=V7] 
aggdat5$hrwkDadag <- aggdat5$V1
aggdat5$V1 <- NULL


# 2. merge aggregated data (aggdat)
aggdat1$country <- aggdat1$V7
aggdat1$V7 <- NULL
aggdat2$country <- aggdat2$V7
aggdat2$V7 <- NULL
aggdat3$country <- aggdat3$V7
aggdat3$V7 <- NULL
aggdat4$country <- aggdat4$V7
aggdat4$V7 <- NULL
aggdat5$country <- aggdat5$V7
aggdat5$V7 <- NULL


aggdat12 <- merge(aggdat1, aggdat2, by = intersect(names(aggdat1), names(aggdat2)))
aggdat34 <- merge(aggdat3, aggdat4, by = intersect(names(aggdat3), names(aggdat4)))
aggdat1234 <- merge(aggdat12, aggdat34, by = intersect(names(aggdat12), names(aggdat34)))
aggdat <- merge(aggdat1234, aggdat5, by = intersect(names(aggdat1234), names(aggdat5)))

ggs.resp <- merge(ggs.resp, aggdat, by = intersect(names(ggs.resp), names(aggdat)))


# 3. clean up
rm(aggdat, aggdat1, aggdat12, aggdat1234, aggdat2, aggdat3, aggdat34, aggdat4,
   aggdat5, tempdata)


# mean center variables
# male age
ggs.resp$maleage.c <- ggs.resp$maleage - ggs.resp$maleageag
# male edu
ggs.resp$maleedu.c <- ggs.resp$maleedu - ggs.resp$maleeduag 
# female edu
ggs.resp$femedu.c <- ggs.resp$femedu - ggs.resp$femeduag
# hrwkMom
describe(ggs.resp$hrwkMom)
ggs.resp$hrwkMom <- ifelse(ggs.resp$hrwkMom>50, 50, ggs.resp$hrwkMom)
ggs.resp$hrwkMom.c <- ggs.resp$hrwkMom - ggs.resp$hrwkMomag
# hrwkpDad
describe(ggs.resp$hrwkDad)
ggs.resp$hrwkDad <- ifelse(ggs.resp$hrwkDad>60, 60, ggs.resp$hrwkDad)
ggs.resp$hrwkDad <- ifelse(ggs.resp$hrwkDad==0, 1, ggs.resp$hrwkDad)
ggs.resp$hrwkDad.c <- ggs.resp$hrwkDad - ggs.resp$hrwkDadag


# remove missing gender
ggs.resp <- ggs.resp[!is.na(ggs.resp$female),] # 22480


# save as is
save(ggs.resp, file="data/ggs.mf_011216.RData")
# load("data/ggs.mf_011216.RData")


# convert to stata file
# load("data/ggs.mf_011216.RData")
# write.dta(ggs.resp, "data/ggs.under16_011216.dta")


# alternate save if including women who work 0 hours in sample
# save(ggs.resp, file="data/ggs.mf.0hr_201515.RData")



