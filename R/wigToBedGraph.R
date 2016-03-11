wigToBedGraph <- function(wiggleFiles, threads=getOption("threads",1L) ){

  outnames <- paste0(basename(removeext(wiggleFiles)),".bg")

  cmdString <- paste(
    "awk \'BEGIN{FS=\"\t\"} {if($1~\"Step\"){split($0,chrom,\"chrom=\"); split(chrom[2],chrom2,\" \");split($0,winsize,\"span=\"); split(winsize[2],winsize2,\" \")} else if(NF==2){print chrom2[1],$1,$1+winsize2[1],$2}}\' OFS=\'\t\'",wiggleFiles,">",outnames
  )

  res <- cmdRun(cmdString, threads=threads)

  return(outnames)
  
}
