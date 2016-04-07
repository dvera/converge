#' Convert bedGraph files to bigWig files
#'
#' \code{bg.2.bw} converts bedGraph files to bigWig files with \code{bedGraphToBigWig}.
#'
#' @param datafiles A character vector of paths to bedGraph files.
#' @param chromsizes A string specifying the path of the file with chromosome sizes
#' @param threads A positive integer specifying how many files to process simultaneously.

bedGraphToBigWig <-
function( datafiles , chromsizes, threads=getOption("threads",1L) ) {

	if(missing(chromsizes)){
		chromsizes<-getOption("chromsizes",NULL)
		if(is.null(chromsizes)){stop("must define file contain chromosome sizes")}
	}
	if(!file.exists(chromsizes)){
		stop("chromsizes file does not exist")
	}

	outnames<-paste0(basename(removeext(datafiles)),".bw")

	cmdString <- paste( "bedGraphToBigWig", datafiles, chromsizes , outnames )

	res <- cmdRun(cmdString,threads)

	return(outnames)
}
