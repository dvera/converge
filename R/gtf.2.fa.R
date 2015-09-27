gtf.2.fa <- function( gtf , fasta , outname=NULL , simplename=TRUE){

  if(is.null(outname)){outname=paste0(basename(removeext(gtf)),".fa")}

  cmdString <- paste(
    "gtf_to_fasta",
    gtf,
    fasta,
    if(simplename){paste( "/dev/stdout | awk '{if($0 ~ \">\"){print \">\" $2} else{print $1}}' >" )},
    outname
  )

  print(cmdString)
  system(cmdString)
  return(outname)

}
