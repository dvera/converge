# converge
CONVErsion tools in R for GEnomic data

---

## Overview

converge provides a set of R scripts and wrappers to convert between genomic file formats.

## Installation

Install devtools if not installed already:
```R
install.packages("devtools")
```

Then install conifur (convenience functions for R), then converge:
```R
devtools::install_github("dvera/conifur")
devtools::install_github("dvera/converge")
```

The following external dependencies should be installed and available in your $PATH:
- bedtools >= 2.25 (only for bam to bed conversion)
- samtools >= 1.0 (only for sam <-> bam conversion)
- kent source utils >= v323 (only for conversions to or from bigWig/bigBed)
- sra toolkit >= 2.4.5 (only for sra -> fastq conversion)

Other programs converge uses include several GNU programs that are typically preinstalled in most Linux distributions, including awk, grep, sort, and cut. For older linux distributions, you may need to install a more recent version of GNU core utilities that supports parallelization in `sort`.

Below is a table of function-by-function dependencies:

|function|from|to|external dependency|
|--------|----|---|------------------|
|bamToBed|bam|bed|bedtools|
|bamToSam|bam|sam|samtools|
|bedGraphToBed|bedGraph|bed|awk|
|bedGraphToBigWig|bedGraph|bigWig|kent source utils|
|bedGraphToWig|bedGraph|wig|awk|
|bedToBedGraph|bed|bedGraph|awk|
|bedToBigBed|bed|bigBed|kent source utils|
|bigBedToBed|bigBed|bed|kent source utils|
|bigWigToBedGraph|bigWig|bedGraph|kent source utils|
|bigWigToWig|bigWig|wig|kent source utils|
|gffToBedGraph|gff|bedGraph|cut,awk,grep|
|gffToBed|gff|bed|grep,awk|
|narrowPeakToBed|narrowPeak|bed|awk,sort|
|samToBam|sam|bam|samtools|
|sraToFastq|sra|fastq|sra toolkit|
|vcfToBedGraph|vcf|bedGraph|awk|
|vcfToBed|vcf|bed|grep,awk|
|wigToBigWig|wig|bigWig|kent source utils|

