# Job script for a minimal working example to solve a scheduling problem

# Define job specifications

# 1 nodes, 1 processor (note: processor = core)
# Note: do not forget to limit number of threads Gurobi can use (otherwise Gurobi thinks it has all processors available on the cluster whereas it has only one available)
#PBS -l nodes=1:ppn=1

# Expected running time 5 seconds
#PBS -l walltime=0:00:05

# Move to the working directory
# Alternatively: $ cd  /user/gent/419/vsc41980/gurobi/sudoku_code
cd ~/Cplex--Hpc-Ghent

# Load modules -> go to golett: cplex not available on all clusters
module swap cluster/doduo
#module load CPLEX/12.6
module load CPLEX/22.1.1-GCCcore-11.2.0

# Compile the program
make scheduling

# Solve instance
./scheduling

