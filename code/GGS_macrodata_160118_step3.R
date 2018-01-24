# MACRO DATA

# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(psych, reshape, data.table, foreign, Hmisc, stats, plyr, nFactors, FactoMineR, gdata, XLConnect, diffr) 
# load("between steps data saves/beforemacro_011216.RData")


wk <- loadWorkbook("data/all_data_v2.xls") 
md <- readWorksheet(wk, sheet="Sheet3")
rm(wk)


# select only countries we have in ggs 
md$country <- md$Country
md <- md[(md$country=="Australia" | md$country=="Austria" | md$country=="Belgium"
          | md$country=="Bulgaria" | md$country=="Czech Rep." | md$country=="Estonia"
          | md$country=="France" | md$country=="Georgia" | md$country=="Germany"
          | md$country=="Hungary" | md$country=="Italy" | md$country=="Lithuania"
          | md$country=="Netherlands" | md$country=="Norway" | md$country=="Poland"
          | md$country=="Romania" | md$country=="Russia"),]
md$Country <- NULL
md <- md[complete.cases(md$country),]

# rename variables
md$pat <- md$Effective.paternity.leave.year.of.survey..working.days.pay.
md$Effective.paternity.leave.year.of.survey..working.days.pay. <- NULL
md$mmw <- md$Categories.monthly.minimum.wage.in.PPPs..0...doesn.t.exist..1..low..0.200...2...medium..201.1000...3...high.1001...
md$Categories.monthly.minimum.wage.in.PPPs..0...doesn.t.exist..1..low..0.200...2...medium..201.1000...3...high.1001... <- NULL
md$oldpar <- md$Effective.parental.leave.5.years.before.survey..weeks.percent.salary.
md$Effective.parental.leave.5.years.before.survey..weeks.percent.salary. <- NULL
md$oldpat <- md$Effective.paternity.leave.5.years.before.survey..working.days.percent.salary.
md$Effective.paternity.leave.5.years.before.survey..working.days.percent.salary. <- NULL
md$gem <- md$Gender.Empowerment.Measure.for.year.of.survey
md$Gender.Empowerment.Measure.for.year.of.survey <- NULL
md$tot <- md$Rank.total.context..higher...more.conducive.to.fathers.caring.
md$Rank.total.context..higher...more.conducive.to.fathers.caring. <- NULL
md$mmwact <- md$Monthly.minimum.wage.in.Purchasing.Power.parities..PPP.
md$Monthly.minimum.wage.in.Purchasing.Power.parities..PPP. <- NULL
md$gpg <- md$relative.gender.pay.gap..percentage.weekly.fulltime.income
md$relative.gender.pay.gap..percentage.weekly.fulltime.income <- NULL

md <- md[,c("country", "pat", "mmw", "oldpar", "oldpat", "gem", "tot", "mmwact", "gpg")]


# mean center national vars. 
md$pat.c <- md$pat - mean(md$pat, na.rm=TRUE)
md$oldpar.c <- md$oldpar - mean(md$oldpar, na.rm=TRUE)
md$oldpat.c <- md$oldpat - mean(md$oldpat, na.rm=TRUE)
md$gem.c <- md$gem - mean(md$gem, na.rm=TRUE)
md$tot.c <- md$tot - mean(md$tot, na.rm=TRUE)
md$gpg.c <- md$gpg - mean(md$gpg, na.rm=TRUE)

# make categories for mmw
md$mmw.none <- ifelse(md$mmw==0, 1, 0)
md$mmw.low <- ifelse(md$mmw==1, 1, 0)
md$mmw.med <- ifelse(md$mmw==2, 1, 0)
md$mmw.high <- ifelse(md$mmw==3, 1, 0)



# change name of Czech Rep
md$country <- mapvalues(md$country, from = c("Australia", "Austria", "Belgium", "Bulgaria", "Czech Rep.", 
                                             "Estonia", "France", "Germany", "Hungary", "Italy", "Lithuania",
                                             "Netherlands", "Norway", "Poland", "Romania", "Russia"),
                        to = c("Australia", "Austria", "Belgium", "Bulgaria", "CzechRepublic",
                               "Estonia", "France", "Germany", "Hungary", "Italy", "Lithuania",
                               "Netherlands", "Norway", "Poland", "Romania", "Russia"))


save(md, file="between steps data saves/md.RData")
# load("between steps data saves/md.RData")

# merge with ggs
ggs2 <- merge(md, ggs, by="country", all=TRUE)

# clean up
ggs <- ggs2
rm(md, ggs2)


# save data before subsetting
save(ggs, file="between steps data saves/ggs_presubset_081214.RData")
# load("between steps data saves/ggs_presubset_081214.RData")
