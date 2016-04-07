bigWigToBedGraph <- function( datafiles, threads=getOption("threads",1L) ){

	outnames<-paste0(basename(removeext(datafiles)),".bg")

	cmdString <- paste("bigWigToBedGraph", datafiles, outnames)

	res <- cmdRun(cmdString,threads=threads)

	return(outnames)

}
