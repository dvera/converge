wigToBigWig <-
function( datafiles,genomefile){
	outnames <- paste0(basename(removeext(datafiles)),".bw")
	for(l in 1:length(datafiles)){
		system(command=paste("wigToBigWig -clip", datafiles[l], genomefile, outnames[l] ))
	}
}
