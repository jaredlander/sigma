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

test_that('assignPositions left behind x,y,z', {
    expect_equal(length(V(g1)$x), vcount(g1))
    expect_equal(length(V(g1)$y), vcount(g1))
    expect_equal(length(V(g1)$z), vcount(g1))
    
    expect_equal(length(V(g2)$x), vcount(g2))
    expect_equal(length(V(g2)$y), vcount(g2))
    expect_equal(length(V(g2)$z), vcount(g2))
})
