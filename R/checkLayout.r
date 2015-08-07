#' @title checkLayout
#' @description Helper function for Sigma to either run a layout function on a graph or accept a prebuilt layout matrix.
#' @details If layout is a function it is used on the graph x to calculate a layout matrix.  If layout is a matrix it is used.  Both are converted to a data.frame with x, y, z columns.  This is meant to create a positions object for the igraph.to.rgexf function.
#' @author Jared P. Lander
#' @aliases checkLayout
#' @export checkLayout
#' @importFrom  igraph layout.random
#' @importFrom dplyr "%>%" rename mutate
#' @param x An igraph object
#' @param Either a layout matrix or a function for calculating a graph's layout
#' @return A three-column data.frame with names c('x, 'y', 'z')
#' @examples 
#' library(igraph)
#' data(flightGraph)
#' data(flightLayout)
#' checkLayout(flightGraph, layout=layout_with_fr)
#' checkLayout(flightGraph, layout=flightLayout)
#' 
checkLayout <- function(x, layout=layout.random)
{
    ## get preferred layout
    if(class(layout) == 'function')
    {
        # it's a function, let's caluclate it
        positions <- layout(x)
    } else if(class(layout) == 'matrix' && ncol(layout) %in% c(2, 3))
    {
        # it's a matrix, let's add as necessary
        positions <- layout 
    } else
    {
        # don't work with any other type
        stop('"layout" must be either a graph layout function or a two-column matrix')
    }
    
    return(positions %>% as.data.frame %>% rename(x=V1, y=V2) %>% mutate(z=0))
}