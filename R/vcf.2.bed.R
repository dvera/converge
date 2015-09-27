vcf.2.bed <- function( vcfFiles ){

	outnames <- paste0(basename(removeext(vcfFiles)),".bed")

  cmdString<-paste(
		"grep -Pv '^#'",
		vcfFiles,
		"| awk '{print $1,$2-1,$2}' OFS='\t'",
		">",
		outnames
	)

	for(i in 1:length(vcfFiles)){
		print(cmdString[i])
		system(cmdString[i])
	}

	return(outnames)
}
