# Job script for a minimal working example to solve a scheduling problem

# Define job specifications

# 1 nodes, 1 processor (note: processor = core)
# Note: do not forget to limit number of threads Gurobi can use (otherwise Gurobi thinks it has all processors available on the cluster whereas it has only one available)
#PBS -l nodes=1:ppn=6

# Expected running time 2 hours
#PBS -l walltime=02:30:00

# Memory
#PBS -l mem=16gb

# Move to the working directory
# Alternatively: $ cd  /user/gent/419/vsc41980/gurobi/sudoku_code
# Change into your directory (find it via $pwd)
cd /user/gent/419/vsc41980/Cplex--HPC-Ghent

# Compile the program
make scheduling

# Solve instance
./scheduling

