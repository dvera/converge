#' Convert bam files to sam files
#'
#' \code{bam.2.sam} is a simple wrapper for samtools view to create sam files from bam files.
#'
#' @param bamFiles A character vector of paths to bam files.
#' @param threads A positive integer specifying how many bams to process simultaneously.


bamToSam <-
function( bamFiles , threads=getOption("threads",1L) ){

	outnames <- paste0(basename(removeext(bamFiles)),".sam")

	cmdString <- paste("samtools view",bamFiles,">",outnames )

	res <- cmdRun(cmdString,threads)

	return(outnames)

}
