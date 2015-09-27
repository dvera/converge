#' Convert sam files to bam files
#'
#' \code{sam.2.bam} is a simple wrapper for samtools view to create bam files from sam files.
#'
#' @param samFiles A character vector of paths to sam files.
#' @param minQual A positive integer specifying the minimum alignment quality a read needs to be written.
#' @param threads A positive integer specifying how many bams to process simultaneously.


sam.2.bam <-
function( samFiles , minQual=NULL , threads=getOption("threads",1L) ){
	res <- samtools.view(samFiles, threads=threads, minQual=minQual, outputBam=TRUE )
	return(res)
}
