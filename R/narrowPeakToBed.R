narrowPeakToBed <- function ( narrowPeaks , recenter=FALSE , strand = TRUE , recenteredSize = 100 , threads=getOption("threads",1L) ){

	# make sure input files aren't beds which would cause clobbering
	if(any(file_ext(narrowPeaks)=="bed"){stop("at least one input file is a bed file")}

	numfiles <- length(narrowPeaks)

	# define output names
	if(recenter){
		outnames <- paste0( basename ( removeext ( narrowPeaks ) ) , "_recentered.bed" )
	} else{
		outnames <- paste0( basename ( removeext ( narrowPeaks ) ) , ".bed" )
	}

	# create commands to check for peak coordinates
	cmdString<-paste("head",narrowPeaks,"| awk '{print $10}'")

	# get peak info for first 10 lines
	res <- as.numeric(unlist(cmdRun(cmdString,lines=T)))

	# find files with no peak info
	nopeaks <- which(res<0)
	arenopeaks <- length(nopeaks)>0

	# if there are files without peak info and recentering is requested
	if(arenopeaks & recenter){
		if(getOption("verbose")){
			cat("WARNING: no peak coordinate detected in the following files, treating as bed:",paste(narrowPeaks[nopeaks],collapse=" "),"\n")
		}
	}

	halfsize <- round(recenteredSize/2)

	midString <- rep("",numfiles)

	if(arenopeaks){
		midString[nopeaks] <- "$10=int(($3-$2)/2);"
	}

	if(recenter){
		cmdString <- paste("awk '{",midstring,"print $1,$2+$10-",halfsize,",$2+$10+",halfsize,",$4,int($5),$6,$2+$10,$2+$10+1}' OFS='\t' ",narrowPeaks," | sort -k1,1 -k2,2n > ",outnames)
	} else{
		cmdString <- paste("awk '{",midstring,"print $1,$2,$3,$4,int($5),$6,$2+$10,$2+$10+1}' OFS='\t' ",narrowPeaks," | sort -k1,1 -k2,2n > ",outnames)
	}

	res <- cmdRun(cmdString)

	return(outnames)
}
