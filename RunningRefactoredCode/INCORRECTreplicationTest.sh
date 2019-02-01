#!/bin/bash
#SBATCH -J INCORRECTreplicationTest
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ruby_fore@alumni.brown.edu
date
echo ""
R --no-save > ~/Pathways2019/Simulations/OutputTxtFiles/INCORRECTreplicationTest.txt 2>&1 << EOF
source('~/Pathways2019/RunningRefactoredCode/INCORRECTrunSimsBeaker.R')
writePowerDFToFile('~/Pathways2019/Simulations/PowerDFs/INCORRECTreplicationTest.csv')

EOF
