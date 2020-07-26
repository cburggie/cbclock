
INSTALLDIR = ~/bin

CFLAGS = -I. -Wall -D_DEBUG
CC = gcc ${CFLAGS}

LIB = -lncurses

EXE = cbclock

all: ${EXE}

install: all
	cp ${EXE} ${INSTALLDIR}/${EXE}

clean:
	rm -f *.o
	rm -f ${EXE}

cbclock: cbc_main.o cbc_data.o cbc_util.o
	${CC} -o $@ $^ ${LIB}

cbc_main.o: cbc_main.c cbclock.h
	${CC} -o $@ -c $< ${LIB}

cbc_data.o: cbc_data.c cbclock.h
	${CC} -o $@ -c $<

cbc_util.o: cbc_util.c cbclock.h
	${CC} -o $@ -c $< ${LIB}


