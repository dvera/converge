#' Convert bed files to bedGraph files
#'
#' \code{bed2bg} converts bed files to bedGraph files by printing bed columns 1,2,3,5.
#'
#' @param bedfiles A character vector of paths to bed files.
#' @param threads A positive integer specifying how many files to process simultaneously.

bed.2.bg <-
function( bedfiles, threads=getOption("threads",1L) ){

	outnames<-paste0(basename(removeext(bedfiles)),".bg")

	if(any(file.exists(outnames))){stop("files exist already")}

	cmdString <- paste( "awk '{print $1,$2,$3,$5}' OFS='\t' ",bedfiles,">",outnames )

	rage.run(cmdString,threads)

	return(outnames)
}
