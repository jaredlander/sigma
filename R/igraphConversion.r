#' @title igraphToJson
#' @description Convert an igraph object to json
#' @details Converts an igraph object to json with an array holding an array each for nodes and edges.
#' @author Jared P. Lander
#' @aliases igraphToJson
#' @export igraphToJson
#' @importFrom jsonlite toJSON
#' @param g An igraph object
#' @return A string of json text representing the igraph object as an array holding an array each for nodes and edges.
#' @examples 
#' data(flightGraph)
#' igraphToJson(flightGraph)
#' 
igraphToJson <- function(g)
{
    # convert graph into a list of data.frames
    gdata<- prepIgraphConversion(g)
    
    return(toJSON(gdata))
}

prepIgraphConversion <- function(g)
{
    # make graph into a list of data.frames
    gdata <- get.data.frame(g, what = "both")
    
    # rename vertices to nodes
    names(gdata)[1] <- 'nodes'
    
    # add a column to nodes to hold the IDs
    gdata$nodes %<>% mutate(id=as.integer(as.factor(name))) %>% rename(label=name)
    # extract node info for color, position, size, shape and color
    
    ## replace from and to in edges with their IDs
    # first create a named vector of ids
    nodesID <- gdata$nodes$id
    names(nodesID) <- gdata$nodes$label
    # now in the edges create the id columns and an edge id
    gdata$edges %<>% mutate(id=sprintf('e%s', 1:n()), source=nodesID[from], target=nodesID[to]) %>%
        # and drop the old one
        select(-from, -to)
    
    return(gdata)
}
hike <- prepIgraphForGexf(flightGraph)


#' @title igraphToGexf
#' @description Convert an igraph object to json
#' @details Converts an igraph object to json with an array holding an array each for nodes and edges.
#' @author Jared P. Lander
#' @aliases igraphToGexf
#' @export igraphToGexf
#' @importFrom jsonlite toJSON
#' @param g An igraph object
#' @return A string of json text representing the igraph object as an array holding an array each for nodes and edges.
#' @examples 
#' data(flightGraph)
#' igraphToGexf(flightGraph)
#' 
igraphToGexf <- function(g)
{
    # convert graph into a list of data.frames
    gdata<- prepIgraphConversion(g)
}
