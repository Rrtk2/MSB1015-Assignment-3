@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
import net.bioclipse.managers.CDKManager

filename = "./short.tsv"

def cdk = new CDKManager(".");

println "file: " + filename
new File(filename).eachLine() { line ->
  fields = line.split("\t")
  try {
    mol = cdk.fromSMILES(fields[1])
	println(mol)
  } catch (Exception exc) {
    println "Error in " + fields[0] + ": " + exc.message
  }
}
