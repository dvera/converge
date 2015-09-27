#' Convert bed files to bigBed files
#'
#' \code{bed2bbb} converts bed files to bigBed files with \code{bedToBigBed}.
#'
#' @param datafiles A character vector of paths to bed files.
#' @param genomefile A string specifying the path of the file with chromosome sizes
#' @param threads A positive integer specifying how many files to process simultaneously.

bed.2.bb <-
function( datafiles , genomefile, threads=getOption("threads",1L) ) {

	outnames<-paste0(basename(removeext(datafiles)),".bb")

	cmdString <- paste( "bedToBigBed", datafiles, genomefile , outnames )

	res <- rage.run(cmdString,threads)

	return(outnames)
}
