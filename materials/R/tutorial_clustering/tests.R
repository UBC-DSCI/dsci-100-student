library(testthat)
library(digest)
library(rlang)

# Round double to precise integer
#
# `int_round` works to create an integer corresponding to a number that is 
# tested up to a particular decimal point of precision. This is useful when 
# there is a need to compare a numeric value using hashes.
#
# @param x Double vector of length one.
# @param digits Double vector of length one to specify decimal point of precision. Negative numbers can be used to specifying significant digits > 0.1.
#
# @return Integer vector of length one corresponding to a particular decimal point of precision.
#
# @examples
# # to get an integer up to two decimals of precision from 234.56789
# int_round(234.56789, 2)
#
# to get an integer rounded to the hundred digit from 234.56789
# int_round(234.56789, -2)
int_round <- function(x, digits){
    x = x*10^digits
    xint = as.integer(x)
    xint1 = xint + 1L
    if (abs(xint - x) < abs(xint1 - x)){
        return(xint)
    }
    else {
        return(xint1)
    }
}

test_1.0 <- function(){
    test_that('Did not create an object named pokemon_full', {
    expect_true(exists("pokemon_full")) 
})
test_that('pokemon_full should be a tibble.', {
    expect_true('tbl' %in% class(pokemon_full))
})
test_that('pokemon_full does not contain the correct number of rows and/or columns.', {
    expect_equal(dim(pokemon_full), c(800, 13))
})
test_that('pokemon_full is missing columns.', {
    expect_true('Name' %in% colnames(pokemon_full))
    expect_true('HP' %in% colnames(pokemon_full))
    expect_true('Attack' %in% colnames(pokemon_full))
    expect_true('Defense' %in% colnames(pokemon_full))
    expect_true('#' %in% colnames(pokemon_full))
    expect_true('Type 1' %in% colnames(pokemon_full))
    expect_true('Type 2' %in% colnames(pokemon_full))
    expect_true('Total' %in% colnames(pokemon_full))
    expect_true('Sp. Atk' %in% colnames(pokemon_full))
    expect_true('Sp. Def' %in% colnames(pokemon_full))
    expect_true('Speed' %in% colnames(pokemon_full))
    expect_true('Generation' %in% colnames(pokemon_full))
    expect_true('Legendary' %in% colnames(pokemon_full))
    })
print("Success!")
    }

test_1.1 <- function(){
    test_that('Did not create a plot named pokemon_pairs', {
    expect_true(exists("pokemon_pairs")) 
})
test_that('pokemon_pairs should be using data from pokemon_full', {
    expect_equal(int_round(nrow(pokemon_pairs$data), 0), 800)
    expect_equal(int_round(ncol(pokemon_pairs$data), 0), 7)
})
test_that('pokemon_pairs should be a pairwise plot matrix.', {
    expect_true('ggmatrix' %in% c(class(pokemon_pairs)))
    })
test_that('pokemon_pairs should plot columns 5 to 11', {
    expect_equal(pokemon_pairs$yAxisLabels %in% c("Total", "HP", "Attack", "Defense", "Sp. Atk", "Sp. Def", "Speed"), c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE))
    })
print("Success!")
    }

test_1.2 <- function(){
    test_that('pokemon should contain the columns Speed and Defense', {
    expect_true('Speed' %in% colnames(pokemon))
    expect_true('Defense' %in% colnames(pokemon))
    })
test_that('pokemon should contain 800 rows and 2 columns.', {
    expect_equal(int_round(ncol(pokemon), 0), 2)
    expect_equal(int_round(nrow(pokemon), 0), 800)
    })
print("Success!")
    }

test_1.3 <- function(){
    properties <- c(pokemon_scatter$layers[[1]]$mapping, pokemon_scatter$mapping)
    labels <- pokemon_scatter$labels
    test_that('Did not create a plot named pokemon_scatter', {
        expect_true(exists("pokemon_scatter")) 
        })
    test_that('Speed should be on the x-axis.', {
        expect_true("Speed" == rlang::get_expr(properties$x))
        })
    test_that('Defense should be on the y-axis.', {
        expect_true("Defense" == rlang::get_expr(properties$y))
        })
    test_that('pokemon_scatter should be a scatter plot.', {
        expect_true("GeomPoint" %in% c(class(pokemon_scatter$layers[[1]]$geom)))
        })
    test_that('Labels on the axes and legend need to be changed to be descriptive, nicely formatted, and human readable.', {
        expect_false((labels$y) == 'Defense')
        expect_false((labels$x) == 'Speed')
        })
print("Success!")
    }

test_1.4.2 <- function(){
test_that('Did not create a object named pokemon_recipe', {
    expect_true(exists("pokemon_recipe"))
    })
test_that('pokemon_recipe is not a recipe object', {
    expect_equal(digest(class(pokemon_recipe)), '4b3ed1334bff94d43e32a36a1f16a2f2')
    })
test_that('pokemon_recipe does not standardize the data.', {
    expect_equal(dim(bake(prep(pokemon_recipe), pokemon)), c(800,2))
    expect_true(abs(mean(bake(prep(pokemon_recipe), pokemon)$Speed)) < 1e-5)
    expect_true(abs(mean(bake(prep(pokemon_recipe), pokemon)$Defense)) < 1e-5)
    expect_true(abs(sd(bake(prep(pokemon_recipe), pokemon)$Speed)-1.0) < 1e-5)
    expect_true(abs(sd(bake(prep(pokemon_recipe), pokemon)$Defense)-1.0) < 1e-5)
})
test_that('Did not create a object named pokemon_spec', {
        expect_true(exists("pokemon_spec"))
    })
    test_that('pokemon_spec class should be a k_means model specification', {
        expect_true("k_means" %in% class(pokemon_spec))
        expect_true("cluster_spec" %in% class(pokemon_spec))
        })
    test_that('pokemon_spec should specify to use 4 centers', {
        expect_equal(get_expr(pokemon_spec$args$num_clusters), 4)
        })
    test_that('pokemon_spec should use the "stats" engine', {
        expect_equal(pokemon_spec$engine, "stats")
    })
        test_that('Did not create a object named pokemon_clustering', {
        expect_true(exists("pokemon_clustering"))
    })
    test_that('pokemon_clustering class should be a tidymodels workflow object', {
        expect_true("workflow" %in% class(pokemon_clustering))
        })
    test_that('pokemon_clustering has the wrong total within-cluster sum-of-squared distances',{
        expect_equal(digest(int_round(pokemon_clustering$fit$fit$fit$tot.withinss, 2)), '66e1283f789fdedbbe1b4b23581cdc93')
    })
    test_that('pokemon_clustering must be a trained workflow. Remember to call the fit() function!', {
        expect_equal(digest(pokemon_clustering$trained), 'bb73ad91bcb7e948250d465016f7bea8')
    })
    test_that('pokemon_clustering has the wrong clustering', {
        expect_equal(digest(pokemon_clustering$fit$fit$fit$cluster), 'b8c9a9131196dc78c954d5adb2b6581a')
    })
print("Success!")
    }

test_1.5 <- function(){
    properties <- c(pokemon_clustering_plot$layers[[1]]$mapping, pokemon_clustering_plot$mapping)
    labels <- pokemon_clustering_plot$labels
    test_that('Did not create a plot named pokemon_clustering_plot', {
        expect_true(exists("pokemon_clustering_plot")) 
        })
    test_that('Speed should be on the x-axis.', {
        expect_true("Speed" == rlang::get_expr(properties$x))
        })
    test_that('Defense should be on the y-axis.', {
        expect_true("Defense" == rlang::get_expr(properties$y))
        })
    test_that('pokemon_clustering_plot should be a scatter plot.', {
        expect_true("GeomPoint" %in% c(class(pokemon_clustering_plot$layers[[1]]$geom)))
        })
    test_that('Labels on the axes and legend need to be changed to be descriptive, nicely formatted, and human readable.', {
        expect_false((labels$y) == 'Defense')
        expect_false((labels$x) == 'Speed')
        expect_false((labels$colour) == '.pred_cluster')
        })
print("Success!")
    }

test_1.7 <- function(){
test_that('Did not create an elbow_stats object',{
    expect_true(exists('elbow_stats'))
})
test_that('elbow_stats should be a tibble',{
    expect_true('tbl' %in% class(elbow_stats))
})
test_that('elbow_stats should have 10 rows', {
    expect_equal(int_round(nrow(elbow_stats), 0), 10)
    })
test_that('elbow_stats should contain the values 1 through 10 in the num_clusters column',{
    expect_equal(digest(elbow_stats$num_clusters), 'c08951d2c283a799ab013bf845ed822e')
})
test_that('elbow_stats should have two columns: num_clusters and total_WSSD',{
    expect_true('num_clusters' %in% colnames(elbow_stats))
    expect_true('total_WSSD' %in% colnames(elbow_stats))
})
test_that('elbow_stats does not contain the right total WSSD values', {
    expect_equal(digest(int_round(sum(elbow_stats$total_WSSD), 2)), 'ec4cf6680f8fc2d23a8982f80c85093f')
    })   
print("Success!")
    }

test_1.8 <- function(){
properties <- c(elbow_plot$layers[[1]]$mapping, elbow_plot$mapping)
properties2 <- c(elbow_plot$later[[2]]$mapping, elbow_plot$mapping)
test_that('Did not create a plot called elbow_plot', {
    expect_true(exists('elbow_plot'))
})
test_that('elbow_plot should be a line plot with points', {
    expect_true("GeomPoint" %in% c(class(elbow_plot$layers[[1]]$geom), class(elbow_plot$layers[[2]]$geom)))
    expect_true("GeomLine" %in% c(class(elbow_plot$layers[[1]]$geom), class(elbow_plot$layers[[2]]$geom)))
})
test_that('num_clusters should be on the x-axis', {
    expect_true(rlang::get_expr(properties$x) == 'num_clusters')
})
test_that('total_WSSD should be on the y-axis', {
    expect_true(rlang::get_expr(properties$y) == 'total_WSSD')
})
test_that('Labels on the axes should be descriptive and human readable.', {
        expect_false((elbow_plot$labels$x) == 'num_clusters')
        expect_false((elbow_plot$labels$y) == 'total_WSSD')
})
print('Success!')
}

test_1.10 <- function(){
       properties <- c(pokemon_final_clusters_plot$layers[[1]]$mapping, pokemon_final_clusters_plot$mapping)
    labels <- pokemon_final_clusters_plot$labels
    test_that('Did not create a plot named pokemon_final_clusters_plot', {
        expect_true(exists("pokemon_final_clusters_plot")) 
        })
    test_that('Speed should be on the x-axis.', {
        expect_true("Speed" == rlang::get_expr(properties$x))
        })
    test_that('Defense should be on the y-axis.', {
        expect_true("Defense" == rlang::get_expr(properties$y))
        })
    test_that('pokemon_final_clusters_plot should be a scatter plot.', {
        expect_true("GeomPoint" %in% c(class(pokemon_final_clusters_plot$layers[[1]]$geom)))
        })
    test_that('Labels on the axes and legend need to be changed to be descriptive, nicely formatted, and human readable.', {
        expect_false((labels$y) == 'Defense')
        expect_false((labels$x) == 'Speed')
        expect_false((labels$colour) == '.pred_cluster')
        })
print("Success!") 
}
