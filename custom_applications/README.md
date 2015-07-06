This directory is the place for custom simulations made using SCADASim as a
shared library.

Before running the simulations, you should build SCADASim as a shared lib
(check the top directory for instructions).

After building, you can generate the Makefiles for each simulation:
    make makefiles

and then build the simulations:
    make

To run the simulations, cd to the directory ("cd ddos", for example) and then:
    ./run
