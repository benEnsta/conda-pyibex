#!/bin/bash

git submodule init
git submodule update
mkdir -p build && cd build

cmake -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX -DBUILD_TESTS=OFF ..
make VERBOSE=1
# make test ARGS="-V"
make install_python



# $PYTHON setup.py build_ext -I ${CONDA_PREFIX}/include:${CONDA_PREFIX}/include/ibex -L ${CONDA_PREFIX}/lib

# $PYTHON setup.py install

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
