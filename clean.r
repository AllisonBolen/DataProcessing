## load in data
info <- read.csv("/Users/allisonbolen/school/fall2018/cis331/data/breast-cancer.csv",na.strings = "")

# 1. Complete am exploration of the data by learning about the structure of the data set
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
    info = info[!info$nodeCaps == "?", ]
    info = info[!info$breastQuad == "?", ]

  # remmoved all the '?' from the relevent attributes 
    summary(info)
    str(info)
    
# 3. Handling outliers
  # examine the outliers in each attribute
  #  convert catagorical to numeric values
  #  ageGroup: 
    # 10-19: 14, 20-29: 24, 30-39:34, 40-49:44 , 50-59:54, 60-69:64, 70-79:74, 80-89:84, 90-99:94. 
    info$invNodesModified[info$invNodes == "0-2"] <- as.factor("x<=2")
    info$invNodesModified[info$invNodes == "12-14"] <- as.factor("x>2")
    info$invNodesModified[info$invNodes == "15-17"] <- as.factor("x>2")
    info$invNodesModified[info$invNodes == "24-26"] <- as.factor("x>2")
    info$invNodesModified[info$invNodes == "3-5"] <- as.factor("x>2")
    info$invNodesModified[info$invNodes == "6-8"] <- as.factor("x>2")
    info$invNodesModified[info$invNodes == "9-11"] <- as.factor("x>2")

    info$invNodesModified
    # where 1 represents less than or equal to 2 and 2 represents more than 2
    # I may not need to do outlier correction because the data set consists of mainly catagorical data
    
    # 4. Data transformation using normalization: 
    summary(info)
# 5. Data discretization: if you want to convert a continuous variable to categorical variable, you may
# use one of the following three methods

# 6. Feature reduction

# 