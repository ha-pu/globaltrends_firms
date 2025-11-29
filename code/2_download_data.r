# packages ---------------------------------------------------------------------
library(globaltrends)
library(tidyverse)

# setup python -----------------------------------------------------------------
readRenviron("code/.env")

initialize_python(
  api_key = Sys.getenv("GOOGLE_API_KEY"), # Google Trends API key
  python_env = Sys.getenv("PYTHON_ENV") # Location of Python environment
)
gt.env$query_wait <- 0.1 # Set wait time between queries to 0.1 seconds

# load data --------------------------------------------------------------------
# batch_object <- read_rds("data/batch_object.rds")
batch_object <- 847:859

start_db()

# download control -------------------------------------------------------------
# download_control(control = 1, locations = gt.env$geo_full)
# download_control_global(control = 1)

# download object --------------------------------------------------------------
download_object(object = batch_object, control = 1, locations = gt.env$geo_full)
# download_object_global(object = batch_object, control = 1)

# disconnect -------------------------------------------------------------------
disconnect_db()
