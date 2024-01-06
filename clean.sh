#!/bin/sh
#get environment variables
. $PWD/source
#build javacall layer
make -C javacall/configuration/stubs/linux/ clean
#build pcsl
make -C pcsl clean
#build cldc vm
make -C cldc/build/javacall_i386_gcc/ clean
#build midp, note : ROMIZING will fail
make -C midp/build/javacall/ clean
