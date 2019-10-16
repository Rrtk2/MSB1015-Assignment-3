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


#### Usage
This script is ran in [Nextflow](https://www.nextflow.io/), which is linux based. To install linux, java and nextflow on windows please see <this site>. 

When linux, java and nextflow can be used, download the [Linux files](/Linux_files/). 

Open terminal in linux, and enter the following lines of code:

`cd /mnt/d/Github/MSB1015-Assignment-3/Startup_files`

then

`/rick/nextflow run /mnt/d/Github/MSB1015-Assignment-3/Linux_files/runtime_test.nf`

This will run the script and automatically indicate the time.


#### Expected output
When following the *usage* instructions, the expected output will be a runtime with specific settings.  

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
