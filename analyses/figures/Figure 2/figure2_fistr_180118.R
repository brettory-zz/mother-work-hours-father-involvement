# make a bargraph for ME/FI correlations

# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(foreign,car,VGAM,nnet,DAMisc) 
# load("data/ggs.mf_011216.RData")



load("analyses/results/analysisresults.fistr_pat_160118.RData")
strpat <- analysisresults.fistr_pat
rm(analysisresults.fistr_pat)

load("analyses/results/analysisresults.fistr_gem_160118.RData") # gem
strmat <- analysisresults.fistr_gem
rm(analysisresults.fistr_gem)

load("analyses/results/analysisresults.fistr_gpg_160118.RData") # gpg
strdif <- analysisresults.fistr_gpg
rm(analysisresults.fistr_gpg)

# Plot for dots with CI

# extract the coefficients and CI of indep varas

coef <- cbind(strpat[17,1], strmat[17,1], strdif[17,1],
              strpat[16,1], strmat[16,1], strdif[16,1], strpat[15,1], strmat[15,1], strdif[15,1], 
              strpat[14,1], strmat[14,1], strdif[14,1], strpat[13,1], strmat[13,1], strdif[13,1],
              strpat[12,1], strmat[12,1], strdif[12,1], strpat[11,1], strmat[11,1], strdif[11,1],
              strpat[10,1], strmat[10,1], strdif[10,1], strpat[9,1], strmat[9,1], strdif[9,1],
              strpat[8,1], strmat[8,1], strdif[8,1], strpat[7,1], strmat[7,1], strdif[7,1],
              strpat[6,1], strmat[6,1], strdif[6,1], strpat[5,1], strmat[5,1], strdif[5,1],
              strpat[4,1], strmat[4,1], strdif[4,1], strpat[3,1], strmat[3,1], strdif[3,1],
              strpat[2,1], strmat[2,1], strdif[2,1], strpat[1,1], strmat[1,1], strdif[1,1])
coef <- as.vector(coef)
coeflb <- cbind(strpat[17,2], strmat[17,2], strdif[17,2],
                strpat[16,2], strmat[16,2], strdif[16,2], strpat[15,2], strmat[15,2], strdif[15,2],
                strpat[14,2], strmat[14,2], strdif[14,2], strpat[13,2], strmat[13,2], strdif[13,2],
                strpat[12,2], strmat[12,2], strdif[12,2], strpat[11,2], strmat[11,2], strdif[11,2],
                strpat[10,2], strmat[10,2], strdif[10,2], strpat[9,2], strmat[9,2], strdif[9,2],
                strpat[8,2], strmat[8,2], strdif[8,2], strpat[7,2], strmat[7,2], strdif[7,2],
                strpat[6,2], strmat[6,2], strdif[6,2], strpat[5,2], strmat[5,2], strdif[5,2],
                strpat[4,2], strmat[4,2], strdif[4,2], strpat[3,2], strmat[3,2], strdif[3,2],
                strpat[2,2], strmat[2,2], strdif[2,2], strpat[1,2], strmat[1,2], strdif[1,2])
coeflb <- as.vector(coeflb)
coefub <- cbind(strpat[17,3], strmat[17,3], strdif[17,3],
                strpat[16,3], strmat[16,3], strdif[16,3], strpat[15,3], strmat[15,3], strdif[15,3],
                strpat[14,3], strmat[14,3], strdif[14,3], strpat[13,3], strmat[13,3], strdif[13,3],
                strpat[12,3], strmat[12,3], strdif[12,3], strpat[11,3], strmat[11,3], strdif[11,3],
                strpat[10,3], strmat[10,3], strdif[10,3], strpat[9,3], strmat[9,3], strdif[9,3],
                strpat[8,3], strmat[8,3], strdif[8,3], strpat[7,3], strmat[7,3], strdif[7,3],
                strpat[6,3], strmat[6,3], strdif[6,3], strpat[5,3], strmat[5,3], strdif[5,3],
                strpat[4,3], strmat[4,3], strdif[4,3], strpat[3,3], strmat[3,3], strdif[3,3],
                strpat[2,3], strmat[2,3], strdif[2,3], strpat[1,3], strmat[1,3], strdif[1,3])
coefub <- as.vector(coefub)


# save coef of independent variables in matrix + give column and row names

mat.rownames1 <- c("Russia", "Romania", "Poland", "Norway", "Netherlands", 
                   "Lithuania", "Italy", "Hungary", "Germany", "Georgia", 
                   "France", "Estonia", "Czech Republic", "Bulgaria", "Beglium", 
                   "Austria", "Australia")
mat.rownames2 <- mat.rownames1
mat.rownamest <- rep(mat.rownames1, each=3)
val1 <- rep(1,17)
valt <- rep(1:3,51)
context <- c("Paternity leave", "GEM", "Gender pay gap",
             "Paternity leave", "GEM", "Gender pay gap",
             "Paternity leave", "GEM", "Gender pay gap",
             "Paternity leave", "GEM", "Gender pay gap",
             "Paternity leave", "GEM", "Gender pay gap",
             "Paternity leave", "GEM", "Gender pay gap",
             "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap",
           "Paternity leave", "GEM", "Gender pay gap")
context <- as.factor(context)


order <- seq(1,51,1)

plot.data <- data.frame(group = mat.rownamest, lower = coeflb, est = coef,
          upper = coefub, valt, context, order)

df<- plot.data[1:51,]
df2=df[order(df$est),]
df2$group=factor(df2$group,levels=df2$group)

# make graph

png("analyses/figures/Figure 2/figure2_fistr_180118.png", width=1400, height= 800, pointsize=30)
se <- ggplot(df2, aes(x=factor(group), y=est, 
                            ymin=lower, ymax=upper, linetype=context))
se + geom_pointrange(aes(group=df2$context), position= position_dodge(width=0.5),
                     size=1) + 
  coord_flip() + theme(legend.position = "none") +
  theme_bw() + labs(x = "", y = "", colour="Intention") +
  theme(axis.text.x=element_text(size=18), axis.text.y=element_text(size=24), 
       axis.title.x=element_text(size=18, hjust=0.7), axis.title.y=element_text(size=18),
       legend.text = element_text(size=24), 
       legend.title = element_text(size=26, face="bold"),
       legend.position="bottom", legend.direction="horizontal")
dev.off()



####################################################################

rm(list=setdiff(ls(), "ggs.resp"))

