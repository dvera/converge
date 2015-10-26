#' Convert bedGraph files to bigWig files
#'
#' \code{bg.2.bw} converts bedGraph files to bigWig files with \code{bedGraphToBigWig}.
#'
#' @param datafiles A character vector of paths to bedGraph files.
#' @param genomefile A string specifying the path of the file with chromosome sizes
#' @param threads A positive integer specifying how many files to process simultaneously.

bedGraphToBigWig <-
function( datafiles , genomefile, threads=getOption("threads",1L) ) {

	outnames<-paste0(basename(removeext(datafiles)),".bw")

	cmdString <- paste( "bedGraphToBigWig", datafiles, genomefile , outnames )

	res <- cmdRun(cmdString,threads)

	return(outnames)
}
