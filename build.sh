#!/bin/sh
#get environment variables
. $PWD/source
#build javacall layer
make -C javacall/configuration/stubs/linux/
#build pcsl
CFLAGS="-m32" make -C pcsl
#build cldc vm
make -C cldc/build/javacall_i386_gcc/
#build midp, note : runMidlet will fail (but its ok)
make -C midp/build/javacall/
#merge cldc and midp classes
mkdir $BUILD_OUTPUT_DIR/mergedclasses
cp -r $MIDP_OUTPUT_DIR/classes/* $CLDC_OUTPUT_DIR/classes/* $BUILD_OUTPUT_DIR/mergedclasses
cd $BUILD_OUTPUT_DIR/mergedclasses
zip -9 -r cldc_midp_classes.zip .
