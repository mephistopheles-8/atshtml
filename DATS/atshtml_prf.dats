
staload "./../SATS/atshtml.sats"
staload "./../SATS/atshtml_prf.sats"

implement {env}{es}
html5_elm_list_out_verified( pf | env ) 
  = html5_elm_list_out<es><env>( env )
