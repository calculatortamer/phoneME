#!/bin/sh
#get environment variables
. $PWD/source
#build javacall layer
make -C javacall/configuration/stubs/linux/
#build pcsl
CFLAGS="-m32" make -C pcsl
#build cldc vm
make -C cldc/build/javacall_i386_gcc/
#build midp, note : ROMIZING will fail
make -C midp/build/javacall/
