vcf.2.fasta <- function( vcfFile , fastas ){

  cat("reading in vcf\n")
  vcf<-read.tsv(vcfFile)
  vcf[,3] <- tolower(vcf[,5])
  outnames<-paste0(basename(removeext(fastas)),"_",basename(removeext(vcfFile)),".fa")

  for(d in 1:length(fastas)){


    cat("reading in fasta\n")
    f<-read.tsv(fastas[d])


    hdr<-f[1,1]
    chr<-gsub(">","",hdr)
    v<-vcf[which(vcf[,1]==chr),]
    numsnps=nrow(v)

    l<-floor(v[,2]/50)+1
    r<-v[,2]%%50
    r[which(r==0)]<-50

    cat("formatting sequences\n")
    f<-lapply(lapply(f[-1,1],strsplit,split=""),unlist)

    cat("changing alleles\n")
    for(i in 1:numsnps){
      cat(i,"; faRef=",f[[l[i]]][r[i]],";vcRef=",v[i,4],";vcAlt=",v[i,5],"\n")
      #if(toupper(f[[l[i]]][r[i]] != v[i,4])) {stop("mismatching reference sequences!")}
      if( f[[l[i]]][r[i]] == v[i,4] ){
        f[[l[i]]][r[i]] <- v[i,5]
      } else{
        f[[l[i]]][r[i]] <- v[i,3]
      }
    }

    cat("formatting sequences\n")
    f<-unlist(lapply(f,paste,collapse=""))
    f<-c(hdr,f)
    f<-data.frame(f)

    cat("saving new fasta\n")

    write.tsv(f,file=outnames[d])

  }
  return(outnames)
}
