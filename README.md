# converge
CONVErsion tools in R for GEnomic data

---

## Overview

converge provides a set of R scripts and wrappers to convert between genomic file formats.

## Dependencies

The following dependencies should be installed and available in your $PATH:
- bedtools >= 2.25 
- samtools >= 1.0 (only for sam <-> bam conversion)
- kent source utils >= v323
- sra toolkit >= 2.4.5 (only for sra -> fastq conversion)

## List of functions

|function|
|--------|
|bamToBed|
|bamToSam|
|bedGraphToBed|
|bedGraphToBigWig|
|bedGraphToWig|
|bedToBedGraph|
|bedToBigBed|
|bigBedToBed|
|bigWigToBedGraph|
|bigWigToWig|
|gffToBedGraph|
|gffToBed|
|narrowPeakToBed|
|samToBam|
|sraToFastq|
|vcfToBedGraph|
|vcfToBed|
|wigToBigWig|

