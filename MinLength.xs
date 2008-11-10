#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#define NEED_sv_2pv_nolen
#include "ppport.h"

#include "const-c.inc"

MODULE = Regexp::MinLength		PACKAGE = Regexp::MinLength	PREFIX = Regexp::MinLength_

INCLUDE: const-xs.inc

int
MinLength(rv)
	SV *rv;
	
	PREINIT:
	char *ptr;
	regexp *re=0;
	int ret;
	int len;
	PMOP *pm;


	CODE:
	New(1, pm, 1, PMOP);
	ptr = SvPV_nolen(ST(0));
	len = strlen(ptr);

	re = pregcomp(ptr, ptr + len, pm);
	if (!re) {
		croak("Cannot compile regexp");
	}

	ret = re->minlen;

	RETVAL = ret;
	OUTPUT:
	RETVAL


MODULE = Regexp::MinLength		PACKAGE = Regexp::MinLength
