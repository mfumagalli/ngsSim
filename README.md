# ngsSim

Program to simulate NGS data for up to 3 populations. It allows for variablle error rates, sequencing depth, variability, base frequencies, individual inbreeding coefficients or _Fst_. It outputs true genotypes, reads and genotype likelihoods. 

### Installation

To download use:

    % git clone https://github.com/mfumagalli/ngsSim.git

To install these tools just run:

    % cd ngsSim
    % make
    % make test

Executables are built in the main directory. If you wish to clean all binaries and intermediate files:

    % make clean

### Usage

#### Example:

    % ./ngsSim/ngsSim -outfiles pop -npop 2 -nind 20 20 -nsites 100000 -depth 4 -pvar 0.10 -F 0.3 0.3

#### Parameters:
    -outfiles: Prefix for output files
    -npop: Number of populations. This MUST be set before -nind [1]
    -nind: Number of diploid individuals for each population [10]
    -nsites: Number of sites [500000]
    -errate: The sequencing error rate [0.0075]
    -depth: sequencing depth OR file with individual depths per line [5]
    -pvar: Probability that a site is variable in the population [0.015]
    -mfreq: Minimum population frequency [0.0005]
    -F: FST value of 1st and 2nd split [0.4 0.1] OR inbreeding value/file in case of 1 pop [0]
    -model: 0=fixed errate 1=variable errate (uniform distribution) [1]
    -simpleRand: boolean [1]
    -seed: Random number seed [0]
    -base_freq: Background allele frequencies for A,C,G,T [0.25 0.25 0.25 0.25]
    -expansion: Very naive method to simulate population expansion, boolean [0]


