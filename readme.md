# globaltrends Firms


A Google Trends-Based Measure of Firm Internationalization

The current version of the **globaltrends Firms** dataset can be
accessed:

- Country-level search score data by firm
  ([parquet](https://github.com/ha-pu/globaltrends_firms/blob/main/firms_score.parquet))
- Volume of internationalization data by firm
  ([xlsx](https://github.com/ha-pu/globaltrends_firms/blob/main/firms_voi.xlsx),
  [parquet](https://github.com/ha-pu/globaltrends_firms/blob/main/firms_voi.parquet))
- Degree of internationalization data by firm
  ([xlsx](https://github.com/ha-pu/globaltrends_firms/blob/main/firms_doi.xlsx),
  [parquet](https://github.com/ha-pu/globaltrends_firms/blob/main/firms_doi.parquet))

Cite any usage of the **globaltrends Firms** data as: Puhr, H., &
Müllner, J. (2021). Let me Google that for you: Capturing globalization
using Google Trends (SSRN Working Paper 3969013). Available at
<https://www.ssrn.com/abstract=3969013>.

The **globaltrends Firms** data is part of the [globaltrends
project](https://github.com/ha-pu/globaltrends).

- Last update of the data: 2025-11-29
- Coverage of the data: 2010-2024

**WARNING: Data is still in experimental state!**

## Volume of Internationalization

### Average Annual Volume of Internationalization

``` r
df_voi |>
    filter(voi > 0) |>
    mutate(year = year(date)) |>
    summarise(
        voi = mean(voi),
        .by = year
    ) |>
    ggplot(aes(x = year, y = voi)) +
    geom_line() +
    geom_smooth() +
    labs(
        x = NULL,
        y = "Volume of Internationalization"
    ) +
    theme_bw()
```

![](README_files/figure-commonmark/voi_annual_average-1.png)

### Top 5 Firms by Average Volume of Internationalization (2010-2024)

``` r
df_voi |>
    summarise(
        voi = mean(voi),
        .by = firm_name
    ) |>
    slice_max(order_by = voi, n = 5) |>
    mutate(firm_name = reorder(firm_name, desc(voi))) |>
    ggplot(aes(x = firm_name, y = voi)) +
    geom_col() +
    labs(
        x = NULL,
        y = "Volume of Internationalization"
    ) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
```

![](README_files/figure-commonmark/voi_firm_average-1.png)

### Top 5 Firms by Average Volume of Internationalization (2010)

``` r
df_voi |>
    filter(year(date) == 2010) |>
    summarise(
        voi = mean(voi),
        .by = firm_name
    ) |>
    slice_max(order_by = voi, n = 5) |>
    mutate(firm_name = reorder(firm_name, desc(voi))) |>
    ggplot(aes(x = firm_name, y = voi)) +
    geom_col() +
    labs(
        x = NULL,
        y = "Volume of Internationalization"
    ) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
```

![](README_files/figure-commonmark/voi_firm_average10-1.png)

### Top 5 Firms by Average Volume of Internationalization (2024)

``` r
df_voi |>
    filter(year(date) == 2024) |>
    summarise(
        voi = mean(voi),
        .by = firm_name
    ) |>
    slice_max(order_by = voi, n = 5) |>
    mutate(firm_name = reorder(firm_name, desc(voi))) |>
    ggplot(aes(x = firm_name, y = voi)) +
    geom_col() +
    labs(
        x = NULL,
        y = "Volume of Internationalization"
    ) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
```

![](README_files/figure-commonmark/voi_firm_average24-1.png)

## Degree of Internationalization

### Average Annual Degree of Internationalization

``` r
df_doi |>
    filter(gini > 0) |>
    mutate(year = year(date)) |>
    summarise(
        gini = mean(gini),
        .by = year
    ) |>
    ggplot(aes(x = year, y = gini)) +
    geom_line() +
    geom_smooth() +
    labs(
        x = NULL,
        y = "Degree of Internationalization",
        caption = "DOI Measured as Inverted Gini Coefficient"
    ) +
    theme_bw()
```

![](README_files/figure-commonmark/doi_annual_average-1.png)

### Top 5 Firms by Degree of Internationalization (2010-2024)

``` r
df_doi |>
    summarise(
        gini = mean(gini),
        .by = firm_name
    ) |>
    slice_max(order_by = gini, n = 5) |>
    mutate(firm_name = reorder(firm_name, desc(gini))) |>
    ggplot(aes(x = firm_name, y = gini)) +
    geom_col() +
    labs(
        x = NULL,
        y = "Degree of Internationalization",
        caption = "DOI Measured as Inverted Gini Coefficient"
    ) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
```

![](README_files/figure-commonmark/doi_firm_average-1.png)

### Top 5 Firms by Average Degree of Internationalization (2010)

``` r
df_doi |>
    filter(year(date) == 2010) |>
    summarise(
        gini = mean(gini),
        .by = firm_name
    ) |>
    slice_max(order_by = gini, n = 5) |>
    mutate(firm_name = reorder(firm_name, desc(gini))) |>
    ggplot(aes(x = firm_name, y = gini)) +
    geom_col() +
    labs(
        x = NULL,
        y = "Degree of Internationalization",
        caption = "DOI Measured as Inverted Gini Coefficient"
    ) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
```

![](README_files/figure-commonmark/doi_firm_average10-1.png)

### Top 5 Firms by Average Degree of Internationalization (2024)

``` r
df_doi |>
    filter(year(date) == 2024) |>
    summarise(
        gini = mean(gini),
        .by = firm_name
    ) |>
    slice_max(order_by = gini, n = 5) |>
    mutate(firm_name = reorder(firm_name, desc(gini))) |>
    ggplot(aes(x = firm_name, y = gini)) +
    geom_col() +
    labs(
        x = NULL,
        y = "Degree of Internationalization",
        caption = "DOI Measured as Inverted Gini Coefficient"
    ) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
```

![](README_files/figure-commonmark/doi_firm_average24-1.png)
