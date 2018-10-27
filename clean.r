## load in data
info <- read.csv("/Users/allisonbolen/school/fall2018/cis331/data/breast-cancer.csv",na.strings = "")
info
# 1. Complete am exploration of the data by learning about the structure of the data set
    summary(info)
    # Rename data columns 
    colnames(info)[colnames(info)=="no.recurrence.events"] <- "recurrenceEvents"
    colnames(info)[colnames(info)=="X30.39"] <- "ageGroup"
    colnames(info)[colnames(info)=="premeno"] <- "menopauseStage"
    colnames(info)[colnames(info)=="X30.34"] <- "tumorSize"
    colnames(info)[colnames(info)=="X0.2"] <- "invNodes"
    colnames(info)[colnames(info)=="no"] <- "nodeCaps"
    colnames(info)[colnames(info)=="X3"] <- "degMalig"
    colnames(info)[colnames(info)=="left"] <- "breast"
    colnames(info)[colnames(info)=="left_low"] <- "breastQuad"
    colnames(info)[colnames(info)=="no.1"] <- "irradiat"
    
# 2. Find if there is any missing data or not. If yes, how you will replace the missing value
  # as described by the readme of the data set there are only 9 columns that contain missign data marked by '?'
  # Since its such a small subset of the data set I think just plain old removeing them wont affect the overall 
  # quality of the data set
    info = info[!info$`node-caps` == "?", ]
    info = info[!info$breast == "?", ]

  # remmoved all the '?' from the relevent attributes 
    info
    summary(info)
    
# 3. Handling outliers
  # examine the outliers in each attribute
    
# 4. Data transformation using normalization: 

# 5. Data discretization: if you want to convert a continuous variable to categorical variable, you may
# use one of the following three methods

# 6. Feature reduction

# 