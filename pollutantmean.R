# Michael Powe
# R Programming
# 25 September 2015

# ------------------------------------------------------------
# Some globals for ease of handling
# ------------------------------------------------------------

# (global) directory containing data files
g_specdata <- "~/src/jhu_data_science/specdata"

# (global) files collection
g_specdata_dir <-
        dir(g_specdata,pattern = "\\d{3}\\.csv",full.names = TRUE)

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
        do.call("rbind", temp_specdata_list)
}

# ------------------------------------------------------------
# end of globals
# ------------------------------------------------------------

# A function to calculate the mean for a subset of data observations from a collection
# of observation stations.
#
# Name: pollutantmean
#
# Parameters:
#   directory - a string specifying the path to the data files
#   pollutant - a string specifying which pollutant is being measured. Options are
#               'nitrate' or 'sulfate'
#   stations -  ID numbers of the stations to be processed.  This is a vector of numbers
#               between 1 and 332.
# Returns: A double, the mean of the selected data values
#
# Usage:
#   pmean<-pollutantmean("~/src/jhu_data_science/specdata","nitrate",c(6,26))
#   *** calculate the mean for the observations of 'nitrate' for stations 6 and 26
#
#   pmean<-pollutantmean("~/src/jhu_data_science/specdata","sulfate",13:21)
#   *** calculate the mean for the observations of 'sulfate' for stations 13 through 21

pollutantmean <- function(directory, pollutant, stations) {
        # simple sanity checks for input
        if (file.exists(directory) == FALSE) {
                stop("Directory given does not exist or is not accessible")
        }
        else if (pollutant != 'nitrate' && pollutant != 'sulfate') {
                stop("Please select either 'nitrate' or 'sulfate' for pollutant.")
        }
        else if (is.vector(stations) == FALSE) {
                stop("Station ID numbers must be given as a vector")
        }
        # build the vector of data files
        specdata_dir <-
                dir(directory,pattern = "\\d{3}\\.csv",full.names = TRUE)
        
        # create a data frame from the data in the files
        # using the helper function
        specdata_frame <- getspecdata(specdata_dir)
        
        # logical vector identifying incomplete data
        isgood <- complete.cases(specdata_frame)
        
        # data frame with NA values stripped out
        specdata_clean <- specdata_frame[isgood,]
        
        # data frame with specified station IDs
        specdata_select <-
                specdata_clean[specdata_clean[['ID']] == stations,]
        
        # calcultate the mean of the selected observations
        mean(specdata_select[,pollutant])
} # end function
