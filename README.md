
# Copyright's Impact on Data Mining in Academic Research

Replication material for the paper:

Christian Handke, Lucie Guibault, and Joan-Josep Vallbé (2020): "Copyright's Impact on Data Mining in Academic Resarch"  (currently under review).

This file contains three different types of material that will enable replication for the paper.

Inside the /compendium folder is a .pdf file named "31DataMining_Notes_Compendium". This document contains additional material to the paper. The material covers two main issues that could not be included in the submitted draft due to length restrictions, but that deserve further explanation.


Inside the /data folder you will find the dataset used to carry out the empirical analyses presented in the paper. It is a .csv (comma-separated values) file. The dataset contains the following variables:


| Variable name     |  Value                  |
|-------------------|-------------------------|
| alpha             | ISO Country code        |
| year             | Year                     |   
| country.x         | Country name            |
| dm.output         | Absolute number of data mining papers |
| total.output      | Absolute number of research output  |
| dm.share          | Share of papers on data mining	(dm.output/total.output)*1000 |
| cagegory2         | Level of copyright restriction |
| NY.GDP.PCAP.KD    | GDP/capita ($)          |
| RL.EST            | Level of Rule of Law    |
| SP.POP.TOTL       | Country population size |



Inside the /R-code folder is the R code to replicate the data analysis carried out in the paper. The analysis was originally carried out using R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

# Contact the authors

You may contact the authors at:

- Christian Handke (handke@eshcc.eur.nl), Erasmus University Rotterdam
- Lucie Guibault (lucie.guibault@dal.ca), Dalhousie University
- Joan-Josep Vallbé (vallbe@ub.edu), Universitat de Barcelona
