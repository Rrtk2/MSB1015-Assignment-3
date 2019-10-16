#!/usr/bin/env nextflow
// Import dependencies
@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.*;
import org.openscience.cdk.templates.*;
import org.openscience.cdk.tools.*;
import org.openscience.cdk.tools.manipulator.*;
import org.openscience.cdk.qsar.descriptors.molecular.*;
import org.openscience.cdk.qsar.result.*;

// Javadoc documentationfor machine readable code
/** Parses a SMILES string for a wikidata item into
* a IatomContainer. Throws an exception when the SMILES is
* invalid. This script is used to assesses the runtime
* of parsing 160k molecules, comparing amount of cores used.
* @param smiles the SMILES string that is to be parsed
* 
*/

// Define input. 'long.tsv' is obtained by WikiData query.
Channel
    .fromPath("./long.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
	.buffer(size:40000,remainder:true) //TOTAL 160000 40000
    .set { molecules_ch }

// Create a process which takes the SMILES then parses and converts them into LogP values.
process parseSMILES {
	// Define amount of cores
	cpus 4
	maxForks 4
	
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
				
				Pval = ((DoubleResult)descriptor.calculate(mol.getAtomContainer()).value)
				//println mol
				//println Pval
				//println ""
 			} catch (Exception exc) {
				//println "Error in " + wikidata + ": " + exc.message
			}
			  
		}


}