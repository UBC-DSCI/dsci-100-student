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

test_1.0 <- function() {
    test_that('Did not create an object named credit', {
        expect_true(exists("credit"))
    })
    test_that('credit should be a tibble.', {
        expect_true('tbl' %in% class(credit))
    })
    test_that('credit does not contain the correct number of rows and/or columns.', {
        expect_equal(dim(credit), c(400, 12))
    })
    test_that('The credit tibble is missing columns.', {
        expect_true("Income" %in% colnames(credit))
        expect_true("Balance" %in% colnames(credit))
    })
    test_that('credit does not contain the correct data.', {
        expect_equal(digest(int_round(sum(credit$Income), 2)), '7b41cc2ef140f2cfb4b6eb86ccebf416')
        expect_equal(digest(int_round(sum(credit$Limit), 2)), '1bc8a53a9b0cc2ea3cf99f2306872029')
    })
    print("Success!")
}

test_1.1 <- function() {
    test_that('credit should be a tibble.', {
        expect_true('tbl' %in% class(credit))
    })
    test_that('credit does not contain the correct number of rows and/or columns.', {
        expect_equal(dim(credit), c(400, 3))
    })
    test_that('The credit data frame should not contain the column X1', {
        expect_false("X1" %in% colnames(credit))
    })
    test_that('The credit data frame is missing columns.', {
        expect_true("Income" %in% colnames(credit))
        expect_true("Balance" %in% colnames(credit))
        expect_true("Rating" %in% colnames(credit))
    })
    print("Success!")
}

test_1.2 <- function() {
    test_that('Did not create an object called credit_split.', {
        expect_true(exists('credit_split'))
    })
    test_that('credit_split is not an r_split object.', {
        expect_true('rsplit' %in% class(credit_split))
    })
    test_that('Did not create an object called credit_training.', {
        expect_true(exists('credit_training'))
    })
    test_that('credit_training is not a tibble.',{
        expect_true('tbl' %in% class(credit_training))
    })
    test_that('credit_training does not contain 60% of the data.', {
        expect_equal(dim(credit_training), c(239, 3))
        expect_equal(digest(int_round(sum(credit_training$Balance), 2)), '106403974dfc4096bec8975794589a8d')
        expect_equal(digest(int_round(sum(credit_training$Income), 2)), 'f4025359c0f4da4690b027f0fde961cc')
        expect_equal(digest(int_round(sum(credit_training$Rating), 2)), '70f712ec10d54f13c743bb8ca1087d5d')
    })
    test_that('Did not create an object called credit_testing.', {
        expect_true(exists('credit_testing'))
    })
    test_that('credit_testing is not a tibble.', {
        expect_true('tbl' %in% class(credit_training))
    })
    test_that('credit_testing does not contain the remaining 40% of the data.', {
        expect_equal(dim(credit_testing), c(161, 3))
        expect_equal(digest(int_round(sum(credit_testing$Balance), 2)), '8561399ce68a059a4105e519f9b87991')
        expect_equal(digest(int_round(sum(credit_testing$Income), 2)), '4275f0f094207c00c92a3dc1c202f22c')
        expect_equal(digest(int_round(sum(credit_testing$Rating), 2)), 'af68636b3126e8ccd2b66d79aa88c26e')
    })
    print("Success!")
}

test_1.3 <- function() {
    test_that('credit_eda should be a pairwise plot matrix.', {
        expect_true('ggmatrix' %in% c(class(credit_eda)))
    })
    test_that('credit_eda should be using data from the credit data frame.', {
        expect_equal(int_round(nrow(credit_eda$data), 0), 239)
    })
    test_that('credit_eda should be using the Balance, Income, Rating, Limit columns.', {
        expect_equal(int_round(ncol(credit_eda$data), 0), 3)
    })
    print("Success!")
}

test_1.4 <- function() {
    test_that('Did not create an object called answer1.4.', {
        expect_true(exists('answer1.4'))
    })
    test_that('Solution is incorrect.',{
        expect_equal(digest(answer1.4), '475bf9280aab63a82af60791302736f6')
    })
    print("Success!")
}

test_1.5 <- function() {
    test_that('Did not create an object called lm_spec.', {
        expect_true(exists('lm_spec'))
    })
    test_that('lm_spec should be a linear regression model specification.', {
        expect_true('linear_reg' %in% class(lm_spec))
    })
    test_that('Did not create an object called credit_recipe.', {
        expect_true(exists('credit_recipe'))
    })
    test_that('credit_recipe should be a recipe.', {
        expect_true('recipe' %in% class(credit_recipe))
    })
    test_that('credit_recipe does not contain the training data.', {
        expect_equal(dim(credit_recipe$template), c(239, 3))
        expect_equal(digest(int_round(sum(credit_recipe$template$Income), 2)), 'f4025359c0f4da4690b027f0fde961cc')
        expect_equal(digest(int_round(sum(credit_recipe$template$Rating), 2)), '70f712ec10d54f13c743bb8ca1087d5d')
        expect_equal(digest(int_round(sum(credit_recipe$template$Balance), 2)), '106403974dfc4096bec8975794589a8d')
    })
    print("Success!")    
}

test_1.6 <- function() {
    test_that('Did not create an object called credit_fit.', {
        expect_true(exists('credit_fit')) 
    })
    test_that('credit_fit should be a workflow.', {
        expect_true('workflow' %in% class(credit_fit))
    })
    test_that('credit_fit does not contain the training data.', {
        expect_equal(digest(int_round(sum(credit_fit$pre$mold$predictors$Income), 2)), 'f4025359c0f4da4690b027f0fde961cc')
        expect_equal(digest(int_round(sum(credit_fit$pre$mold$predictors$Rating), 2)), '70f712ec10d54f13c743bb8ca1087d5d')
    })
    print("Success!")
}

test_1.7 <- function(){
    test_that('Did not create an object called answer1.7.', {
        expect_true(exists('answer1.7'))
        })
    test_that('Solution is incorrect.', {
        expect_equal(digest(answer1.7), '75f1160e72554f4270c809f041c7a776')
    })
    print("Success!")
}

test_1.8 <- function() {
    test_that('Solution is incorrect.', {
        expect_equal(digest(int_round(lm_rmse, 2)), 'f6bcdea4269ebac9236e207852f7ae40')
    })
    print("Success!")
}

test_1.9 <- function() {
    test_that('Solution is incorrect.', {
        expect_equal(digest(int_round(lm_rmspe, 2)), '6555c35b04949b0f45e498dc90c2de0b')
    })
    print("Success!")
}

test_1.9.2 <- function(){
    test_that('Did not create an object called answer1.9.2', {
        expect_true(exists('answer1.9.2'))
    })
    test_that('Solution is incorrect', {
        expect_equal(digest(answer1.9.2), '475bf9280aab63a82af60791302736f6')
    })
    print("Success!")
}
