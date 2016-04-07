bigWigToWig <- function( datafiles, threads=getOption("threads",1L) ){

	outnames<-paste0(basename(removeext(datafiles)),".wig")

	cmdString <- paste("bigWigToWig", datafiles, outnames)

	res <- cmdRun(cmdString,threads=threads)

	return(outnames)

}
