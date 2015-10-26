#' Convert bigBed files to bed files
#'
#' \code{bb2bed} bb2bed converts bigBed files to bed files with \code{bigBedToBed}.
#'
#' @param datafiles A character vector of paths to bigBed files.
#' @param threads A positive integer specifying how many bams to process simultaneously.

bigBedToBed <-
function( datafiles , threads=getOption("threads",1L) ){

	outnames<-paste0(basename(removeext(datafiles)),".bed")

	cmdString <- paste( paste("bigBedToBed", datafiles, outnames ) )

	res <- cmdRun( cmdString, threads )

	return(outnames)

}
