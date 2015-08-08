#' @title igraph.to.json
#' @description Convert an igraph object to json
#' @details Converts an igraph object to json with an array holding an array each for nodes and edges.
#' @author Jared P. Lander
#' @aliases igraph.to.json
#' @export igraph.to.json
#' @importFrom igraph get.data.frame
#' @importFrom jsonlite toJSON
#' @param g An igraph object
#' @return A string of json text representing the igraph object as an array holding an array each for nodes and edges.
#' @examples 
#' data(flightGraph)
#' igraph.to.json(flightGraph)
#' 
igraph.to.json <- function(g)
{
    # make graph into a list of data.frames
    gdata <- get.data.frame(g, what = "both")
    
    # rename vertices to nodes
    names(gdata)[1] <- 'nodes'
    
    return(toJSON(gdata))
}
