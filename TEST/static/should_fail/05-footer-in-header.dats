
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst page_title : int
stacst utf8 : int

(* footer in header *)

prval doc1 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     header'(anil, footer'(anil,enil) :*: enil)
      :*: enil
  )
