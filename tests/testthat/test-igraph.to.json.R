context("igraph.to.json converts igraph to json")

library(igraph)
library(jsonlite)
data(flightGraph)
data(flightLayout)

test_that('igraph.to.json returns a json object', {
    expect_is(igraph.to.json(flightGraph), 'json')
})

test_that('igraph.to.json returns a json object of length 1', {
    expect_equal(length(igraph.to.json(flightGraph)), 1)
})
