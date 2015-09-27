gff.2.bed2<-function(gff){
	gff<-gff[-which(gff$V3=="gene"),]
	gff<-gff[-which(gff$V3=="repeat_region"),]
	ic<-strsplit(gff$V9,";")

	trows<-which(gff$V3=="transcript")
	pic<-(lapply(1:length(ic), function(x) ic[[x]][grep("PARENT",ic[[x]])] ))
	iic<-(lapply(1:length(ic), function(x) ic[[x]][grep("ID",ic[[x]])] ))
	pic[trows] <- iic[trows]
	pic<-gsub("PARENT=gene:","",pic)
	pic<-gsub("PARENT=transcript:","",pic)
	pic<-gsub("ID=transcript:","",pic)
	pic<-gsub("PARENT=","",pic)
	gff$V9=pic
	genes=unique(pic)
	genetabs<-lapply(genes, function(x) gff[which(gff$V9==x),])
}