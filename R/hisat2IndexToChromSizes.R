hisat2IndexToChromSizes <- function(prefix, outname="genome.chrom.sizes"){
  cmdString <- paste( "hisat2-inspect -s", prefix, " | grep \"^Sequence\" | awk '{ncol=NF; print $2,$NF}' OFS='\t' | sort -k1,1 > ",outname)
  res <- cmdRun(cmdString)
  return(outname)
}
