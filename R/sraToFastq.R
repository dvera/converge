sraToFastq <- function( srafiles, paired=FALSE ){
	arguments<-""
	outnames <- paste0(removeext(srafiles),".fastq")
	if(paired==TRUE){arguments<-"--split-3"}
	for(x in 1:length(srafiles)){
		system(paste("fastq-dump",arguments,srafiles[x]))
	}
	return(outnames)
}
