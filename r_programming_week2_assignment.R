# functions for R Programming Assignment
# 22 Sept 2015

# (global) directory containing data files
g_specdata <- "~/src/jhu_data_science/specdata"

# (global) files collection
g_specdata_dir <- dir(g_specdata,pattern = "\\d{3}\\.csv",full.names = TRUE)

# helper function to read in data files and create a single data frame
getspecdata <- function(filelistdir) {
        # set the vectors and frames to NULL, just to be safe
        temp_specdata <- NULL
        temp_specdata_list <- NULL
        temp_specdata_frame <- NULL
        
        # read in the data
        # this creates a list of data frames, one for each file
        temp_specdata_list <- lapply(filelistdir, read.csv)
        
        # binds all the data frames in the list into a single frame
        temp_specdata_frame <- do.call("rbind", temp_specdata_list)
}

gsd<-getspecdata(g_specdata_dir)
g_compdata<-complete.cases(gsd)



# =============================================================================

# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function
# 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory'
# argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA. A prototype of the function is as
# follows

pollutantmean <- function(directory, pollutant, stations) {
        specdata_dir <- dir(directory,pattern = "\\d{3}\\.csv",full.names = TRUE)
        
        specdata_frame<-getspecdata(specdata_dir)
        compcases<-complete.cases(specdata_frame)
        specdata_frameclean<-specdata_frame[compcases,]
        
}

p<-pollutantmean(g_specdata,'nitrate',c(6,21:26))

# =============================================================================

# Write a function that reads a directory full of files and reports the number
# of completely observed cases in each data file. The function should return a
# data frame where the first column is the name of the file and the second
# column is the number of complete cases. 
# A prototype of this function follows

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}
# c[1:6,'ID' = 3:6]
# c[1:6,'ID' == 3:6]
# c[c$ID==6]
# c[c$ID==8]
# c[c$ID==1]
# c[c$ID]
# c$ID
# c[c$ID==29]
# str(c)
# c[c$ID==29,]
# c['ID' = 3:6,]
# c['ID' == 3:6,]
# c['ID' == 29,]
# c[c$ID==29,]
# c[c$ID==28:29,]
# c[c$ID==c(6,28:29),]
# c['ID'==c(6,28:29),]
# c['ID'==c(6,28:29)]
# c[,'ID'==c(6,28:29)]
# c[c$ID==c(6,28:29),]
# d<-c[c$ID==c(6,28:29),]
# str(d)
# mean(d)
# class(d)
# dim(d)
# d.length
# (lapply(d,mean))
# (lapply(d$nitrate,mean))


# =============================================================================

# Write a function that takes a directory of data files and a threshold for
# complete cases and calculates the correlation between sulfate and nitrate for
# monitor locations where the number of completely observed cases (on all
# variables) is greater than the threshold. The function should return a vector
# of correlations for the monitors that meet the threshold requirement. If no
# monitors meet the threshold requirement, then the function should return a
# numeric vector of length 0. 
# A prototype of this function follows

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}

