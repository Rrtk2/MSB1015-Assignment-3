#!/usr/bin/env nextflow



Channel
    .fromPath("./long.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
    .set { molecules_ch }


process printSMILES {
	label 'big'
	
    input:
    set wikidata, smiles from molecules_ch
	
    exec:
      println "${wikidata} has SMILES: ${smiles}"
}
