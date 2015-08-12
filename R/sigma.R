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
#' @export sigma.igraph
#' @export
#' @param x An igraph object
#' @param layout Either an igraph layout function or a two column matrix specifying positions
#' @param node.size The default node.size for the nodes
#' @param node.color Default color for nodes
sigma.igraph <- function(x, layout=layout.random, node.size=75, node.color='blue', ...)
{
    positions <- checkLayout(x, layout)
    
    # if size is't set in the graph, set to a default
    x <- setNodeSize(x, node.size)
    
    # if color is't set in the graph, set to a default
    x <- setNodeColor(x, node.color)
    
    # convert graph to gexf
    data <- igraph.to.gexf(x, position=positions)
    
    sigma(data)
}


sigma.character <- function(x, ...)
{
    # read the gexf file
    data <- read.gexf(x)
    
    sigma(data, ...)
}

#' @import htmlwidgets
#' @export sigma.gexf
#' @export
#' @rdname sigma
sigma.gexf <- function(x, drawEdges = TRUE, drawNodes = TRUE, width = NULL, height = NULL)
{
    # we just want the graph component
    # convert it to character because that's the best for piping to json
    data <- as.character(x$graph)
  
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