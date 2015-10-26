bigWigToWig <-
function( datafiles,genomefile){
	for(l in 1:length(datafiles)){
		cat(basename(datafiles[l]),": converting to wiggle\n")
		outname<-paste(basename(removeext(datafiles[l])),".wig",sep="")
		system(command=paste("bigWigToWig", datafiles[l], outname))
		return(outname)
	}
}
