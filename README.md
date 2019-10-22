# MSB1015-Assignment-3

[![GitHub License](https://img.shields.io/github/license/Rrtk2/MSB1015-Assignment-3)](https://github.com/Rrtk2/MSB1015-Assignment-3/blob/master/LICENSE.md) ![](https://img.shields.io/badge/Status-In_progress-green) [![GitHub Watches](https://img.shields.io/github/watchers/Rrtk2/MSB1015-Assignment-3.svg?style=social&label=Watch&maxAge=2592000)](https://github.com/Rrtk2/MSB1015-Assignment-3/watchers) 

#### Problem statement
Big data requires a lot of computing. Computer clusters and video cards can perform
many calculations in parallel. But that requires that your computing task actually
allows data to be processed in parallel. In this assignment you will use Nextflow to
calculate LogP values for molecules encoded as SMILES that you retrieved from
Wikidata.

#### What is this project about
This repository is the final product of assignment 3, requested by the course MSB1015 (Scientific Programming). 


#### Installation
This script is ran in [Nextflow](https://www.nextflow.io/), which is linux based. Many different methods can be used to run Linux in windows, such as a virutal machine. However, in this example the [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/faq) is used. During installation restarting might be reuired, please do so and follow the instructions given in the interface. To install WSL, java and nextflow on windows please follow these steps:

###### Ubuntu linux
1) Open windows powershell as administator
2) Run this line in powershell: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
3) Run this line in powershell: `Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsin`
4) Run this line in powershell: `Add-AppxPackage .\Ubuntu.appx`
5) When searching for "Ubuntu" in the search bar, an .exe file should be prompted. This program can be run to start linux.

###### java
6) Optional: Start Ubuntu Linux (step 5)
7) Run this line in terminal: `sudo apt-get update`
8) Run this line in terminal: `sudo apt-get install default-jdk`

###### Nextflow
9) Optional: Start Ubuntu Linux (step 5)
10) Run this line in terminal: `wget -qO- https://get.nextflow.io | bash`

#### Usage
When linux, java and nextflow can be used, download the [Linux files](/Linux_files/). 
Open terminal in linux, set the Linux files path to the active working directory using `cd /path`. For example `cd /mnt/d/Github/MSB1015-Assignment-3/Linux_files/`.

Afterward, run the following lines. These will assess the running time of using 1, 2 and 4 cpus.

`time /rick/nextflow run /runtime_test_1cpu.nf`

`time /rick/nextflow run /runtime_test_2cpu.nf`

`time /rick/nextflow run /runtime_test_4cpu.nf`


This will run the script and automatically indicate the time after every time command.


#### Results / expected output
When following the *usage* instructions, the expected output will be a summed runtime of 'user' and 'sys', representing the CPU runtime. The following results were obtained:
- 1cpu: 197.672s
- 2cpu: 192.406s
- 4cpu: 208.829s

#### Project structure
The query asks information from [Wikidata](http://wikidata.org) in a similar fashion the dedicated [Wikidata database query](https://query.wikidata.org/) works using the SPARQL language. Data on wikidata is published under the [Creative Commons Zero](https://creativecommons.org/share-your-work/public-domain/cc0) license, stating 'others may freely build upon, enhance and reuse the works for any purposes without restriction under copyright or database law'.

##### How is data shared, in what format, with what protocols?
Using the tool developed in this project, data is shared using the [wikidata-sdk](https://www.wikidata.org/w/api.php). 

##### Workflow
The following workflow is applied:

1) Data extraction from WikiData.

2) Data parsing using [the Chemistry Development Kit](https://cdk.github.io/cdk/) in Nextflow.

3) Extract logP value for every SMILES (around 150,000).

4) Re-run the steps 1, 2 and 3 with 1, 2 and 4 cores.

5) Compare running times.


#### Contact
ra.reijnders@student.maastrichtuniversity.nl


#### License and contributing guidelines
[License](/LICENSE.md) 

[Contributing guidelines](/CONTRIBUTING.md) 


#### Who is involved, and what are their roles.
RRtK2 (owner and contributor)


#### Status of project
In progress. Essentials are set up, big commits are likely.


#### Copyright and authors
All code and documents in the MSB1015-Assignment-3 folder was created by [these author(s)](/AUTHORS.md).
