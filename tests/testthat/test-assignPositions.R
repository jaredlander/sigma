context("assignPositions properly assigns x,y,z coordiantes to a graph's vertices")

data(flightGraph)
g1 <- assignPositions(flightGraph)
g2 <- assignPositions(flightGraph, layout_with_fr)

test_that('assignPositions returns an igraph object', {
    expect_is(g1, 'igraph')
    expect_is(g2, 'igraph')
})

test_that('assignPositions left the right amount of vertices', {
    expect_equal(vcount(g1), vcount(flightGraph))
    expect_equal(vcount(g2), vcount(flightGraph))
})
