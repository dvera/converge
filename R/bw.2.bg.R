bw.2.bg <-
function( datafiles,genomefile){
	for(l in 1:length(datafiles)){
		cat(basename(datafiles[l]),": converting to bedGraph\n")
		outname<-paste(basename(removeext(datafiles[l])),".bg",sep="")
		system(command=paste("bigWigToBedGraph", datafiles[l], outname))
		return(outname)
	}
}
