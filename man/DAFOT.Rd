% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DAFOT_function.R
\name{DAFOT}
\alias{DAFOT}
\title{Detector of Active Flow on a Tree}
\usage{
DAFOT(P, Q, Tree, times, alpha)
}
\arguments{
\item{P}{A matrix. Compositional data of 1st group.}

\item{Q}{A matrix. Compositional data of 2nd group.}

\item{Tree}{A phylo class. Phylogenetic tree.}

\item{times}{A integer. The times of permutation test.}

\item{alpha}{A numeric. Significance level}
}
\value{
\code{DAFOT} returns an object of class \code{dafot}.

An object of class \code{dafot} is a list containing following components:
\itemize{
\item \code{Stat} the maximum of test statistics
\item \code{PValue} P value calculated from permutation test
\item \code{StatThre} the threshold for alpha level test
\item \code{ActiveEdge} the set of active edges
}
}
\description{
\code{DAFOT} is a funtion used to detect the difference between two group of compositional data.
}
\details{
This function is developed based on an optimal transport perspective. It can help detect the specific location of difference at a tree.
}
\examples{
library(ape)
Tree=rtree(100)
alphaP=c(rep(1,length(Tree$tip.label)),rep(0,Tree$Nnode))
alphaQ=c(rep(1,length(Tree$tip.label)),rep(0,Tree$Nnode))
DataPQ<-DataGenerating(100,100,alphaP,alphaQ,1000)
DAFOT(DataPQ$P,DataPQ$Q,Tree,100,0.05)

##must install metagenomeFeatures from Bioconductor before trying this example
\donttest{
library(metagenomeFeatures)
gg85 <- get_gg13.8_85MgDb()
gamma_16S <- mgDb_select(gg85, type = "all", keys = "Gammaproteobacteria", keytype = "Class")
Tree=gamma_16S$tree
Tree$tip.label<-1:length(Tree$tip.label)
alphaP=c(rep(1,length(Tree$tip.label)),rep(0,Tree$Nnode))
alphaQ=c(rep(1,length(Tree$tip.label)),rep(0,Tree$Nnode))
alphaQ[1]=alphaQ[1]+1
DataPQ<-DataGenerating(100,100,alphaP,alphaQ,1000)
DAFOT(DataPQ$P,DataPQ$Q,Tree,100,0.05)
}

}
\seealso{
\code{\link{SCalculation}}
}
\author{
Shulei Wang
}
