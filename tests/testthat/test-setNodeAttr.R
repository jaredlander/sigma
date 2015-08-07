context("setNodeAttr is setting the right attributes")

library(igraph)
data(flightGraph)
size20 <- setNodeSize(flightGraph, 20)
colorYellow <- setNodeColor(flightGraph, 'yellow')

test_that('setNodeSize and setNodeColor return igraph objects', {
    expect_is(setNodeSize(flightGraph), 'igraph')
    expect_is(setNodeSize(flightGraph, node.size=16), 'igraph')
    expect_is(setNodeSize(size20, node.size=16), 'igraph')
    
    expect_is(setNodeColor(flightGraph), 'igraph')
    expect_is(setNodeColor(flightGraph, node.color='red'), 'igraph')
    expect_is(setNodeColor(colorYellow, node.color='red'), 'igraph')
})

test_that('setNodeSize and setNodeColor return igraph objects of the right size', {
    expect_equal(vcount(setNodeSize(flightGraph)), vcount(flightGraph))
    expect_equal(vcount(setNodeSize(flightGraph, node.size=16)), vcount(flightGraph))
    expect_equal(vcount(setNodeSize(size20, node.size=16)), vcount(flightGraph))
    
    expect_equal(vcount(setNodeColor(flightGraph)), vcount(flightGraph))
    expect_equal(vcount(setNodeColor(flightGraph, node.color='red')), vcount(flightGraph))
    expect_equal(vcount(setNodeColor(colorYellow, node.color='red')), vcount(flightGraph))
})

test_that('If size is unset, set the size', {
    expect_equal(V(setNodeSize(flightGraph))$size, rep(75, vcount(flightGraph)))
    expect_equal(V(setNodeSize(flightGraph, 16))$size, rep(16, vcount(flightGraph)))
})

test_that('If color is unset, set the color', {
    expect_equal(V(setNodeColor(flightGraph))$color, rep('blue', vcount(flightGraph)))
    expect_equal(V(setNodeColor(flightGraph, 'red'))$color, rep('red', vcount(flightGraph)))
})

test_that('If size is set already, leave alone', {
    expect_equal(V(setNodeSize(size20))$size, rep(20, vcount(size20)))
    expect_equal(V(setNodeSize(size20, 16))$size, rep(20, vcount(size20)))
})

test_that('If color is set already, leave alone', {
    expect_equal(V(setNodeColor(colorYellow))$color, rep('yellow', vcount(colorYellow)))
    expect_equal(V(setNodeColor(colorYellow, 'red'))$color, rep('yellow', vcount(colorYellow)))
})
