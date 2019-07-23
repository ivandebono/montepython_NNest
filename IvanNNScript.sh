#!/bin/sh
#$ -N NN_master_test
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

EXECDIR="/sps/euclid/Users/idebono/nnest-master"

cd $EXECDIR

#python examples/nested/rosenbrock.py

python examples/mcmc/rosenbrock.py
python examples/mcmc/himmelbau.py
python examples/mcmc/rosenbrock.py
python examples/nested/himmelbau.py
python examples/nested/gauss.py
python examples/nested/gauss.py
python examples/mcmc/mog4.py
python examples/nested/mog4.py
python examples/nested/mog4_fast.py
