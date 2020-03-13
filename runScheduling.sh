# Job script for a minimal working example to solve a scheduling problem

# Define job specifications

# 1 nodes, 1 processor (note: processor = core)
# Note: do not forget to limit number of threads Gurobi can use (otherwise Gurobi thinks it has all processors available on the cluster whereas it has only one available)
#PBS -l  nodes=1:ppn=1

# Expected running time 5 seconds
#PBS -l walltime=0:00:05

# Use infiniband nodes (important when you use mulitple cores)
#PBS -l ib

# Move to the working directory
# Alternatively: $ cd  /user/gent/419/vsc41980/gurobi/sudoku_code
cd ~/Cplex--HPC-Ghent

# Load modules -> go to golett: cplex not available on all clusters
module swap cluster/golett
module load CPLEX/12.6

# Compile the program
make scheduling

# Solve instance
./scheduling

