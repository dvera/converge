sraToFastq <- function( srafiles, paired=FALSE, threads=getOption("threads",1L) ){
	arguments<-""

	outnames <- paste0(removeext(srafiles),".fastq")

	if(paired==TRUE){arguments<-"--split-3"}

	cmdString <- paste("fastq-dump",arguments,srafiles)

	res <- cmdRun(cmdString, threads=threads)

	return(outnames)
}
