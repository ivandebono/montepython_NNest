#!/bin/sh
#$ -N NN_example
#$ -P P_euclid_sci
#$ -q pa_long
#$ -l sps=1
#$ -j n
#$ -l os=cl7
#$ -pe openmpi 4
#$ -l s_rss=2.9G
#$ -l h_rss=3.5G
#$ -m abe 
#$ -M ivan.debono@in2p3.fr
#$ -o /sps/euclid/Users/idebono/nnest/CLUSTER/$JOB_NAME/$JOB_ID.out
#$ -e /sps/euclid/Users/idebono/nnest/CLUSTER/$JOB_NAME/$JOB_ID.err
#$ -cwd

export OMP_NUM_THREADS=$NSLOTS 

source /pbs/home/i/idebono/.profile
source /usr/local/shared/bin/openmpi_env.sh

EXECDIR="/sps/euclid/Users/idebono/montepython_nnest"

python $EXECDIR/montepython/MontePython.py run -o ~/nnest_test/cluster_example_nnest_fastslowfalse -p ~/nnest_test/example_nnest.param  -m NN --NN_sampler nested --NN_n_live_points 100 --NN_fastslow False

mpiexec -np $NSLOTS $EXECDIR/montepython/MontePython.py run -o ~/nnest_test/cluster_mp_example_nnest_fastslowfalse -p ~/nnest_test/example_nnest.param  -m NN --NN_sampler nested --NN_n_live_points 100 --NN_fastslow False
