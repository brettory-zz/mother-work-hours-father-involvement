# descriptives for Table 1



# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(xtable, data.table, xlsx) 
# load("data/ggs.mf_011216.RData")



# add pat leave, GEM, GPG
load("between steps data saves/md.RData")


means <- c(mean(ggs.resp$fistr, na.rm=T), mean(ggs.resp$fifle, na.rm=T), 
           mean(ggs.resp$hrwkMom, na.rm=T), mean(ggs.resp$maleage, na.rm=T),
           mean(ggs.resp$femedu, na.rm=T), mean(ggs.resp$maleedu, na.rm=T),
           mean(ggs.resp$numkid, na.rm=T), mean(ggs.resp$anyunder4, na.rm=T),
           mean(ggs.resp$female, na.rm=T), mean(md$pat, na.rm=T),
           mean(md$gem, na.rm=T), mean(md$gpg, na.rm=T))
sds <- c(sd(ggs.resp$fistr, na.rm=T), sd(ggs.resp$fifle, na.rm=T), 
         sd(ggs.resp$hrwkMom, na.rm=T), sd(ggs.resp$maleage, na.rm=T),
         sd(ggs.resp$femedu, na.rm=T), sd(ggs.resp$maleedu, na.rm=T),
         sd(ggs.resp$numkid, na.rm=T), sd(ggs.resp$anyunder4, na.rm=T),
         sd(ggs.resp$female, na.rm=T), sd(md$pat, na.rm=T),
         sd(md$gem, na.rm=T), sd(md$gpg, na.rm=T))
mins <- c(min(ggs.resp$fistr, na.rm=T), min(ggs.resp$fifle, na.rm=T), 
          min(ggs.resp$hrwkMom, na.rm=T), min(ggs.resp$maleage, na.rm=T),
          min(ggs.resp$femedu, na.rm=T), min(ggs.resp$maleedu, na.rm=T),
          min(ggs.resp$numkid, na.rm=T), min(ggs.resp$anyunder4, na.rm=T),
          min(ggs.resp$female, na.rm=T), min(md$pat, na.rm=T),
          min(md$gem, na.rm=T), min(md$gpg, na.rm=T))
maxs <- c(max(ggs.resp$fistr, na.rm=T), max(ggs.resp$fifle, na.rm=T), 
          max(ggs.resp$hrwkMom, na.rm=T), max(ggs.resp$maleage, na.rm=T),
          max(ggs.resp$femedu, na.rm=T), max(ggs.resp$maleedu, na.rm=T),
          max(ggs.resp$numkid, na.rm=T), max(ggs.resp$anyunder4, na.rm=T),
          max(ggs.resp$female, na.rm=T), max(md$pat, na.rm=T),
          max(md$gem, na.rm=T), max(md$gpg, na.rm=T))

table1_descriptives <- data.frame(means, sds, mins, maxs, 
                           row.names = c("Father's share of time-structuring tasks",
                                         "Father's share of time-flexible tasks",
                                         "Mother's hours of work", "Father age",
                                         "Mother education", "Father education",
                                         "Number of kids", "Any under age four",
                                         "Gender of respondent", "Paternity leave",
                                         "GEM score", "Gender pay gap"))
names(table1_descriptives) <- c("Mean", "SD", "Min", "Max")


save(table1_descriptives, file="analyses/figures/Table 1/table1_descriptives_180118.RData")
load("analyses/figures/Table 1/table1_descriptives_180118.RData")
View(table1_descriptives)

### print as excel sheet
write.xlsx(table1_descriptives, file="analyses/figures/Table 1/table1_descriptives_180118.xlsx")
  ## I manually cleaned this table up a little in excel. See file table1_descriptives_180118_final.xlsx

# clean workspace
rm(means, sds, mins, maxs, md, table1_descriptives)


