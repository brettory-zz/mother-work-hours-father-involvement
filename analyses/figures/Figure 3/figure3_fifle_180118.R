# make a bargraph for ME/FI correlations

# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(foreign,car,VGAM,nnet,DAMisc) 
# load("data/ggs.mf_011216.RData")



load("analyses/results/analysisresults.fifle_pat_160118.RData")
flepat <- analysisresults.fifle_pat
rm(analysisresults.fifle_pat)

load("analyses/results/analysisresults.fifle_gem_160118.RData")
flemat <- analysisresults.fifle_gem
rm(analysisresults.fifle_gem)

load("analyses/results/analysisresults.fifle_gpg_160118.RData")
fledif <- analysisresults.fifle_gpg
rm(analysisresults.fifle_gpg)

# Plot for dots with CI

# extract the coefficients and CI of indep varas

coef <- cbind(flepat[17,1], flemat[17,1], fledif[17,1],
              flepat[16,1], flemat[16,1], fledif[16,1], flepat[15,1], flemat[15,1], fledif[15,1],
              flepat[14,1], flemat[14,1], fledif[14,1], flepat[13,1], flemat[13,1], fledif[13,1],
              flepat[12,1], flemat[12,1], fledif[12,1], flepat[11,1], flemat[11,1], fledif[11,1],
              flepat[10,1], flemat[10,1], fledif[10,1], flepat[9,1], flemat[9,1], fledif[9,1],
              flepat[8,1], flemat[8,1], fledif[8,1], flepat[7,1], flemat[7,1], fledif[7,1],
              flepat[6,1], flemat[6,1], fledif[6,1], flepat[5,1], flemat[5,1], fledif[5,1],
              flepat[4,1], flemat[4,1], fledif[4,1], flepat[3,1], flemat[3,1], fledif[3,1],
              flepat[2,1], flemat[2,1], fledif[2,1], flepat[1,1], flemat[1,1], fledif[1,1])
coef <- as.vector(coef)
coeflb <- cbind(flepat[17,2], flemat[17,2], fledif[17,2],
                flepat[16,2], flemat[16,2], fledif[16,2], flepat[15,2], flemat[15,2], fledif[15,2],
                flepat[14,2], flemat[14,2], fledif[14,2], flepat[13,2], flemat[13,2], fledif[13,2],
                flepat[12,2], flemat[12,2], fledif[12,2], flepat[11,2], flemat[11,2], fledif[11,2],
                flepat[10,2], flemat[10,2], fledif[10,2], flepat[9,2], flemat[9,2], fledif[9,2],
                flepat[8,2], flemat[8,2], fledif[8,2], flepat[7,2], flemat[7,2], fledif[7,2],
                flepat[6,2], flemat[6,2], fledif[6,2], flepat[5,2], flemat[5,2], fledif[5,2],
                flepat[4,2], flemat[4,2], fledif[4,2], flepat[3,2], flemat[3,2], fledif[3,2],
                flepat[2,2], flemat[2,2], fledif[2,2], flepat[1,2], flemat[1,2], fledif[1,2])
coeflb <- as.vector(coeflb)
coefub <- cbind(flepat[17,3], flemat[17,3], fledif[17,3],
                flepat[16,3], flemat[16,3], fledif[16,3], flepat[15,3], flemat[15,3], fledif[15,3],
                flepat[14,3], flemat[14,3], fledif[14,3], flepat[13,3], flemat[13,3], fledif[13,3],
                flepat[12,3], flemat[12,3], fledif[12,3], flepat[11,3], flemat[11,3], fledif[11,3],
                flepat[10,3], flemat[10,3], fledif[10,3], flepat[9,3], flemat[9,3], fledif[9,3],
                flepat[8,3], flemat[8,3], fledif[8,3], flepat[7,3], flemat[7,3], fledif[7,3],
                flepat[6,3], flemat[6,3], fledif[6,3], flepat[5,3], flemat[5,3], fledif[5,3],
                flepat[4,3], flemat[4,3], fledif[4,3], flepat[3,3], flemat[3,3], fledif[3,3],
                flepat[2,3], flemat[2,3], fledif[2,3], flepat[1,3], flemat[1,3], fledif[1,3])
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

png("analyses/figures/Figure 3/figure3_fifle_180118.png", width=1400, height= 800, pointsize=30)
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