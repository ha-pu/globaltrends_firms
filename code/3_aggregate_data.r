# packages ---------------------------------------------------------------------
library(globaltrends)
library(tidyverse)

# load data --------------------------------------------------------------------
batch_object <- read_rds("data/batch_object.rds")

start_db()

# compute score ----------------------------------------------------------------
compute_score(object = batch_object, control = 1, locations = gt.env$geo_full)
compute_voi(object = batch_object, control = 1)

# compute doi ------------------------------------------------------------------
compute_doi(object = batch_object, control = 1, locations = "geo_full")

# export data ------------------------------------------------------------------
saveRDS(export_score(control = 1), "data/data_score.rds")
saveRDS(export_voi(control = 1), "data/data_voi.rds")
saveRDS(export_doi(control = 1), "data/data_doi.rds")

# disconnect -------------------------------------------------------------------
disconnect_db()
