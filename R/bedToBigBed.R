#' Convert bed files to bigBed files
#'
#' \code{bed2bbb} converts bed files to bigBed files with \code{bedToBigBed}.
#'
#' @param datafiles A character vector of paths to bed files.
#' @param chromsizes A string specifying the path of the file with chromosome sizes
#' @param threads A positive integer specifying how many files to process simultaneously.

bedToBigBed <-
function( datafiles , chromsizes, threads=getOption("threads",1L), searchable=TRUE ) {

	if(missing(chromsizes)){
		chromsizes<-getOption("chromsizes",NULL)
		if(is.null(chromsizes)){stop("must define file contain chromosome sizes")}
	}
	if(!file.exists(chromsizes)){
		stop("chromsizes file does not exist")
	}

	outnames<-paste0(basename(removeext(datafiles)),".bb")

	cmdString <- paste( "bedToBigBed", if(searchable){" -extraIndex=name"},datafiles, chromsizes , outnames )

	res <- cmdRun(cmdString,threads)

	return(outnames)
}
