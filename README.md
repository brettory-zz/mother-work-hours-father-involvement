---
title: Mothers' work hours and fathers' share of involvement in cross-national
  perspective
subtitle: Source file
author: "Brett Ory, Renske Keizer, Pearl A. Dykstra"
date: '2018-01-24'
output:
  html_document: null
  pdf_document: default
---

```{r setup, include=F}
knitr::opts_chunk$set(eval=F) # don't run any of the chunks, these are all for demonstration purposes only
```

<br>

## Purpose

Use this file to:
   
1.  prepare data           
2.  run anayses            
3.  make table and figures     

Each code below sources a different R document. Data was downloaded in fall 2015 from the [Generations and Gender Program](http://www.ggp-i.org/), GGS Wave1_V.4.2  

<br> 

Set up global environment
```{r global env, message=F}

# load packages
## install.packages("pacman") # pacman loads multiple packages & installs if necessary
pacman::p_load(psych, reshape, data.table, foreign, Hmisc, stats, plyr, nFactors, FactoMineR, gdata, XLConnect, diffr, # for data handling
               mcmcplots, mvtnorm, R2jags, rjags, coda, mice, # for Bayesian analysis
               xtable, xlsx, ggplot2, dplyr, foreign, car, VGAM, nnet, DAMisc # for figures 
) 
```

<br>

## Prepare data

Source file that loads GGS data & uses NKPS data for Dutch GGS
```{r load data}
source("~/code/GGS_loaddata_150118_step1.R")
```

Make individual-level variables
```{r make individual variables}
source("~/code/GGS_makevars_160118_step2.R")
```

Make macro variables
```{r make macro vars}
source("~/code/GGS_macrodata_160118_step3.R")
```

Subset data
```{r subset data}
source("~/code/GGS_subsetdata_160118_step4.R")
```

<br>

## Analyses

Empty time structuring model:
```{r empty fistr model}
rm(list=setdiff(ls(), "ggs.resp")) # clean up environment

source("~/analyses/call/call_fistr_emptymodel_160118.R")
```

Empty time flexible model:
```{r empty fifle model}
rm(list=setdiff(ls(), "ggs.resp")) # clean up environment

source("~/analyses/call/call_fifle_emptymodel_160118.R")
```

Random slope of hrwkMom, time structuring
```{r fistr random slope}
rm(list=setdiff(ls(), "ggs.resp")) # clean up environment

source("~/analyses/call/call_fistr_nomac_160118.R")
```

Random slope of hrwkMom, time flexible
```{r fifle random slope}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/data/analyses/call/call_fifle_nomac_160118.R")
```

Cross-level interaction paternity leave, time structuring
```{r fistr pat}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/analyses/call/call_fistr_pat_160118.R")
```

Cross-level interaction gender pay gap, time structuring
```{r fistr gpg}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/analyses/call/call_fistr_gpg_160118.R")
```

Cross-level interaction GEM score, time structuring
```{r fistr gem}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/analyses/call/call_fistr_gem_160118.R")
```

Cross-level interaction paternity leave, time flexible
```{r fifle pat}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/analyses/call/call_fifle_pat_160118.R")
```

Cross-level interaction gender pay gap, time flexible
```{r fifle gpg}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/analyses/call/call_fifle_gpg_160118.R")
```

Cross-level interaction GEM score, time flexible
```{r fifle gem}
rm(list=setdiff(ls(), "ggs.resp"))

source("~/analyses/call/call_fifle_gem_160118.R")
```

<br>

## Make tables and figures

Table 1
```{r table 1}
source("~/analyses/figures/Table 1/table1_descriptives_180118.R")
```

Figure 1
```{r figure 1}
source("~/analyses/figures/Figure 1/figure1_bargraph_180118.R")
```

Figure 2
```{r figure 2}
source("~/analyses/figures/Figure 2/figure2_fistr_180118.R")
```

Figure 3
```{r figure 3}
source("~/analyses/figures/Figure 3/figure3_fifle_180118.R")
```

