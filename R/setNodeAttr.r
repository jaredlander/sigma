#' @title setNodeSize
#' @description Set node size if not already set
#' @details Checks if node size is set, if not set it
#' @author Jared P. Lander
#' @aliases setNodeSize
#' @export setNodeSize
#' @importFrom igraph V "V<-"
#' @param x An igraph object
#' @param node.size A numeric or integer specifying the size of the nodes
#' @return An igraph object with size set
#' @examples 
#' library(igraph)
#' data(flightGraph)
#' flightSize <- setNodeSize(flightGraph)
#' V(flightSize)$size
#' flightSize <- setNodeSize(flightSize, 16)
#' V(flightSize)$size
#' 
setNodeSize <- function(x, node.size=75)
{
    # if size is't set in the graph, set to a default
    if(is.null(V(x)$size))
    {
        V(x)$size <- node.size
    }
    
    return(x)
}

#' @title setNodeColor
#' @description Set node color if not already set
#' @details Checks if node size is set, if not set it
#' @author Jared P. Lander
#' @aliases setNodeColor
#' @export setNodeColor
#' @importFrom igraph V
#' @param x An igraph object
#' @param node.size A character specifying the color
#' @return An igraph object with size set
#' @examples 
#' library(igraph)
#' data(flightGraph)
#' flightColor <- setNodeColor(flightGraph)
#' V(flightColor)$color
#' flightColor <- setNodeColor(flightColor, 'red')
#' V(flightColor)$color
#' 
setNodeColor <- function(x, node.color='blue')
{
    # if color is't set in the graph, set to a default
    if(is.null(V(x)$color))
    {
        V(x)$color <- node.color
    }
    
    return(x)
}


#' @title assignPositions
#' @description Adds position coordinates to an igraph object
#' @details Given a graph and either a layout function or a layout matrix, adds those coordiantes to the nodes of the graph.
#' @author Jared P. Lander
#' @aliases assignPositions
#' @export assignPositions
#' @importFrom igraph "V<-" layout.random
#' @param g An igraph object
#' @param positions Either a layout function or a layout matrix
#' @return The igraph object with x, y, z coordinates stored in the vertex attributes
#' @examples 
#' data(flightGraph)
#' assignPositions(flightGraph)
#' assignPositions(flightGraph, layout_with_fr)
#' 
assignPositions <- function(g, positions=layout.random)
{
    # get a positions data.frame
    positions <- checkLayout(g, positions)
    
    ## assign x,y,z positions to g
    V(g)$x <- positions$x
    V(g)$y <- positions$y
    V(g)$z <- positions$z
    
    return(g)
}