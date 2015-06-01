#' @title sigma
#' @description Generates a sigma.js plot of a graph 
#' @details Generates a sigma.js plot of a graph.  Currently built to handle igraph graphs and gexf files.
#' @author Jared P. Lander
#' @export sigma
#' @param \dots Further arguments
#' @return A sigma.js plot
#' 
sigma <- function(x, ...)
{
    UseMethod('sigma')
}


#' @importFrom rgexf igraph.to.gexf
#' @rdname sigma
#' @author Jared P. Lander
#' @importFrom rgexf igraph.to.gexf
#' @importFrom dplyr rename mutate
#' @importFrom magrittr "%>%" "%<>%"
#' @export sigma.igraph
#' @param x An igraph object
#' @param layout Either an igraph layout function or a two column matrix specifying positions
#' @param node.size The default node.size for the nodes
#' @param node.color Default color for nodes
sigma.igraph <- function(x, layout=layout.random, node.size=75, node.color='blue', ...)
{
    ## get preferred layout
    if(class(layout) == 'function')
    {
        # it's a function, let's caluclate it
        positions <- layout(x)
    } else if(class(layout) == 'matrix' && ncol(layout) == 2)
    {
        # it's a matrix, let's add as necessary
        positions <- layout 
    } else
    {
        # don't work with any other type
        stop('"layout" must be either a graph layout function or a two-column matrix')
    }
    
    positions %<>% as.data.frame %>% rename(x=V1, y=V2) %>% mutate(z=0)
    
    # if size is't set in the graph, set to a default
    if(is.null(V(x)$size))
    {
        V(x)$size <- node.size
    }
    
    if(is.null(V(x)$color))
    {
        V(x)$color <- node.color
    }
    
    # convert graph to gexf
    data <- igraph.to.gexf(x, position=positions)
    
    sigma(data)
}


sigma.character <- function(x, ...)
{
    # read the gexf file
    data <- paste(readLines(gexf), collapse="\n")
}

#' @import htmlwidgets
#' @export sigma.gexf
sigma.gexf <- function(x, drawEdges = TRUE, drawNodes = TRUE, width = NULL, height = NULL)
{
  
  # read the gexf file
  #data <- paste(readLines(gexf), collapse="\n")
    data <- x$graph
  
  # create a list that contains the settings
  settings <- list(
    drawEdges = drawEdges,
    drawNodes = drawNodes
  )
  
  # pass the data and settings using 'x'
  x <- list(
    data = data,
    settings = settings
  )
  
  # create the widget
  htmlwidgets::createWidget("sigma", x, width = width, height = height)
}

#' @export
sigmaOutput <- function(outputId, width = "100%", height = "400px") {
  shinyWidgetOutput(outputId, "sigma", width, height, package = "sigma")
}

#' @export
renderSigma <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, sigmaOutput, env, quoted = TRUE)
}