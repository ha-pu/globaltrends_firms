# packages ---------------------------------------------------------------------
library(nanoparquet)
library(readxl)
library(tidyverse)
library(writexl)

# load data --------------------------------------------------------------------
data_firms <- read_xlsx("input/lst_firms.xlsx")
data_score <- read_rds("data/data_score.rds")
data_voi <- read_rds("data/data_voi.rds")
data_doi <- read_rds("data/data_doi.rds")

# merge data -------------------------------------------------------------------
data_score <- data_score %>%
    inner_join(data_firms, by = c("keyword" = "Term")) %>%
    select(
        firm_name = "Company name Latin alphabet",
        firm_isin = "ISIN number",
        location,
        date,
        score
    ) %>%
    arrange(
        firm_name,
        location,
        date
    )

data_voi <- data_voi %>%
    inner_join(data_firms, by = c("keyword" = "Term")) %>%
    select(
        firm_name = "Company name Latin alphabet",
        firm_isin = "ISIN number",
        date,
        voi = score
    ) %>%
    arrange(
        firm_name,
        date
    )

data_doi <- data_doi %>%
    inner_join(data_firms, by = c("keyword" = "Term")) %>%
    select(
        firm_name = "Company name Latin alphabet",
        firm_isin = "ISIN number",
        date,
        gini,
        hhi,
        entropy
    ) %>%
    arrange(
        firm_name,
        date
    )

# save data --------------------------------------------------------------------
write_parquet(data_score, "firms_score.parquet")
write_parquet(data_voi, "firms_voi.parquet")
write_xlsx(data_voi, "firms_voi.xlsx")
write_parquet(data_doi, "firms_doi.parquet")
write_xlsx(data_doi, "firms_doi.xlsx")
