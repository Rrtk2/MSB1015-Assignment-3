#!/usr/bin/env nextflow



Channel
    .fromPath("./short.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
	.buffer(size:5,remainder:true)
    .set { molecules_ch }


process printSMILES {
	label 'small'
	
    input:
    each set from molecules_ch

	exec:
		for (item in set){
			println(item)
			wikidata = item[0]
			smiles = item[1]
			if(smiles != null){
				println "${wikidata} has SMILES: ${smiles}"
			}else{
				println "NA"
				}
		}
}


process parseSMILES {
	label 'small'
	
    input:
    each set from molecules_ch
	
	script:
	
	"""
	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

		for (item in set){
			println(item)
			wikidata = item[0]
			smiles = item[1]
			
			
			try {
				mol = cdk.fromSMILES(smiles)
				println(mol)
			} catch (Exception exc) {
				println "Error in " + wikidata + ": " + exc.message
			}
			  
		}
		
		
	
	"""
}
