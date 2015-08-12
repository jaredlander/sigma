<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/jaredlander/sigma.svg?branch=master)](https://travis-ci.org/jaredlander/sigma)

### sigma

An R package with an interface to the [sigma.js](http://sigmajs.org) graph visualization library.

This package is intended as a simple demonstration of building R bindings to JavaScript libraries using the [htmlwidgets](https://github.com/ramnathv/htmlwidgets) framework.

#### Installation

You can install the **sigma** package from GitHub as follows:

``` r
devtools::install_github("jaredlander/sigma")
```

#### Examples

``` r
library(sigma)
library(igraph)
```

First a simple example with four nodes.

``` r
simple <- data.frame(from=c('a', 'b', 'c', 'a'), to=c('b', 'c', 'a', 'd'), stringsAsFactors=FALSE)
g <- graph.data.frame(simple, directed=FALSE)
sigma(g)
```

Now an example using the flights data

``` r
data(flightGraph)
sigma(flightGraph)
sigma(flightGraph, layout=layout_with_fr)
```

    The MIT License (MIT)

    Copyright (C) 2013-2014, Alexis Jacomy, http://sigmajs.org
    Copyright (C) 2014, JJ Allaire

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
