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
    x = x * 10^digits
    xint = as.integer(x)
    xint1 = xint + 1L
    if (abs(xint - x) < abs(xint1 - x)){
        return(xint)
    }
    else {
        return(xint1)
    }
}

test_0.0 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer0.0), '01a75cb73d67b0f895ff0e61449c7bf8') 
    })
    print("Success!")
}
test_0.1 <- function(){
    test_that('Solution is incorrect', {
        expect_true(digest(answer0.1) == 'd19d62a873f08af0488f0df720cfd293' || 
                   digest(answer0.1) == 'e5b57f323c7b3719bbaaf9f96b260d39') 
    })
    print("Success!")
    }

test_1.0 <- function(){
    test_that('Did not create an object named beer', {
        expect_true(exists("beer")) 
    })
    test_that('beer should be a tibble.', {
        expect_true('tbl' %in% class(beer))
    })
    test_that('beer does not contain the correct number of rows and/or columns.', {
        expect_equal(dim(beer), c(2410, 8))
    })
    test_that('The beer tibble is missing columns.', {
        expect_true("abv" %in% colnames(beer))
        expect_true("ibu" %in% colnames(beer))
        expect_true("id" %in% colnames(beer))
        expect_true("name" %in% colnames(beer))
        expect_true("style" %in% colnames(beer))
        expect_true("brewery_id" %in% colnames(beer))
        expect_true("ounces" %in% colnames(beer))
    })
    print("Success!")
}

test_1.1 <- function(){
    test_that('Did not create a plot named beer_plot', {
        expect_true(exists("beer_plot")) 
    })
    properties <- c(beer_plot$layers[[1]]$mapping, beer_plot$mapping)
    labels <- beer_plot$labels    
    test_that('ibu should be on the x-axis.', {
        expect_true("ibu" == rlang::get_expr(properties$x))
        })
    test_that('abv should be on the y-axis.', {
        expect_true("abv" == rlang::get_expr(properties$y))
        })
    test_that('beer_plot should be a scatter plot.', {
        expect_true("GeomPoint" %in% c(class(beer_plot$layers[[1]]$geom)))
        })
    test_that('Labels on the axes should be descriptive and human readable.', {
        expect_false((labels$y) == 'abv')
        expect_false((labels$x) == 'ibu')
        })
    print("Success!")
}

test_1.2 <- function(){
    test_that('Did not create an object named clean_beer', {
        expect_true(exists("clean_beer")) 
    })
    test_that('clean_beer should be a tibble.', {
        expect_true('tbl' %in% class(clean_beer))
    })
    test_that('clean_beer should only contain the columns ibu and abv', {
        expect_true("ibu" %in% colnames(clean_beer))
        expect_true("abv" %in% colnames(clean_beer))
        expect_false("id" %in% colnames(clean_beer))
        expect_false("name" %in% colnames(clean_beer))
        expect_false("style" %in% colnames(clean_beer))
        expect_false("brewery_id" %in% colnames(clean_beer))
        expect_false("ounces" %in% colnames(clean_beer))
        })
    test_that('clean_beer does not contain the correct number of rows and/or columns.', {
        expect_equal(dim(clean_beer), c(1405, 2))
    })

    print("Success!")
    }

test_1.3 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.3), '75f1160e72554f4270c809f041c7a776') 
    })
    print("Success!")
    }

test_1.4 <- function(){
test_that('Did not create a object named kmeans_recipe', {
    expect_true(exists("kmeans_recipe"))
    })
test_that('kmeans_recipe is not a recipe object', {
    expect_equal(digest(class(kmeans_recipe)), '4b3ed1334bff94d43e32a36a1f16a2f2')
    })
test_that('kmeans_recipe does not standardize the data.', {
    expect_equal(dim(bake(prep(kmeans_recipe), clean_beer)), c(1405,2))
    expect_true(abs(mean(bake(prep(kmeans_recipe), clean_beer)$ibu)) < 1e-5)
    expect_true(abs(mean(bake(prep(kmeans_recipe), clean_beer)$abv)) < 1e-5)
    expect_true(abs(sd(bake(prep(kmeans_recipe), clean_beer)$ibu)-1.0) < 1e-5)
    expect_true(abs(sd(bake(prep(kmeans_recipe), clean_beer)$abv)-1.0) < 1e-5)
})
print("Success!")
}

test_1.5 <- function(){
    test_that('Did not create a object named kmeans_spec', {
        expect_true(exists("kmeans_spec"))
    })
    test_that('kmeans_spec class should be a k_means model specification', {
        expect_true("k_means" %in% class(kmeans_spec))
        expect_true("cluster_spec" %in% class(kmeans_spec))
        })
    test_that('kmeans_spec should specify to use 2 centers', {
        expect_equal(get_expr(kmeans_spec$args$num_clusters), 2)
        })
    test_that('kmeans_spec should use the "stats" engine', {
        expect_equal(kmeans_spec$engine, "stats")
    })
    print("Success!")
}

test_1.6 <- function(){
    test_that('Did not create a object named kmeans_fit', {
        expect_true(exists("kmeans_fit"))
    })
    test_that('kmeans_fit class should be a tidymodels workflow object', {
        expect_true("workflow" %in% class(kmeans_fit))
        })
    test_that('kmeans_fit has the wrong total within-cluster sum-of-squared distances',{
        expect_equal(digest(int_round(kmeans_fit$fit$fit$fit$tot.withinss, 2)), 'a3487cbd1a6cd4b181bb878433738a9f')
    })
    test_that('kmeans_fit must be a trained workflow. Remember to call the fit() function!', {
        expect_equal(digest(kmeans_fit$trained), 'bb73ad91bcb7e948250d465016f7bea8')
    })
    test_that('kmeans_fit has the wrong clustering', {
        expect_equal(digest(kmeans_fit$fit$fit$fit$cluster), '14f5153f8735994b439ae722cf451f77')
    })
    print("Success!")
}

test_1.7 <- function(){
    test_that('Did not create a object named labelled_beer', {
        expect_true(exists("labelled_beer"))
    })
    test_that('labelled_beer should be a tibble.', {
        expect_true('tbl' %in% class(labelled_beer))
    })
    test_that('labelled_beer should contain a column with cluster assignments named .pred_cluster',{
        expect_true('.pred_cluster' %in% colnames(labelled_beer))
    })
    test_that('labelled_beer should be the same as clean_beer except with an additional column of cluster assignments',{
        expect_equal(dim(select(labelled_beer, ibu, abv)), c(1405, 2))
    })
}

test_1.8 <- function(){
    properties <- c(cluster_plot$layers[[1]]$mapping, cluster_plot$mapping)
    labels <- cluster_plot$labels    
    test_that('Did not create a plot named cluster_plot', {
        expect_true(exists("cluster_plot")) 
        })
    test_that('cluster_plot should contain information from labelled_beer', {
        expect_equal(cluster_plot$data, labelled_beer)
        })
    test_that('ibu should be on the x-axis.', {
        expect_true("ibu" == rlang::get_expr(properties$x))
        })
    test_that('abv should be on the y-axis.', {
        expect_true("abv" == rlang::get_expr(properties$y))
        })
    test_that('.pred_cluster should be used to colour the points.', {
        expect_true(".pred_cluster" == rlang::get_expr(properties$colour))
        })
    test_that('cluster_plot should be a scatter plot.', {
        expect_true("GeomPoint" %in% c(class(cluster_plot$layers[[1]]$geom)))
        })
    test_that('Labels on the axes should be descriptive and human readable.', {
        expect_false((labels$y) == 'abv')
        expect_false((labels$x) == 'ibu')
        expect_false((labels$colour) == '.cluster')
        })
    print("Success!")
    }

test_1.9.1 <- function(){
    test_that('Solution is incorrect', {
    expect_equal(digest(answer1.9.1), '475bf9280aab63a82af60791302736f6')
})
print("Success!")
    }

test_1.9.2 <- function(){
    test_that('Did not create an object named clustering_stats', {
    expect_true(exists("clustering_stats")) 
    })
    test_that('clustering_stats should be a tibble.', {
    expect_true('tbl' %in% class(clustering_stats))
    })
test_that('clustering_stats should have 1 row of 4 different statistics.', {
    expect_equal(dim(clustering_stats), c(1, 4))
    })
test_that('clustering_stats should contain total within sum of squares (tot.withinss).', {
    expect_true('tot.withinss' %in% colnames(clustering_stats))
    })
test_that('clustering_stats should have the right total within sum of squares', {
    expect_equal(digest(int_round(clustering_stats$tot.withinss, 2)), 'a3487cbd1a6cd4b181bb878433738a9f')
})
print("Success!")
    }

test_1.9.3 <- function(){
    test_that('Did not create an object named totalWSSD', {
    expect_true(exists("totalWSSD")) 
    })
    test_that('The type of totalWSSD should be numeric.', {
    expect_equal('numeric', class(totalWSSD))
    })
test_that('The value of totalWSSD is not correct.', {
    expect_equal(digest(int_round(totalWSSD, 2)), 'a3487cbd1a6cd4b181bb878433738a9f')
    })
print("Success!")
    }

test_2.0 <- function(){
    test_that('beer_ks should be a tbl.', {
    expect_true('tbl' %in% class(beer_ks))
    })
test_that('beer_ks should have 1 column containing k values from 1 to 10.', {
    expect_equal(int_round(nrow(beer_ks), 0), 10) 
    expect_equal(int_round(ncol(beer_ks), 0), 1) 
    expect_equal(colnames(beer_ks), 'num_clusters') 
    })
print("Success!")
    }

test_2.1 <- function(){
    test_that('Did not create a object named kmeans_spec_tune', {
        expect_true(exists("kmeans_spec_tune"))
    })
    test_that('kmeans_spec_tune class should be a k_means model specification', {
        expect_true("k_means" %in% class(kmeans_spec_tune))
        expect_true("cluster_spec" %in% class(kmeans_spec_tune))
        })
    test_that('kmeans_spec_tune should specify to tune the number of centers', {
        expect_equal(as.character(get_expr(kmeans_spec_tune$args$num_clusters)), 'tune')
        })
    test_that('kmeans_spec_tune should use the "stats" engine', {
        expect_equal(kmeans_spec_tune$engine, "stats")
    })
    test_that('kmeans_spec_tune should set nstart to 10',{
        expect_equal(get_expr(kmeans_spec_tune$eng_args$nstart), 10)
    })
    print("Success!")
}

test_2.2 <- function(){
    test_that('Did not create an object named kmeans_tuning_stats', {
    expect_true(exists("kmeans_tuning_stats")) 
    })
    test_that('kmeans_tuning_stats should be a tibble.', {
    expect_true('tbl' %in% class(kmeans_tuning_stats))
    })
test_that('kmeans_tuning_stats should have 2 rows for each value of K tested (20 rows total) and 7 columns.', {
    expect_equal(dim(kmeans_tuning_stats), c(20, 7))
    })
test_that('kmeans_tuning_stats should have num_clusters, .metric, and mean in its column names.', {
    expect_true('.metric' %in% colnames(kmeans_tuning_stats))
    expect_true('mean' %in% colnames(kmeans_tuning_stats))
    expect_true('num_clusters' %in% colnames(kmeans_tuning_stats))
    })    
print("Success!")
    }

test_2.3 <- function(){
    test_that('Did not create an object named tidy_tuning_stats', {
    expect_true(exists("tidy_tuning_stats")) 
    })
    test_that('tidy_tuning_stats should be a tibble.', {
    expect_true('tbl' %in% class(tidy_tuning_stats))
    })
test_that('tidy_tuning_stats should have 10 rows (one for each value of K) and 2 columns.', {
    expect_equal(dim(tidy_tuning_stats), c(10, 2))
    })
test_that('tidy_tuning_stats should have two columns named num_clusters and total_WSSD.', {
    expect_true('num_clusters' %in% colnames(tidy_tuning_stats))
    expect_true('total_WSSD' %in% colnames(tidy_tuning_stats))
    })    
test_that('tidy_tuning_stats should have the numbers 1 through 10 in the num_clusters column',{
    expect_equal(digest(tidy_tuning_stats$num_clusters), 'c08951d2c283a799ab013bf845ed822e')
})
print("Success!")
    }

test_2.4 <- function(){
    properties <- c(choose_beer_k$layers[[1]]$mapping, choose_beer_k$mapping)
    labels <- choose_beer_k$labels    
    test_that('Did not create a plot named choose_beer_k', {
        expect_true(exists("choose_beer_k")) 
        })
    test_that('# clusters should be on the x-axis.', {
        expect_true("num_clusters" == rlang::get_expr(properties$x))
        })
    test_that('total within-cluster sum-of-squares should be on the y-axis.', {
        expect_true("total_WSSD" == rlang::get_expr(properties$y))
        })
    test_that('choose_beer_k should be a line and scatter plot.', {
        expect_true("GeomLine" %in% c(class(choose_beer_k$layers[[1]]$geom),class(choose_beer_k$layers[[2]]$geom)))
        })
    test_that('choose_beer_k should be a line and scatter plot.', {
        expect_true("GeomPoint" %in% c(class(choose_beer_k$layers[[1]]$geom),class(choose_beer_k$layers[[2]]$geom)))
        })
    test_that('Labels on the axes should be descriptive and human readable.', {
        expect_false((labels$y) == 'total_WSSD')
        expect_false((labels$x) == 'num_clusters')
        })
    print("Success!")
    }

test_2.5 <- function(){
    test_that('Solution is incorrect', {
    expect_true(digest(answer2.5) %in% c('0e4033b8c0b56afbea35dc749ced4e1d', 
                                         'd19d62a873f08af0488f0df720cfd293',
                                         '00713fac580bcb0691658403f8e6f4e3',
                                        'db8e490a925a60e62212cefc7674ca02',
                                        'e5b57f323c7b3719bbaaf9f96b260d39',
                                        'dbc09cba9fe2583fb01d63c70e1555a8'))
    })
print("Success!")
    }

test_2.6 <- function(){
    test_that('Solution is incorrect', {
    expect_equal(digest(answer2.6), '475bf9280aab63a82af60791302736f6')
    })
print("Success!")
    }

test_2.7 <- function(){
    test_that('Solution is incorrect', {
    expect_equal(digest(answer2.7), '3a5505c06543876fe45598b5e5e5195d')
    })
print("Success!")
    }

test_2.8 <- function(){
    test_that('Solution is incorrect', {
    expect_equal(digest(answer2.8), '05ca18b596514af73f6880309a21b5dd')
    })
print("Success!")
    }
