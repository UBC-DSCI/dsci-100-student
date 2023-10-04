# DSCI 100 function reference sheet for R

This reference sheet contains the key objects that we use in DSCI 100, and a brief syntax example for each of the main packages. During the closed book exams, you will still have access to this page, so get familiar with it already now. There is no guarantee that every function or parameter in the textbook is covered here, but if you think there is something missing, please let us know and we can consider adding it.

## Base R Operations

| Function        | Description |
| --------------- | ----------- |
| `abs`           |             |
| `as.data.frame` |             |
| `as.numeric`    |             |
| `c`             |             |
| `is.na`         |             |
| `dim`           |             |
| `max`           |             |
| `mean`          |             |
| `median`        |             |
| `min`           |             |
| `n`             |             |
| `names`         |             |
| `ncol`          |             |
| `nrow`          |             |
| `print`         |             |
| `round`         |             |
| `sd`            |             |
| `seq`           |             |
| `sum`           |             |
| `sort`          |             |
| `sqrt`          |             |

## Operators

| Function | Description |
| -------- | ----------- |
| `==`     |             |
| `%in%`   |             |
| `!`      |             |
| `&`      |             |
| `\|`     |             |
| `\|>`    |             |

## Data Reading

| Function        | Description |
| --------------- | ----------- |
| `download.file` |             |
| `read_csv`      |             |
| `read_csv2`     |             |
| `read_delim`    |             |
| `read_excel`    |             |
| `read_html`     |             |
| `read_tsv`      |             |
| `write_csv`     |             |

Database functions

| Function       | Description |
| -------------- | ----------- |
| `dbConnect`    |             |
| `dbListTables` |             |
| `Postgres`     |             |
| `SQLite`       |             |
| `tbl`          |             |

## Data Wrangling

| Function          | Description |
| ----------------- | ----------- |
| `across`          |             |
| `as_datetime`     |             |
| `as_factor`       |             |
| `as_tibble`       |             |
| `arrange`         |             |
| `collect`         |             |
| `colnames`        |             |
| `desc`            |             |
| `everything`      |             |
| `filter`          |             |
| `fct_reorder`     |             |
| `group_by`        |             |
| `head`            |             |
| `if_else`         |             |
| `map`             |             |
| `map_chr`         |             |
| `map_df`          |             |
| `mutate`          |             |
| `pivot_longer`    |             |
| `pivot_wider`     |             |
| `pull`            |             |
| `rowwise`         |             |
| `select`          |             |
| `semi_join`       |             |
| `separate`        |             |
| `slice`           |             |
| `slice_max`       |             |
| `slice_min`       |             |
| `str_extract`     |             |
| `str_replace_all` |             |
| `summarise`       |             |
| `summarize`       |             |
| `tail`            |             |
| `tibble`          |             |
| `tolower`         |             |
| `toupper`         |             |
| `ungroup`         |             |
| `unique`          |             |
| `unlist`          |             |
| `unnest`          |             |
| `vars`            |             |

## Visualization

| Function               | Description |
| ---------------------- | ----------- |
| `aes`                  |             |
| `element_blank`        |             |
| `element_text`         |             |
| `facet_grid`           |             |
| `facet_wrap`           |             |
| `geom_abline`          |             |
| `geom_bar`             |             |
| `geom_density`         |             |
| `geom_freqpoly`        |             |
| `geom_histogram`       |             |
| `geom_line`            |             |
| `geom_point`           |             |
| `geom_segment`         |             |
| `geom_vline`           |             |
| `ggmap`                |             |
| `ggpairs`              |             |
| `ggplot`               |             |
| `ggsave`               |             |
| `ggtitle`              |             |
| `labs`                 |             |
| `scale_color_manual`   |             |
| `scale_fill_brewer`    |             |
| `scale_fill_distiller` |             |
| `scale_x_continuous`   |             |
| `scale_x_date`         |             |
| `scale_y_continuous`   |             |
| `theme`                |             |
| `theme_bw`             |             |
| `theme_minimal`        |             |
| `xlab`                 |             |
| `xlim`                 |             |
| `ylab`                 |             |
| `ylim`                 |             |

## Modeling

| Function           | Description |
| ------------------ | ----------- |
| `add_model`        |             |
| `add_recipe`       |             |
| `add_row`          |             |
| `all_predictors`   |             |
| `apparent`         |             |
| `augment`          |             |
| `bake`             |             |
| `bind_cols`        |             |
| `collect_metrics`  |             |
| `conf_mat`         |             |
| `dist`             |             |
| `factor`           |             |
| `fit`              |             |
| `fit_resamples`    |             |
| `glance`           |             |
| `initial_split`    |             |
| `k_means`          |             |
| `kmeans`           |             |
| `labeller`         |             |
| `list`             |             |
| `linear_reg`       |             |
| `metrics`          |             |
| `predict`          |             |
| `prep`             |             |
| `testing`          |             |
| `training`         |             |
| `tune`             |             |
| `tune_cluster`     |             |
| `tune_grid`        |             |
| `nearest_neighbor` |             |
| `recipe`           |             |
| `set_engine`       |             |
| `set_mode`         |             |
| `set.seed`         |             |
| `step_center`      |             |
| `step_rm`          |             |
| `step_scale`       |             |
| `vfold_cv`         |             |
| `workflow`         |             |

## Inference

| Function       | Description |
| -------------- | ----------- |
| `quantile`     |             |
| `rep_sample_n` |             |
| `sample_n`     |             |
