PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

RMF=rm -f

PATSCC=$(PATSHOMEQ)/bin/patscc

PATSFLAGS=-DATS_MEMALLOC_LIBC
CFLAGS=-O2
LFLAGS=

all:: test01
test01: test01.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS) $(C11FLAGS) -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) test01

cleanall:: ; $(RMF) *_*ats.c

clean:: cleanall
