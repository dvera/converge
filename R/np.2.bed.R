np.2.bed <- function ( narrowPeaks , strand = TRUE ){

	outnames <- paste0( basename ( removeext ( narrowPeaks ) ) , ".bed" )

	for(i in 1:length(narrowPeaks)){
		np <- read.tsv ( narrowPeaks[i] )
		if(ncol(np)<6 & strand){ strand = FALSE }
		np[which(np[,5] > 1000),5] <- 1000
		bed <- cbind ( np[,1:4] , round( np[,5] ) , if(strand){np[,6]} else{"+"} , np[,2] + np[,10] , np[,2] + np[,10] + 1 , stringsAsFactors = FALSE )
		write.tsv( bed , file = outnames[i] )
	}

	return(outnames)
}
