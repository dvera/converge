#' Convert bedGraph files to bed files
#'
#' \code{bed2bed} converts bedGraph files to bed files by printing bed columns 1,2,3,5.
#'
#' @param bedfiles A character vector of paths to bed files.
#' @param threads A positive integer specifying how many files to process simultaneously.

bg.2.bed <-
function( bgfiles, threads=getOption("threads",1L) ){

	outnames<-paste0(basename(removeext(bgfiles)),".bed")

	if(any(file.exists(outnames))){stop("files exist already")}

	cmdString <- paste0( "awk '{print $1,$2,$3,NR,int($4)}' OFS='\t' ",bgfiles," > ",outnames )

	rage.run(cmdString,threads)

	return(outnames)
}
