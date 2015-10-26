gffToBedGraph <-
function( gffs, extendbp=NULL, postsort=TRUE, threads=getOption("threads",1L) ){

	gffnames<-basename(removeext(gffs))
	outnames<-paste0(gffnames,".bg")

	cmdString <- paste(
		"cut -f 1,4,5,6",
		gff,
		if(!is.null(extendbp) & is.numeric(extendbp)){paste("| awk '{print $1,$2,$3+",extendbp,",$4}' OFS='\t'")},
		"| grep -P -v '^#'",
		">",outnames
	)

	res <- cmdRun(cmdString, threads=threads)
	if(postsort){bed.sort(outnames,threads=threads)}
	return(outnames)
}
