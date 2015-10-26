bedGraphToWig <- function( bgfiles , span=1 ){
	outnames <- paste0 ( basename ( removeext ( bgfiles) ) , ".wig" )
	for(l in 1:length(bgfiles)){
		system(paste(
			"awk '{if($1 == c) { print $2,$4 } else { print \"variableStep chrom=\"$1",
			if(is.null(span)==FALSE){ paste0("span=",span) },
			"; print $2,$4 ; c=$1 } }' OFS='\t'",
			bgfiles[l] , ">" , outnames[l]
		))
	}
	return (outnames)
}
