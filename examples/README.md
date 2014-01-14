# Data simulation

`ngsSim` simulates data under a constant population size model. A simple model that mimics the effects of population expansion is implemented using the option `-expansion 1`.

### Settings:

* 3 populations, where the closest populations (2nd and 3rd) differ from an average FST of 0.1 and these differ from the other one from an average FST of 0.3;
* 10, 8, 6 individuals at population 1, 2, and 3, respectively;
* 10,000 independent sites, all polymorphic in the population (for ease of computational time);
* 4X mean sequencing depth;
* 0.01 mean sequencing error rate, variable across sites;
* minimum allele frequency in the population of 0.05 
* no inbreeding
* output files with prefix testA.

### Command:
Under these conditions, we simulate NGS data with this command line:

    ./ngsSim -npop 3 -nind 10 8 6 -nsites 10000 -pvar 1 -depth 4 -errate 0.01 -mfreq 0.005 -F 0.3 0.1 -model 1 -seed 12345 -outfiles testA

### Output files:
This will generate several files for the whole population (testA), as well as for each population (testA1, testA2, testA3). Here is a description of each file:

* `.geno`: true genotypes; each line is a site and each tab-separated column is an individual; genotypes are coded as 0-3, where 0 is the ancestral state;
* `.reads.txt`: sequencing reads counts; first 24 rows (with 24 number of individuals) represent the counts of reads from base coded as 0 (1st column) to base coded as 3 (4th column), and so on for each site (matrix 24000x4);
* `.frq`: true Site Frequency Spectrum, tab-separated, from 0 to 48 frequencies of derived alleles;
* `.args`: arguments used in the simulation;
* `.par`: simulation settings at each site (on rows): drawn ancestral population allele frequency, inbreeding coefficient, first value of FST, second value of FST;
* `.seq.gz`: sequencing reads in ACGT format, with A always representing the ancestral state; each row represents a site for each population, with individual reads being tab-separated;
* `.glf.gz`: genotype likelihoods as doubles in binary format;
