#!/bin/bash

CLDC_PLATFORM="linux_c"
#MIDP_PLATFORM="linux_fb_gcc"
export PCSL_PLATFORM="linux_c_gcc"


export JDK_DIR=$HOME/java/j2sdk1.4.2_19/

#export CFLAGS="-m32"
export USE_MULTIPLE_ISOLATES=true

export COMPONENTS_DIR=$PWD
export BUILD_OUTPUT_DIR=$PWD/build_out

export JAVACALL_DIR=$COMPONENTS_DIR/javacall
export PROJECT_JAVACALL_DIR=$JAVACALL_DIR

export JAVACALL_OUTPUT_DIR=$BUILD_OUTPUT_DIR/javacall


export TOOLS_DIR=$PWD/tools
export TOOLS_OUTPUT_DIR=$BUILD_OUTPUT_DIR/tools

export USE_OUTPUT_REDIRECTION=true

export BuildDir=$PROJECT_JAVACALL_DIR/configuration/phoneMEFeature/linux_x86

#make -C $BuildDir JAVACALL_OUTPUT_DIR=$BUILD_OUTPUT_DIR/javacall "$@"

export PCSL_OUTPUT_DIR=$BUILD_OUTPUT_DIR/pcsl
export NETWORK_MODULE=bsd/generic

make -C $COMPONENTS_DIR/pcsl "$@"

export JVMWorkSpace=$COMPONENTS_DIR/cldc
export JVMBuildSpace=$BUILD_OUTPUT_DIR/cldc
export ENABLE_PCSL=true
export PCSL_OUTPUT_DIR=$BUILD_OUTPUT_DIR/pcsl
#export ENABLE_ISOLATES=true


export ENABLE_COMPILATION_WARNINGS=true
export ROMIZING=false


make -C $JVMWorkSpace/build/$CLDC_PLATFORM/ "$@"

export MIDP_OUTPUT_DIR=$BUILD_OUTPUT_DIR/midp

export CLDC_DIST_DIR=$BUILD_OUTPUT_DIR/cldc/$CLDC_PLATFORM/dist

#make -C $COMPONENTS_DIR/midp/build/$MIDP_PLATFORM
