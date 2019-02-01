#!/bin/bash
#SBATCH -J replicationTest
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby_fore@alumni.brown.edu
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/replicationTest.txt 2>&1 << EOF
source(~/Pathways2019/RunningRefactoredCode/runSimBeaker.R)
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/replicationTestCorrected.csv')

EOF
