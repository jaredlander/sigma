context("checkLayout returns the appropriate layout data.frame")

library(igraph)
data(flightGraph)
data(flightLayout)

gRandom <- checkLayout(flightGraph)
gFrucht <- checkLayout(flightGraph, layout_with_fr)
gBuilt <- checkLayout(flightGraph, flightLayout)

test_that('checkLayout returns a data.frame', {
    expect_is(gRandom, 'data.frame')
    expect_is(gFrucht, 'data.frame')
    expect_is(gBuilt, 'data.frame')
})

test_that('checkLayout returns three columns', {
    expect_equal(ncol(gRandom), 3)
    expect_equal(ncol(gFrucht), 3)
    expect_equal(ncol(gBuilt), 3)
})

test_that('checkLayout returns as many rows as there are nodes', {
    expect_equal(nrow(gRandom), vcount(flightGraph))
    expect_equal(nrow(gFrucht), vcount(flightGraph))
    expect_equal(nrow(gBuilt), vcount(flightGraph))
})

test_that('checkLayout returns the names c("x", "y", "z")', {
    expect_equal(names(gRandom), c("x", "y", "z"))
    expect_equal(names(gFrucht), c("x", "y", "z"))
    expect_equal(names(gBuilt), c("x", "y", "z"))
})
