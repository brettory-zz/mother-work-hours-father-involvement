# make a bargraph for ME/FI correlations

# if running directly from file and not sourcing:
# setwd("~/Dropbox/Fatherinvolv_jmf_s1/revise fatherinvol - Sociological Science/data")
# pacman::p_load(stats, plyr, dplyr, ggplot2) 
# load("data/ggs.mf_011216.RData")


# make aggregate data frame with correlations
corfistr <- as.data.frame(ggs.resp %>% group_by(country) %>% summarize(correlation=cor(hrwkMom, fistr, use = "complete.obs", method = "pearson")))
                
corfifle <- as.data.frame(ggs.resp %>% group_by(country) %>% summarize(correlation=cor(hrwkMom, fifle, use = "complete.obs", method = "pearson")))

correlations <- as.data.frame(rbind(corfistr,corfifle))
type <-c(rep("Structuring", 17), rep("Flexible", 17))


# make bar graph 
p <-ggplot(correlations, aes(country, correlation))
p +geom_bar(stat = "identity", aes(fill = type), position = "dodge") +
  xlab("\nCountries") + ylab("Correlations") +
  theme_bw() +
  scale_fill_manual("Type of father involvement\n", values = c("Flexible" = "dark gray", "Structuring" = "black"))
ggsave("analyses/figures/Figure 1/fig1_180118.png", width = 16, height = 9, dpi = 300)

# clean up work space
rm(corfifle,corfistr,correlations,p,type)
