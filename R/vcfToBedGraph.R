vcfToBedGraph <- function( vcf , score = "AF1" , include=NULL , exclude=NULL ){

	outname <- paste0(basename(removeext(vcf)),"_",score,".bg")

	print(paste0(
		"bcftools query -f '%CHROM\t%POS\t%",score,"\n' ",
		if(is.null(include) == FALSE){ paste("-i '",include,"' ")},
		if(is.null(exclude) == FALSE){ paste("-e '",exclude,"' ")},
		vcf,
		" | awk '{print $1,$2,$2+1,$3}' OFS='\t' > ",
		outname
	))

	system(paste0(
		"bcftools query -f '%CHROM\t%POS\t%",score,"\n' ",
		if(is.null(include) == FALSE){ paste("-i '",include,"' ")},
		if(is.null(exclude) == FALSE){ paste("-e '",exclude,"' ")},
		vcf,
		" | awk '{print $1,$2,$2+1,$3}' OFS='\t' > ",
		outname
	))
	return(outname)
}
