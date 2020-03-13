#Makefile to a scheduling problem with cplex

#Declaration of parameters
# Note: current version of cplex and the path were the software is installed can be checked by running the following command on HPC $ module spider cplex
# Note: depending on the cluster you compile, it may be required to load the software for a different processor architecture. In this case, try other versions in the directory /kyukon/home/apps/CO7/

CPLEX_PATH = /kyukon/home/apps/CO7/haswell-ib/software/CPLEX/12.6/
CONCERTDIR = $(CPLEX_PATH)/concert
CPLEXDIR = $(CPLEX_PATH)/cplex
INCLUDECPLEX = -DIL_STD -I$(CONCERTDIR)/include -I$(CPLEXDIR)/include -I${CPOPTDIR}/include

# -lilocplex must come before -lcplex !!
LINKCPLEX = -L${CPOPTDIR}/lib/x86-64_linux/static_pic -L$(CPLEXDIR)/lib/x86-64_linux/static_pic -lilocplex -lcplex -L$(CONCERTDIR)/lib/x86-64_linux/static_pic -lconcert -lpthread
CFLAGS += ${INCLUDECPLEX}
LDFLAGS += ${LINKCPLEX}

CC		= g++
CARGS    	= -m64 -g

# Update -lgurobi9 when a new version comes available (concsult /kyukon/home/apps/CO7/haswell-ib/software/Gurobi/9.0.0/examples/build/Makefile with the path updated if necessary)
CPPLIB   	= -L$(LDFLAGS)
TAR		= main
OBJ		= $(SRC:.cpp=.o)
CXXFLAGS	= -D_GLIBCXX_USE_CXX11_ABI=0					#Use older version of g++ (Newer versions of Linux not yet supported)

# Specify below the path were your cplex code is
DIR		= ~/Cplex--HPC-Ghent
	
scheduling: $(DIR)/*.cpp
	$(CC) $(CARGS) $(CFLAGS) $(DIR)/*.cpp -I$(INC) $(CPPLIB) -lm -o scheduling

clean:
	rm -rf *o scheduling
