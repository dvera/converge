deg.2.heatmap <- function( finaltable , genelists , outdir , plotcolors=colorRampPalette(c("black","green")) , cores=10 , colorscale=c(0,4) ){

  library(readr)

  finaltable <- data.matrix(finaltable)

  numlists <- length(genelists)

  lists <- mclapply( genelists, read_tsv, col_names=FALSE , mc.cores=cores)

  genes <- lapply(1:numlists,function(x){

    if(ncol(lists[[x]])>2){
      unique(sort(lists[[x]][ which(grepl("HUMAN|",lists[[x]][,11] ) ),3]))
    } else{
      unlist(as.vector(lists[[x]]))
    }

  })

  generows <- lapply(1:numlists, function(x){

    which(row.names(finaltable) %in% genes[[x]])

  })

  dir.create(outdir)

  finaltable[which(finaltable[,7]>colorscale[2]),7] <- colorscale[2]
  finaltable[which(finaltable[,8]>colorscale[2]),8] <- colorscale[2]

  for(i in 1:numlists){

    subtable <- finaltable[generows[[i]],]

    #heatmap.2(finaltable[genesets[[i]],c(7,8)],trace="none",col=colorRampPalette(c("black","green")),key=F,breaks=seq(colorscale[1],colorscale[2],0.2),Colv=FALSE)
    png(width=250,height=1280,file=paste0(basename((gsub(" ","-",genelists[i]))),"_log10.png"))

    #par(mar=c(5,5,5,10),xpd=TRUE)
    image(t(subtable[order(subtable[,9]),c(7,8)]),col=plotcolors(20),breaks=seq(0,4,0.2),axes=F)
    #text(x=1.505,y=seq(0,1,length=nrow(subtable)),labels=row.names(subtable)[order(subtable[,9])] , pos=4, cex=0.7)
    mtext(row.names(subtable)[order(subtable[,9])] , side=4 , at=seq(0,1,length=nrow(subtable)), cex=0.7,las=1, adj=0)
    mtext(c("untreated","treated") , at=c(0.25,0.75), side=1 , las=1)


    dev.off()

  }







}
