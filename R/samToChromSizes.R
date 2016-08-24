samToChromSizes <- function(samFile, outname="genome.chrom.sizes", maxChroms=10000){
  cmdString <- paste( "samtools view -h",samFile,"| head -n ",maxChroms," | grep '^@SQ' | cut -f 2,3 | sed 's/SN://g' | sed 's/LN://g' | sort -k1,1 > ",outname)
  res <- cmdRun(cmdString)
  return(outname)
}
