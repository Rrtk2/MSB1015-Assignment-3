# MSB1015-Assignment-3

[![GitHub License](https://img.shields.io/github/license/Rrtk2/MSB1015-Assignment-3)](https://github.com/Rrtk2/MSB1015-Assignment-3/blob/master/LICENSE.md) ![](https://img.shields.io/badge/Status-Final-brightgreen) [![GitHub Watches](https://img.shields.io/github/watchers/Rrtk2/MSB1015-Assignment-3.svg?style=social&label=Watch&maxAge=2592000)](https://github.com/Rrtk2/MSB1015-Assignment-3/watchers) 

#### Problem statement
Big data requires a lot of computing. Computer clusters and video cards can perform
many calculations in parallel. But that requires that your computing task actually
allows data to be processed in parallel. In this assignment you will use Nextflow to
calculate LogP values for molecules encoded as SMILES that you retrieved from
Wikidata.

#### What is this project about
This repository is the final product of assignment 3, requested by the course MSB1015 (Scientific Programming). 

#### Project structure
The query asks information from [Wikidata](http://wikidata.org) in a similar fashion the dedicated [Wikidata database query](https://query.wikidata.org/) works using the SPARQL language. Data on Wikidata is published under the [Creative Commons Zero](https://creativecommons.org/share-your-work/public-domain/cc0) license, stating 'others may freely build upon, enhance and reuse the works for any purposes without restriction under copyright or database law'.
This information is processed in [Nextflow](https://www.nextflow.io/) (released under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0) license, see the [paper](https://www.nature.com/articles/nbt.3820)). Data is parsed using the [the Chemistry Development Kit](https://cdk.github.io/index.html) (released under the [GNU Lesser General Public License](https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html))

##### How is data shared, in what format, with what protocols?
Using the tool developed in this project, data is shared using the [wikidata-sdk](https://www.wikidata.org/w/api.php). 

##### Workflow
The following workflow is applied:

1) Data extraction from WikiData.

2) Data parsing using [the Chemistry Development Kit](https://cdk.github.io/index.html) in Nextflow.

3) Extract logP value for every SMILES (around 150,000).

4) Re-run the steps 1, 2 and 3 with 1, 2 and 4 cores.

5) Compare running times.

#### Installation
This script is ran in [Nextflow](https://www.nextflow.io/), which is Linux based. Many different methods can be used to run Linux in Windows, such as a virtual machine. However, in this example the [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/Windows/wsl/faq) is used. During installation restarting might be required, please do so and follow the instructions given in the interface. To install WSL, Java and Nextflow on Windows please follow these steps 1 to 12. If these are installed then start at 13.

###### Ubuntu Linux
1) Open Windows PowerShell as administrator
2) Run this line in PowerShell: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
3) Run this line in PowerShell: `Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsin`
4) Run this line in PowerShell: `Add-AppxPackage .\Ubuntu.appx`
5) When searching for "Ubuntu" in the search bar, an .exe file should be prompted. This program can be run to start Linux, on first run the OS will be installed.

###### Java
6) Optional: Start Ubuntu Linux (step 5)
7) Run this line in terminal: `sudo apt-get update`
8) Run this line in terminal: `sudo apt-get install default-jdk`

###### Nextflow
9) Optional: Start Ubuntu Linux (step 5)
10) Create folder 'NxtFl' in /home/ folder by running this line in terminal `mkdir /home/NxtFl`
11) go to folder by running this line in terminal `cd /home/NxtFl`
12) Run this line in terminal: `wget -qO- https://get.nextflow.io | bash`

###### Clone GitHub repository
13) Create a directory for the GitHub repository by running this line in terminal: `mkdir /home/GitRepo`
14) Clone the GitHub repository into the created folder by running this line in terminal: `git clone https://github.com/Rrtk2/MSB1015-Assignment-3 /home/GitRepo` 

#### Usage
When the installation is completed, Nextflow and the GitHub repository will be in a specific location. If deviated from this, change the code below accordingly.

If no changes are required, run the following lines. These will assess the running time of using 1, 2 and 4 cpus. These scripts will use the supplied [long.tsv](https://github.com/Rrtk2/MSB1015-Assignment-3/blob/master/Linux_files/long.tsv), which is a tsv file of the result of a [query call](https://query.wikidata.org/) using this specific [call](https://github.com/Rrtk2/MSB1015-Assignment-3/blob/master/Linux_files/getSMILES.rq).

`time /home/NxtFl/nextflow run /home/GitRepo/Linux_files/runtime_test_1cpu.nf`

`time /home/NxtFl/nextflow run /home/GitRepo/Linux_files/runtime_test_2cpu.nf`

`time /home/NxtFl/nextflow run /home/GitRepo/Linux_files/runtime_test_4cpu.nf`

This will run the script and automatically indicate the time after every time command.


#### Results / expected output
When following the *usage* instructions, the expected output will be a summed runtime of 'user' and 'sys', representing the CPU runtime. The script will not prompt the logP values as printing to the terminal takes more time than the actual operation of extracting the logP value (which is performed in parallel). If this is required, these lines can be uncommented in the actual scripts. 

The following results were obtained:
- 1cpu: 197.672s
- 2cpu: 192.406s
- 4cpu: 208.829s

#### Contact
ra.reijnders@student.maastrichtuniversity.nl


#### License and contributing guidelines
[License](/LICENSE.md) 

[Contributing guidelines](/CONTRIBUTING.md) 


#### Who is involved, and what are their roles.
RRtK2 (owner and contributor)


#### Status of project
Final. No edits expected, possible patches and bugfixes only.


#### Copyright and authors
All code and documents in the MSB1015-Assignment-3 folder was created by [these author(s)](/AUTHORS.md).
