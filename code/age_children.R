# create age of children


# for estonia & australia - in these countries they didn't record the age of resident children under 15, but if there is
# a resident child then we know they are under 15. This needs to be done prior to reshaping
ggs$isakid <- ifelse(((ggs$ahg3_1=="biological child with the current partner or spouse"
                       | ggs$ahg3_1=="biological child with former partner or spouse"
                       | ggs$ahg3_1=="stepchild" 
                       | ggs$ahg3_1=="adopted child" 
                       | ggs$ahg3_1=="foster child" 
                       | ggs$ahg3_1=="adopted or foster child"
                       | ggs$ahg3_1=="biological/adopted child with the current partner or spouse"
                       | ggs$ahg3_1=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_2=="biological child with the current partner or spouse"
                         | ggs$ahg3_2=="biological child with former partner or spouse"
                         | ggs$ahg3_2=="stepchild" 
                         | ggs$ahg3_2=="adopted child" 
                         | ggs$ahg3_2=="foster child" 
                         | ggs$ahg3_2=="adopted or foster child"
                         | ggs$ahg3_2=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_2=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_3=="biological child with the current partner or spouse"
                         | ggs$ahg3_3=="biological child with former partner or spouse"
                         | ggs$ahg3_3=="stepchild" 
                         | ggs$ahg3_3=="adopted child" 
                         | ggs$ahg3_3=="foster child" 
                         | ggs$ahg3_3=="adopted or foster child"
                         | ggs$ahg3_3=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_3=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_4=="biological child with the current partner or spouse"
                         | ggs$ahg3_4=="biological child with former partner or spouse"
                         | ggs$ahg3_4=="stepchild" 
                         | ggs$ahg3_4=="adopted child" 
                         | ggs$ahg3_4=="foster child" 
                         | ggs$ahg3_4=="adopted or foster child"
                         | ggs$ahg3_4=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_4=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_5=="biological child with the current partner or spouse"
                         | ggs$ahg3_5=="biological child with former partner or spouse"
                         | ggs$ahg3_5=="stepchild" 
                         | ggs$ahg3_5=="adopted child" 
                         | ggs$ahg3_5=="foster child" 
                         | ggs$ahg3_5=="adopted or foster child"
                         | ggs$ahg3_5=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_5=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_6=="biological child with the current partner or spouse"
                         | ggs$ahg3_6=="biological child with former partner or spouse"
                         | ggs$ahg3_6=="stepchild" 
                         | ggs$ahg3_6=="adopted child" 
                         | ggs$ahg3_6=="foster child" 
                         | ggs$ahg3_6=="adopted or foster child"
                         | ggs$ahg3_6=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_6=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_7=="biological child with the current partner or spouse"
                         | ggs$ahg3_7=="biological child with former partner or spouse"
                         | ggs$ahg3_7=="stepchild" 
                         | ggs$ahg3_7=="adopted child" 
                         | ggs$ahg3_7=="foster child" 
                         | ggs$ahg3_7=="adopted or foster child"
                         | ggs$ahg3_7=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_7=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_8=="biological child with the current partner or spouse"
                         | ggs$ahg3_8=="biological child with former partner or spouse"
                         | ggs$ahg3_8=="stepchild" 
                         | ggs$ahg3_8=="adopted child" 
                         | ggs$ahg3_8=="foster child" 
                         | ggs$ahg3_8=="adopted or foster child"
                         | ggs$ahg3_8=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_8=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_9=="biological child with the current partner or spouse"
                         | ggs$ahg3_9=="biological child with former partner or spouse"
                         | ggs$ahg3_9=="stepchild" 
                         | ggs$ahg3_9=="adopted child" 
                         | ggs$ahg3_9=="foster child" 
                         | ggs$ahg3_9=="adopted or foster child"
                         | ggs$ahg3_9=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_9=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_10=="biological child with the current partner or spouse"
                         | ggs$ahg3_10=="biological child with former partner or spouse"
                         | ggs$ahg3_10=="stepchild" 
                         | ggs$ahg3_10=="adopted child" 
                         | ggs$ahg3_10=="foster child" 
                         | ggs$ahg3_10=="adopted or foster child"
                         | ggs$ahg3_10=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_10=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_11=="biological child with the current partner or spouse"
                         | ggs$ahg3_11=="biological child with former partner or spouse"
                         | ggs$ahg3_11=="stepchild" 
                         | ggs$ahg3_11=="adopted child" 
                         | ggs$ahg3_11=="foster child" 
                         | ggs$ahg3_11=="adopted or foster child"
                         | ggs$ahg3_11=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_11=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_12=="biological child with the current partner or spouse"
                         | ggs$ahg3_12=="biological child with former partner or spouse"
                         | ggs$ahg3_12=="stepchild" 
                         | ggs$ahg3_12=="adopted child" 
                         | ggs$ahg3_12=="foster child" 
                         | ggs$ahg3_12=="adopted or foster child"
                         | ggs$ahg3_12=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_12=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_13=="biological child with the current partner or spouse"
                         | ggs$ahg3_13=="biological child with former partner or spouse"
                         | ggs$ahg3_13=="stepchild" 
                         | ggs$ahg3_13=="adopted child" 
                         | ggs$ahg3_13=="foster child" 
                         | ggs$ahg3_13=="adopted or foster child"
                         | ggs$ahg3_13=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_13=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_14=="biological child with the current partner or spouse"
                         | ggs$ahg3_14=="biological child with former partner or spouse"
                         | ggs$ahg3_14=="stepchild" 
                         | ggs$ahg3_14=="adopted child" 
                         | ggs$ahg3_14=="foster child" 
                         | ggs$ahg3_14=="adopted or foster child"
                         | ggs$ahg3_14=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_14=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_15=="biological child with the current partner or spouse"
                         | ggs$ahg3_15=="biological child with former partner or spouse"
                         | ggs$ahg3_15=="stepchild" 
                         | ggs$ahg3_15=="adopted child" 
                         | ggs$ahg3_15=="foster child" 
                         | ggs$ahg3_15=="adopted or foster child"
                         | ggs$ahg3_15=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_15=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_16=="biological child with the current partner or spouse"
                         | ggs$ahg3_16=="biological child with former partner or spouse"
                         | ggs$ahg3_16=="stepchild" 
                         | ggs$ahg3_16=="adopted child" 
                         | ggs$ahg3_16=="foster child" 
                         | ggs$ahg3_16=="adopted or foster child"
                         | ggs$ahg3_16=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_16=="biological/adopted child with former partner or spouse") |
                        (ggs$ahg3_17=="biological child with the current partner or spouse"
                         | ggs$ahg3_17=="biological child with former partner or spouse"
                         | ggs$ahg3_17=="stepchild" 
                         | ggs$ahg3_17=="adopted child" 
                         | ggs$ahg3_17=="foster child" 
                         | ggs$ahg3_17=="adopted or foster child"
                         | ggs$ahg3_17=="biological/adopted child with the current partner or spouse"
                         | ggs$ahg3_17=="biological/adopted child with former partner or spouse")), 1, 0)
# seems to have worked, but no 0 values if !=1
ggs$isakid <- ifelse(is.na(ggs$isakid), 0, ggs$isakid)


### have to reshape data to make age of children
# make data long
# memory not big enough to reshape, so first select only if isakid==1
shortggs <- ggs[ggs$isakid==1,] # 82605 with children

save(shortggs, file="between steps data saves/beforereshape_011216.RData")
# load("between steps data saves/beforereshape_311014.RData")

rm(ggs)
# This may take a while
longggs <- reshape(shortggs, idvar = "respid", ids = ggs$respid, 
                   times = names(shortggs[,c(4:20)]), timevar = "kidnum", 
                   varying = list(names(shortggs[,c(4:20)])), direction = "long")

save(longggs, file="between steps data saves/justreshaped_011216.RData") 
# load("between steps data saves/justreshaped_311014.RData")


rm(shortggs)
# delete rows that are not occupied by a household member
longggs <- longggs[complete.cases(longggs$ahg3_1), ]
longggs <- longggs[order(longggs$respid),]


# rename hgre_1
longggs$hhmember <- longggs$ahg3_1  # variable is called ahg3_ if just imported from Stata
longggs$ahg3_1 <- NULL

# make dummy variable if hh member is a kid or not
longggs$isakid <- ifelse((longggs$hhmember=="biological child with the current partner or spouse"
                          | longggs$hhmember=="biological child with former partner or spouse"
                          | longggs$hhmember=="stepchild" 
                          | longggs$hhmember=="adopted child" 
                          | longggs$hhmember=="foster child" 
                          | longggs$hhmember=="adopted or foster child"
                          | longggs$hhmember=="biological/adopted child with the current partner or spouse"
                          | longggs$hhmember=="biological/adopted child with former partner or spouse"), 
                         1, 0)

# make dummy if hh member is spouse
longggs$isspouse <- ifelse(longggs$hhmember=="partner or spouse", 1, 0)


# age of children 
# revise hh#age variables so they only have the age on the row of the reference child.
longggs$kidage1 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_1" & 
                             !is.na(longggs$ahg5_1)), longggs$ahg5_1, -99)
longggs$kidage2 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_2" & 
                             !is.na(longggs$ahg5_2)), longggs$ahg5_2, -99)
longggs$kidage3 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_3" & 
                             !is.na(longggs$ahg5_3)), longggs$ahg5_3, -99)
longggs$kidage4 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_4" & 
                             !is.na(longggs$ahg5_4)), longggs$ahg5_4, -99)
longggs$kidage5 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_5" & 
                             !is.na(longggs$ahg5_5)), longggs$ahg5_5, -99)
longggs$kidage6 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_6" & 
                             !is.na(longggs$ahg5_6)), longggs$ahg5_6, -99)
longggs$kidage7 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_7" & 
                             !is.na(longggs$ahg5_7)), longggs$ahg5_7, -99)
longggs$kidage8 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_8" & 
                             !is.na(longggs$ahg5_8)), longggs$ahg5_8, -99)
longggs$kidage9 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_9" & 
                             !is.na(longggs$ahg5_9)), longggs$ahg5_9, -99)
longggs$kidage10 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_10" & 
                              !is.na(longggs$ahg5_10)), longggs$ahg5_10, -99)
longggs$kidage11 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_11" & 
                              !is.na(longggs$ahg5_11)), longggs$ahg5_11, -99)
longggs$kidage12 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_12" & 
                              !is.na(longggs$ahg5_12)), longggs$ahg5_12, -99)
longggs$kidage13 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_13" & 
                              !is.na(longggs$ahg5_13)), longggs$ahg5_13, -99)
longggs$kidage14 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_14" & 
                              !is.na(longggs$ahg5_14)), longggs$ahg5_14, -99)
longggs$kidage15 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_15" & 
                              !is.na(longggs$ahg5_15)), longggs$ahg5_15, -99)
longggs$kidage16 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_16" & 
                              !is.na(longggs$ahg5_16)), longggs$ahg5_16, -99)
longggs$kidage17 <- ifelse((longggs$isakid==1 & longggs$kidnum=="ahg3_17" & 
                              !is.na(longggs$ahg5_17)), longggs$ahg5_17, -99)


# for some reason kidage14 is a charachter variable
longggs$kidage14 <- as.numeric(longggs$kidage14)

# combine in one variable
tempvars <- names(longggs) %in% c("ahg5_1", "ahg5_2", "ahg5_3", "ahg5_4", "ahg5_5", 
                                  "ahg5_6", "ahg5_7", "ahg5_8", "ahg5_9", "ahg5_10",
                                  "ahg5_11", "ahg5_12", "ahg5_13", "ahg5_14", "ahg5_15", 
                                  "ahg5_16", "ahg5_17")
longggs <- longggs[!tempvars]  
rm(tempvars)

save(longggs, file="between steps data saves/prelongwide_011216.RData")
# load("between steps data saves/prelongwide_011216.RData")

# 2201 for estonia is causing problems, change 2201 to 15
longggs$kidage1 <- ifelse((longggs$kidage1==2201), 15, longggs$kidage1)
longggs$kidage2 <- ifelse((longggs$kidage2==2201), 15, longggs$kidage2)
longggs$kidage3 <- ifelse((longggs$kidage3==2201), 15, longggs$kidage3)
longggs$kidage4 <- ifelse((longggs$kidage4==2201), 15, longggs$kidage4)
longggs$kidage5 <- ifelse((longggs$kidage5==2201), 15, longggs$kidage5)
longggs$kidage6 <- ifelse((longggs$kidage6==2201), 15, longggs$kidage6)
longggs$kidage7 <- ifelse((longggs$kidage7==2201), 15, longggs$kidage7)
longggs$kidage8 <- ifelse((longggs$kidage8==2201), 15, longggs$kidage8)
longggs$kidage9 <- ifelse((longggs$kidage9==2201), 15, longggs$kidage9)
longggs$kidage10 <- ifelse((longggs$kidage10==2201), 15, longggs$kidage10)
longggs$kidage11 <- ifelse((longggs$kidage11==2201), 15, longggs$kidage11)
longggs$kidage12 <- ifelse((longggs$kidage12==2201), 15, longggs$kidage12)
longggs$kidage13 <- ifelse((longggs$kidage13==2201), 15, longggs$kidage13)
longggs$kidage14 <- ifelse((longggs$kidage14==2201), 15, longggs$kidage14)
longggs$kidage15 <- ifelse((longggs$kidage15==2201), 15, longggs$kidage15)
longggs$kidage16 <- ifelse((longggs$kidage16==2201), 15, longggs$kidage16)
longggs$kidage17 <- ifelse((longggs$kidage17==2201), 15, longggs$kidage17)


# create one variable of oldest kid's age: kidage
kidagevars <- names(longggs) %in% c("kidage1", "kidage2", "kidage3", "kidage4", "kidage5", 
                                    "kidage6", "kidage7", "kidage8", "kidage9", "kidage10",
                                    "kidage11", "kidage12", "kidage13", "kidage14", "kidage15", 
                                    "kidage16", "kidage17")

longggs$kidage <- apply(longggs[,kidagevars], 1, max) 
is.na(longggs$kidage) <- which(longggs$kidage==-99)

ggs <- longggs

# under 16 
ggs$under16 <- ifelse((ggs$kidage<16), 1, 0)

# under 7
ggs$under7 <- ifelse((ggs$kidage<7), 1, 0)

# under 4 
ggs$anyunder4 <- ifelse(ggs$ageyoungest<4,1,0)


# aggregate to finish under 16
# 1. create data.table to make aggregated variable. we will later merge this with eqls
tempdata <- data.table(ggs$under16, ggs$under7, ggs$respid)
aggdat1 <- tempdata[, sum(V1, na.rm=T), by=V3] 
aggdat1$under16ag <- aggdat1$V1
aggdat1$V1 <- NULL
aggdat2 <- tempdata[, sum(V2, na.rm=T), by=V3]
aggdat2$under7ag <- aggdat2$V1
aggdat2$V1 <- NULL

# 2. merge aggregated data (aggdat)
aggdat1$respid <- aggdat1$V3
aggdat1$V3 <- NULL
aggdat2$respid <- aggdat2$V3
aggdat2$V3 <- NULL
aggdat <- merge(aggdat1, aggdat2, by = intersect(names(aggdat1), names(aggdat2)))

ggs <- merge(ggs, aggdat, by = intersect(names(ggs), names(aggdat)))

# 3. clean up
rm(aggdat, aggdat1, aggdat2, tempdata, kidagevars)

# 5. right now vars = number of kids in family under 15. set this equal to number of
# kids in family to make sure all kids in hh are under 15
# all under 15
ggs$under16 <- ifelse((ggs$under16ag==ggs$numkid), 1, 0)
ggs$under16ag <- NULL

# all under 6
ggs$under7 <- ifelse((ggs$under7ag==ggs$numkid), 1, 0)
ggs$under7ag <- NULL

rm(longggs)
save(ggs, file="between steps data saves/ggs_temp.011216.RData")
# load("between steps data saves/ggs_temp.011216.RData")



