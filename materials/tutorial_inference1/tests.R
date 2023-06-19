library(testthat)
library(digest)

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
    properties <- c(pop_dist$layers[[1]]$mapping, pop_dist$mapping)
    test_that('grade should be on the x-axis.', {
        expect_true("grade" == rlang::get_expr(properties$x))
        })
    test_that('pop_dist should be a histogram.', {
        expect_true("GeomBar" %in% class(pop_dist$layers[[1]]$geom))
        })
    test_that('students_pop data should be used to create the histogram', {
        expect_equal(int_round(nrow(pop_dist$data), 0), 10000)
        expect_equal(digest(int_round(sum(pop_dist$data), 2)), '3136d0838b3ab31dbff61d1de4659826')
    })
    #test_that('Labels on the x axis should be descriptive and human readable.', {
        #expect_false((pop_dist$labels$x) == 'grade')
       # })
    print("Success!")
}

test_1.2 <- function(){
    test_that('pop_parameters has 3 columns and one row, with column names pop_mean, pop_med and pop_sd.', {
        expect_equal(int_round(nrow(pop_parameters), 0), 1)
        expect_equal(int_round(ncol(pop_parameters), 0), 3)
        expect_equal(digest(int_round(pop_parameters$pop_mean, 2)), '4eb3276e1ae5b53d7b41cd23f552d8cf')
        expect_equal(digest(int_round(pop_parameters$pop_sd, 2)), '8c0a944402768b5b9b1e68abfeabbe7b')
    })
    print("Success!")
}

test_1.2.1 <- function(){
    test_that('ests_5 has one row, with column names mean_5, med_5 and sd_5.', {
        expect_equal(int_round(nrow(ests_5), 0), 1)
        expect_true("mean_5" %in% colnames(ests_5))
        expect_true("med_5" %in% colnames(ests_5))
        expect_true("sd_5" %in% colnames(ests_5))
        expect_equal(digest(int_round(ests_5$mean_5, 1)), 'aa945d05c992fcdb745752143342acd3')
        expect_equal(digest(int_round(ests_5$sd_5, 1)), '98616fd038a28bd3aac2db8f903ebb2d')
    })
    print("Success!")
}

test_1.2.2 <- function(){
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.2.2), '3a5505c06543876fe45598b5e5e5195d') 
    })
    print("Success!")
}

test_1.2.3 <- function(){
    test_that('ests_100 has one row, with column names mean_100, med_100 and sd_100.', {
        expect_equal(int_round(nrow(ests_100), 0), 1)
        expect_true("mean_100" %in% colnames(ests_100))
        expect_true("med_100" %in% colnames(ests_100))
        expect_true("sd_100" %in% colnames(ests_100))
        expect_equal(digest(int_round(ests_100$mean_100, 1)), '13d94d89c771d00b29ac574f6a3ebaf6')
        expect_equal(digest(int_round(ests_100$sd_100, 1)), 'e4ced46f028c228b02d106d874876fe8')
    })
    print("Success!")
}

test_1.3 <- function(){
    test_that('samples should have 7500 rows and 2 columns', {
        expect_equal(int_round(ncol(samples), 0), 2)
        expect_equal(int_round(nrow(samples), 0), 7500)
    })
    test_that('the column names of samples should be replicate and grade', {
        expect_equal(digest(paste(sort(colnames(samples)), collapse = "")), '0454d7f37ea4f0b0109a37b637be0481')
    })
    test_that('size and rep arguments are incorrect', {
        expect_equal(digest(int_round(sum(attr(samples, "groups")$replicate), 2)), '976edfa66891286b03609c35209572f5')
    })
    print("Success!")
}

test_1.4 <- function(){
    test_that('sample_estimates should have 1500 rows and 2 columns', {
        expect_equal(int_round(ncol(sample_estimates), 0), 2)
        expect_equal(int_round(nrow(sample_estimates), 0), 1500)
    })
    test_that('the column names of sample_estimates should be replicate and sample_mean', {
        expect_equal(digest(paste(sort(colnames(sample_estimates)), collapse = "")), '7453089f8086e9a98a067f3eeac63363')
    })
    print("Success!")
}

test_1.5 <- function(){
    properties <- c(sampling_distribution_5$layers[[1]]$mapping, sampling_distribution_5$mapping)
    labels <- sampling_distribution_5$labels
    test_that('sample_mean should be on the x-axis.', {
        expect_true("sample_mean" == rlang::get_expr(properties$x))
    })
    test_that('sampling_distribution_5 should be a histogram.', {
        expect_true("GeomBar" %in% class(sampling_distribution_5$layers[[1]]$geom))
    })
    test_that('sampling_distribution data should be used to create the histogram', {
        expect_equal(int_round(nrow(sampling_distribution_5$data), 0), 1500)
        expect_equal(digest(int_round(sum(sampling_distribution_5$data), 2)), 'b4152c2ce7dc65945435c167ebaed7be')
    })
   test_that('Labels on the x axis should be descriptive. The plot should have a descriptive title.', {
        expect_false((labels$x) == 'sample_mean')
        expect_false(is.null(labels$title))
    })
    print("Success!")
}

#test_1.8 <- function(){
#    properties <- c(sampling_distribution_5$layers[[1]]$mapping, sampling_distribution_5$mapping)
#    labels <- sampling_distribution_5$labels
#    test_that('sample_mean should be on the x-axis.', {
#        expect_true("sample_mean" == rlang::get_expr(properties$x))
#    })
#    test_that('sampling_distribution_5 should be a histogram.', {
#        expect_true("GeomBar" %in% class(sampling_distribution_5$layers[[1]]$geom))
#    })
#    test_that('sampling_distribution data should be used to create the histogram', {
#        expect_equal(int_round(nrow(sampling_distribution_5$data), 0), 1500)
#        expect_equal(digest(int_round(sum(sampling_distribution_5$data), 2)), '18d1759ac02cbbc83c6f2d30e733a093')
#    })
#   test_that('Labels on the x axis should be descriptive. The plot should have a descriptive title.', {
#        expect_false((labels$x) == 'cups')
#        expect_false(is.null(labels$title))
#    })
#    test_that('size and rep values are incorrect', {
#        test_that(digest(int_round(sum(attr(samples, "groups")$replicate), 2)), '976edfa66891286b03609c35209572f5')
#    })
#    print("Success!")
#}

test_1.8 <- function(){
    properties <- c(coffee_sampling_distribution_5$layers[[1]]$mapping, coffee_sampling_distribution_5$mapping)
    labels <- coffee_sampling_distribution_5$labels
    test_that('Did not create an object called coffee_samples_5', {
        expect_true(exists('coffee_samples_5'))
    })
    test_that('coffee_samples_5 does not contain the correct data', {
        expect_equal(dim(coffee_samples_5), c(7500, 2))
        expect_equal(digest(int_round(sum(coffee_samples_5$replicate), 2)), '85af0fba15fcfe28a2f8ef66fdcccbcf')
    })
    test_that('Did not create an object called coffee_sample_estimates_5', {
        expect_true(exists('coffee_sample_estimates_5'))
    })
    test_that('coffee_sample_estimates_5 does not contain a column called coffee_sample_mean_5', {
        expect_true('coffee_sample_mean_5' %in% colnames(coffee_sample_estimates_5))
    })
    test_that('coffee_sample_estimates_5 does not contain the correct data', {
        expect_equal(dim(coffee_sample_estimates_5), c(1500, 2))
        expect_equal(digest(int_round(sum(coffee_sample_estimates_5$coffee_sample_mean_5), 2)), '1c69dbae0a048e8a95be34cbdd4ccb9f')
    })
    test_that('coffee_sample_mean_5 should be on the x-axis.', {
        expect_true("coffee_sample_mean_5" == rlang::get_expr(properties$x))
    })
    test_that('coffee_sampling_distribution_5 should be a histogram.', {
        expect_true("GeomBar" %in% class(coffee_sampling_distribution_5$layers[[1]]$geom))
    })
    test_that('coffee_sampling_distribution_5 data should be used to create the histogram', {
        expect_equal(int_round(nrow(coffee_sampling_distribution_5$data), 0), 1500)
        expect_equal(digest(int_round(sum(coffee_sampling_distribution_5$data), 2)), '0393ea270fd8d93548cce5b02d06d2cf')
    })
   test_that('Labels on the x axis should be descriptive. The plot should have a descriptive title.', {
        expect_false((labels$x) == 'coffee_sample_mean_5')
        expect_false(is.null(labels$title))
    })
    test_that('size and rep values are incorrect', {
        expect_equal(digest(int_round(sum(attr(coffee_samples_5, "groups")$replicate), 2)), '976edfa66891286b03609c35209572f5')
    })
    print("Success!")
}

#test_2.0 <- function(){
#    properties <- c(sampling_distribution_30$layers[[1]]$mapping, sampling_distribution_30$mapping)
#    labels <- sampling_distribution_30$labels
#    test_that('sample_mean should be on the x-axis.', {
#        expect_true("sample_mean" == rlang::get_expr(properties$x))
#    })
#    test_that('sampling_distribution_30 should be a histogram.', {
#        expect_true("GeomBar" %in% class(sampling_distribution_30$layers[[1]]$geom))
#    })
#    test_that('sampling_distribution_30 data should be used to create the histogram', {
#        expect_equal(int_round(nrow(sampling_distribution_30$data), 0), 1500)
#        expect_equal(digest(int_round(sum(sampling_distribution_30$data), 2)), "94bb219a42d934ffd9d349ddcbfa74f2")
#    })
#   test_that('Labels on the x axis should be descriptive. The plot should have a descriptive title.', {
#        expect_false((labels$x) == 'sample_mean')
#        expect_false(is.null(labels$title))
#    })
#    print("Success!")
#}

test_2.0 <- function(){
    properties <- c(coffee_sampling_distribution_30$layers[[1]]$mapping, coffee_sampling_distribution_30$mapping)
    labels <- coffee_sampling_distribution_30$labels
    test_that('Did not create an object called coffee_samples_30', {
        expect_true(exists('coffee_samples_30'))
    })
    test_that('coffee_samples_30 does not contain the correct data', {
        expect_equal(dim(coffee_samples_30), c(45000, 2))
        expect_equal(digest(int_round(sum(coffee_samples_30$replicate), 0)), 'e9f03592cbd42086a7a75ba269f05d5e')
    })
    test_that('Did not create an object called coffee_sample_estimates_30', {
        expect_true(exists('coffee_sample_estimates_30'))
    })
    test_that('coffee_sample_estimates_30 does not contain a column called coffee_sample_mean_30', {
        expect_true('coffee_sample_mean_30' %in% colnames(coffee_sample_estimates_30))
    })
    test_that('coffee_sample_estimates_30 does not contain the correct data', {
        expect_equal(dim(coffee_sample_estimates_5), c(1500, 2))
        expect_equal(digest(int_round(sum(coffee_sample_estimates_30$coffee_sample_mean_30), 2)), 'c7c6210820892e507d0173ba167d416f')
    })
    test_that('coffee_sample_mean_30 should be on the x-axis.', {
        expect_true("coffee_sample_mean_30" == rlang::get_expr(properties$x))
    })
    test_that('coffee_sampling_distribution_30 should be a histogram.', {
        expect_true("GeomBar" %in% class(coffee_sampling_distribution_30$layers[[1]]$geom))
    })
    test_that('coffee_sampling_distribution_30 data should be used to create the histogram', {
        expect_equal(int_round(nrow(coffee_sampling_distribution_30$data), 0), 1500)
        expect_equal(digest(int_round(sum(coffee_sampling_distribution_30$data), 2)), '87c3a46c577cba8da795a55da1f8c17b')
    })
   test_that('Labels on the x axis should be descriptive. The plot should have a descriptive title.', {
        expect_false((labels$x) == 'coffee_sample_mean_30')
        expect_false(is.null(labels$title))
    })
    test_that('size and rep values are incorrect', {
        expect_equal(digest(int_round(sum(attr(coffee_samples_30, "groups")$replicate), 2)), '976edfa66891286b03609c35209572f5')
    })
    print("Success!")
}
