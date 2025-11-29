# Create database

# packages ---------------------------------------------------------------------
library(globaltrends)
library(janitor)
library(readxl)
library(tidyverse)

# parameters -------------------------------------------------------------------
start_date <- "2010-01"
end_date <- "2024-12"

# import data ------------------------------------------------------------------
data_control <- read_xlsx("input/control_terms.xlsx") %>%
  clean_names()
data_object <- read_xlsx("input/lst_firms.xlsx", sheet = 1) %>%
  clean_names()
data_synonym <- read_xlsx("input/lst_firms.xlsx", sheet = 2) %>%
  clean_names()
countries <- read_xlsx("input/lst_countries.xlsx", sheet = 1)

# setup ------------------------------------------------------------------------
initialize_db()
start_db()

add_control_keyword(
  keyword = data_control$term,
  start_date = start_date,
  end_date = end_date
)

batch_object <- add_object_keyword(
  keyword = c(data_object$term, data_synonym$synonym),
  start_date = start_date,
  end_date = end_date
)

walk2(data_synonym$term, data_synonym$synonym, add_synonym)

add_locations(countries$iso2c, "geo_full")

disconnect_db()

# save data --------------------------------------------------------------------
saveRDS(batch_object, "data/batch_object.rds")
