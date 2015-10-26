#' Convert bed files to bedGraph files
#'
#' \code{bed2bg} converts bed files to bedGraph files by printing bed columns 1,2,3,5.
#'
#' @param bedfiles A character vector of paths to bed files.
#' @param threads A positive integer specifying how many files to process simultaneously.

bedToBedGraph <-
function( bedfiles, sizeScore=FALSE , threads=getOption("threads",1L) ){

	outnames<-paste0(basename(removeext(bedfiles)),".bg")

	if(any(file.exists(outnames))){stop("files exist already")}

	if(sizeScore){
		cmdString <- paste( "awk '{print $1,$2,$3,$3-$2}' OFS='\t' ",bedfiles,">",outnames )
	} else{
		cmdString <- paste( "awk '{print $1,$2,$3,$5}' OFS='\t' ",bedfiles,">",outnames )
	}
	cmdRun(cmdString,threads)

	return(outnames)
}
