This readme provides additional info on how to compile the scheduling project on HPC Ghent.

# Requirements
- [GCC](https://gcc.gnu.org/)
- [GNU Make](https://www.gnu.org/software/make/)
- [HPC Ghent account](https://www.ugent.be/hpc/en)

# Installation

To run the cplex code on HPC, follow the following three steps.

# Step 1. Access HPC

1) Open a terminal on HPC and move to the home directory (e.g., open a terminal and type $ssh vsc[your user id]@login.hpc.ugent.be)

2) Copy the code from github via the command $ git clone git@github.com:davidvanbulck/Cplex--HPC-Ghent.git

3) Compile the project via the provided make file $ make

4) Submit the job on HPC $ qsub runScheduling.sh

5) Check the output files. The standard output stream is stored in runScheduling.sh.o[job id], the standard error stream in runScheduling.sh.e[job id].

