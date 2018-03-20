
# ngsSim

Program to simulate NGS data for up to 3 populations. It allows for variable error rates, sequencing depth, variability, base frequencies, individual inbreeding coefficients or _Fst_. It outputs true genotypes, reads and genotype likelihoods. 

It appears that the newest version of ANGSD does not entirely support ngsSim output anymore, unless you specify the reference sequence using -fai option.
A valid alternative to simulate NGS data that can be then processed with ANGSD and ngsTools is [MsToGlf](http://popgen.dk/angsd/index.php/MsToGlf).

### Installation

To install the entire package just download the source code:

    % git clone https://github.com/mfumagalli/ngsSim.git

and run:

    % cd ngsSim
    % make

To run the tests:

    % make test

Executables are built in the main directory. If you wish to clean all binaries and intermediate files:

    % make clean

### Usage

#### Example:

    % ./ngsSim/ngsSim -outfiles pop -npop 2 -nind 20 20 -nsites 100000 -depth 4 -pvar 0.10 -F 0.3 0.3

#### Parameters:
* `-outfiles CHAR`: Prefix for output files
* `-npop INT`: Number of populations. This MUST be set before -nind [1]
* `-nind INT`: Number of diploid individuals for each population [10]
* `-nsites INT`: Number of sites [500000]
* `-errate FLOAT`: The sequencing error rate [0.0075]
* `-depth INT or FILE`: sequencing depth OR file with individual depths per line [5]
* `-pvar FLOAT`: Probability that a site is variable in the population [0.015]
* `-mfreq FLOAT`: Minimum population frequency [0.0005]
* `-F FLOAT [FLOAT]`: FST value of 1st and 2nd split [0.4 0.1] OR inbreeding value/file in case of 1 pop [0], if 2 pops just write twice the same unique FST value (e.g. 0.2 0.2)
* `-model INT`: 0=fixed errate 1=variable errate (uniform distribution) [1]
* `-simpleRand INT`: boolean [1]
* `-seed INT`: Random number seed [0]
* `-base_freq FLOAT FLOAT FLOAT FLOAT`: Background allele frequencies for A,C,G,T [0.25 0.25 0.25 0.25]
* `-expansion INT`: Very naive method to simulate population expansion, boolean [0]

Further examples can be found [here](https://github.com/mfumagalli/ngsSim/tree/master/examples).
