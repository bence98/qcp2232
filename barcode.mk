#!/usr/bin/make -f

PN = QCP2232HV
TARGET_FORMAT = pnggray
TARGET_PPI = 300
ifeq ($(findstring png,${TARGET_FORMAT}), png)
EXT = png
else
EXT = ${TARGET_FORMAT}
endif
TARGET = barcode.${EXT}

all: ${TARGET}

${TARGET}:
	barcode -Eb ${PN} | gs -sDEVICE=${TARGET_FORMAT} -sOutputFile=$@ -dEPSCrop -r${TARGET_PPI} -

clean:
	rm -rf ${TARGET}
