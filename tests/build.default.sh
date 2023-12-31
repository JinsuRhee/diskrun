#!/bin/bash

cd bin
sed 's/^F90 =.*$/F90 = mpif90 -frecord-marker=4 -ffree-line-length-none -fbacktrace -g -O -fbounds-check -Wuninitialized -Wall/g' Makefile | \
    sed 's/^FFLAGS =.*$/FFLAGS = -x f95-cpp-input -ffpe-trap=zero,underflow,overflow,invalid -finit-real=nan -fopenmp $(DEFINES)/g' > Makefile.default
make -f Makefile.default clean

make -f Makefile.default
