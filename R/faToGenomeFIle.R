faToGenomeFile <- function( fastaFile , outname="genome.chrom.sizes"){

  cmdString <- paste("awk '{if($0~\">\"){if(length(chrom)!=0){print chrom,clen}; chrom=$1; clen=0} else{clen+=length($0)}} END{print chrom,clen}' OFS='\t'",fastaFile,"| tr -d '>' >",outname)

  res <- cmdRun(cmdString)

  return(outname)


}
