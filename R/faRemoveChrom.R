faRemoveChroms <- function(pattern, fasta, partialMatch=TRUE){
  outname <- paste0(basename(removeext(fasta)),"_no",pattern,".fa")

  cmdString <- paste0("awk '{if($0~\">\"){if($0",if(partialMatch){"~"}else{"=="},"\"",pattern,"\"){x=0}else{x=1;print $0}}else if(x==1){print $0}}' ",fasta," > ",outname)

  res <- cmdRun(cmdString)

  return(outname)
  
}
