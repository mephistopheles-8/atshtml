PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

RMF=rm -f

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt
PATSOLVE_ATSHTML=./../bin/patsolve_atshtml

PATSFLAGS=-DATS_MEMALLOC_LIBC 
CFLAGS=-O2
LFLAGS=

#all:: test01
#test01: test01.dats ; \
#	$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE_ATSHTML) && \
#	$(PATSCC) $(PATSFLAGS) --constraint-ignore $(CFLAGS) $(C11FLAGS) -o $@ $< $(LFLAGS) 
#cleanall:: ; $(RMF) test01

all:: test01
test01: test01.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS) $(C11FLAGS) -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) test01

cleanall:: ; $(RMF) *_*ats.c

clean:: cleanall
