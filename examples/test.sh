
N_SITES=10000
ERR=0.01
DEPTH=4
P_VAR=1
SEED=12345

# Clean-up
rm -f testA* testF.*



# Simulate 3 populations with no inbreeding
../ngsSim -npop 3 -nind 10 8 6 -nsites $N_SITES -errate $ERR -depth $DEPTH -pvar $P_VAR -mfreq 0.005 -F 0.3 0.1 -model 1 -seed $SEED -outfiles testA



# Setting up inbreeding file
perl -s -e 'foreach(1..$n_ind){$x=0; $x+=0.25 if($_/$n_ind > 0.2); $x+=0.25 if($_/$n_ind > 0.4); $x+=0.25 if($_/$n_ind > 0.6); $x+=0.25 if($_/$n_ind > 0.8); $x+=0.25 if($_/$n_ind > 1); print $x."\n"}' -- -F=$F -n_ind=20 > testF.indF
# Simulate 1 population with inbreeding
../ngsSim -npop 1 -nind 20 -nsites $N_SITES -errate $ERR -depth $DEPTH -pvar $P_VAR -mfreq 0.005 -F testF.indF -model 1 -seed $SEED -outfiles testF



# Create ANC fasta and fai files for unfolded SAF analyses
perl -s -e 'print(">chrSIM\n".("A"x$n)."\n");' -- -n=$N_SITES > testAF.ANC.fas
sleep 10
samtools faidx testAF.ANC.fas



##### CHECK
# Test MD5 checksum
TMP=`mktemp --suffix .ngsSim`
md5sum testA* testF.* | sort -k 2,2 > $TMP
if diff $TMP test.md5 > /dev/null
then
    echo "ngsSim: All tests OK!"
else
    echo "ngsSim: test(s) failed!"
fi
