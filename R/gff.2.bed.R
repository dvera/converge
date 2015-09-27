gff.2.bed <-
function( gff, extendbp=60, strand=TRUE ){
	library(gtools)
	cat("converting",gff,"\n")
	gffname<-basename(removeext(gff))
	outname<-paste(gffname,".bed",sep="")
	system(paste0("grep -v '#' ",gff," | awk 'BEGIN{i=0};{i+=1;print $1,$4,$5,\"",gffname,"_\"i,1,$7}' OFS='\t' > ",outname))
	return(outname)
}
