# Simulate 3 populations with no inbreeding
../ngsSim -npop 3 -nind 10 8 6 -nsites 10000 -errate 0.01 -depth 4 -pvar 1 -mfreq 0.005 -F 0.3 0.1 -model 1 -seed 12345 -outfiles testA

# Setting up inbreeding file
perl -s -e 'foreach(1..$n_ind){$x=0; $x+=0.25 if($_/$n_ind > 0.2); $x+=0.25 if($_/$n_ind > 0.4); $x+=0.25 if($_/$n_ind > 0.6); $x+=0.25 if($_/$n_ind > 0.8); $x+=0.25 if($_/$n_ind > 1); print $x."\n"}' -- -F=$F -n_ind=20 > testF.indF
# Simulate 1 population with inbreeding
../ngsSim -npop 1 -nind 20 -nsites 10000 -errate 0.01 -depth 4 -pvar 1 -mfreq 0.005 -F testF.indF -model 1 -seed 12345 -outfiles testF

# Test MD5 checksum
md5sum testA* testF.* | sort -k 2,2 > /tmp/test.md5

if diff /tmp/test.md5 test.md5 > /dev/null
then
    echo "ngsSim: All tests OK!"
else
    echo "ngsSim: test(s) failed!"
fi
