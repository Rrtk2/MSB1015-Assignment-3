#!/usr/bin/env nextflow
@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.*;
import org.openscience.cdk.templates.*;
import org.openscience.cdk.tools.*;
import org.openscience.cdk.tools.manipulator.*;
import org.openscience.cdk.qsar.descriptors.molecular.*;
import org.openscience.cdk.qsar.result.*;

Channel
    .fromPath("./short.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
	.buffer(size:5,remainder:true)
    .set { molecules_ch }


process parseSMILES {
	label 'small'
	
    input:
    each set from molecules_ch
	
    exec:
	cdk = new CDKManager(".");
	descriptor = new XLogPDescriptor()	

		for (item in set){
			wikidata = item[0]
			smiles = item[1]
			
			
			try {
				mol = cdk.fromSMILES(smiles)
				println(mol)
				println ((DoubleResult)descriptor.calculate(mol.getAtomContainer()).value)
				println ""
 			} catch (Exception exc) {
				println "Error in " + wikidata + ": " + exc.message
			}
			  
		}


}

// mol.getatomcontainer -> 