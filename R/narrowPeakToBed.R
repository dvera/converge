narrowPeakToBed <- function ( narrowPeaks , recenter=FALSE , strand = TRUE , threads=getOption("threads",1L) ){

	outnames <- paste0( basename ( removeext ( narrowPeaks ) ) , "_recentered.bed" )

	dump <- mclapply(1:length(narrowPeaks), function(i){
		# np <- read.tsv ( narrowPeaks[i] )
		# if(ncol(np)<6 & strand){ strand = FALSE }
		# np[which(np[,5] > 1000),5] <- 1000
		# bed <- cbind ( np[,1:4] , round( np[,5] ) , if(strand){np[,6]} else{"+"} , np[,2] + np[,10] , np[,2] + np[,10] + 1 , stringsAsFactors = FALSE )
		# write.tsv( bed , file = outnames[i] )
		#


		headlines.call<-pipe(paste("head",narrowPeaks[i],"| awk '{print $10}'"),open="r")
		headlines<-as.numeric(readLines(headlines.call))
		close(headlines.call)

		if(length(which(headlines %in% (-1)>0))){
			if(getOption("verbose")){ cat("bad peak coordinate detected in narrowPeak file, treating as bed\n") }
			outnames[i] <- narrowPeaks[i]
		} else{
			if(recenter){
				if(getOption("verbose")){ cat("peak coordinates detected in narrowPeak file, recentering bed features\n") }
				cmdString <- paste("awk '{$2=$2+$10;$3=$2+1;print}' OFS='\t' ",narrowPeaks[i]," | sort -k1,1 -k2,2n > ",outnames[i],sep="")
			} else{
				cmdString <- paste("awk '{if($5>1000){$5=1000}; print $1,$2,$3,$4,$5,$6,$2+$10,$2+$10+1}' OFS='\t' ",narrowPeaks[i]," | sort -k1,1 -k2,2n > ",outnames[i],sep="")
			}
			res <- cmdRun(cmdString)
		}



	}, mc.cores=threads,mc.preschedule=FALSE)

	return(outnames)
}
