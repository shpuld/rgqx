#!/bin/bash
# Make an .opk file for rg350

cp ./bin/rgqx ./opk_data/
cd opk_data

FLIST="rgqx"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} logo.png"
FLIST="${FLIST} manual-gcw0.txt"
FLIST="${FLIST} id1"

OPK_NAME=rgqx.opk
rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME}