#' Convert bam files to bed files.
#'
#' \code{bam.2.bed} is a wrapper for bedtools bamtobed.
#'
#' @param bamFiles A character vector of paths to bam files.
#' @param paired A boolean indicating if bed intervals should be created with the inferred fragment derived from mate-pair alignments.
#' @param postsort A boolean indicating if the bed file should be sorted upon creation.
#' @param cigar A boolean indicating whether to use CIGAR strings as interval names.
#' @param threads A positive integer specifying how many bams to process simultaneously.

bam.2.bed <-
function( bamFiles , paired = FALSE , postsort=TRUE , cigar=FALSE , threads=getOption("threads",1L) , sortBuffer="1G" , sortThreads=NULL ){


	# define output file names
	outnames<-paste0(basename(removeext(bamFiles)),".bed")

	# specify "stop" column to use from bamtobed output
	if(paired){
		stopcol=3
	} else{
		stopcol=0
	}

	# create commands to be executed
	cmdString <- paste(
		"bedtools bamtobed",
		"-i",bamFiles,
		if(paired){"-bedpe"},
		if(cigar){"-cigar"},
		"| cut -f",
		paste(c(1,2,(3:6)+stopcol),collapse=","),
		if(postsort){ paste("| sort -T . -k1,1 -k2,2n -S",sortBuffer,if(!is.null(sortThreads)){ paste0( "--parallel=" , sortThreads )} )  },
		">",outnames
	)

	# run commands
	res <- rage.run(cmdString,threads)

	return(outnames)
}
