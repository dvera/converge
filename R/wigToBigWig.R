wigToBigWig <- function( datafiles, chromsizes, threads=getOption("threads",1L) ){

	if(missing(chromsizes)){
		chromsizes<-getOption("chromsizes",NULL)
		if(is.null(chromsizes)){stop("must define file contain chromosome sizes")}
	}
	if(!file.exists(chromsizes)){
		stop("chromsizes file does not exist")
	}

	outnames <- paste0(basename(removeext(datafiles)),".bw")

	cmdString <- paste("wigToBigWig -clip", datafiles, chromsizes, outnames )

	res <- cmdRun(cmdString, threads=threads)

}
