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
    #reorganize the invNodes attributes
    info$invNodesModified[info$invNodes == "0-2"] <- "x<=2"
    info$invNodesModified[info$invNodes == "12-14"] <- "x>2"
    info$invNodesModified[info$invNodes == "15-17"] <- "x>2"
    info$invNodesModified[info$invNodes == "24-26"] <- "x>2"
    info$invNodesModified[info$invNodes == "3-5"] <- "x>2"
    info$invNodesModified[info$invNodes == "6-8"] <- "x>2"
    info$invNodesModified[info$invNodes == "9-11"] <- "x>2"
    
    info$invNodesModified
    # where 1 represents less than or equal to 2 and 2 represents more than 2
    # I may not need to do outlier correction because the data set consists of mainly catagorical data
    summary(info)
    
# 3. Handling outliers
  # examine the outliers in each attribute
  #  convert catagorical to numeric values
  # there are not problem outliers
    
# 4. Data transformation using normalization:
    # I do not need to normalize on this data set because it is already past this step
# 5. Data discretization: if you want to convert a continuous variable to categorical variable, you may
    # I do not need to discretize this data set because it is already binned. 
# 6. Feature reduction
    # this set is done in weka please see the included jpg file in the github repo
write.csv(info, file="/Users/allisonbolen/school/fall2018/cis331/data/breastCancerModif.csv")