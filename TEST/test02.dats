staload "./../SATS/atshtml.sats"
staload "./../SATS/atshtml_elms.sats"
staload "./../SATS/atshtml_attrs.sats"
staload "./../SATS/html_prf_cnst.sats"
#include "./../HATS/atshtml_infix_prf.hats"

extern
praxi test {b:bool | b}(): void

prval doc = Document0( ANil, Meta'(ANil) :*: ENil, ANil, ENil )
