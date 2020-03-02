.libPaths("/storage/home/htn5098/local_lib/R35") # needed for calling packages
.libPaths()

library(Evapotranspiration)
library(foreach)
library(doParallel)
library(parallel)

# Registering cores for parallel processing
no_cores <- detectCores() #24 cores per node - enough for parallel processing
print(no_cores)
cl <- makeCluster(no_cores)
registerDoParallel(cl)

# Reading supporting files
print("Reading supporting files")
sdgridelv <- read.csv('./data/SDGridElevavtion.csv', header = T)) #grid points and elevation
time = seq.Date(from = as.Date("1979-01-01",'%Y-%m-%d'),
                to = as.Date("2016-12-31","%Y-%m-%d"),'day')
J = as.numeric(format(time,'%j')) # turning date into julian days for calculation

# Reading climate data
print("Reading climate data")
i = 12
grid = as.character(i)
tx = read.csv(paste0('./data/interim/UW_historical_tasmax_',i,'.csv'))
tn = read.csv(paste0('./data/interim/UW_historical_tasmin_',i,'.csv'))
rhx = read.csv(paste0('./data/interim/UW_historical_rh_max_',i,'.csv'))
rhn = read.csv(paste0('./data/interim/UW_historical_rh_min_',i,'.csv'))
Rs = read.csv(paste0('./data/interim/UW_historical_shortwave_',i,'.csv'))
head(Rs)
u10 = read.csv(paste0('./data/interim/UW_historical_wind_speed_',i,'.csv'))

# Transforming climate data into input file for Evapotranspiration package to read
print("Transforming data")
data <- data.frame(
  Station = grid,
  Year = year(time),
  Month = month(time),
  Day = day(time),
  Tmax = unlist(tx),
  Tmin = unlist(tn),
  RHmax = unlist(rhx),
  RHmin = unlist(rhn),
  Rs = unlist(Rs),
  uz = unlist(u10)
)
head(data)
stopCluster(cl)
