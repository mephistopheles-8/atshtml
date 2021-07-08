

#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst page_title : int
stacst utf8 : int

(* table sections out of order *)

prval doc1 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,  table'(anil,
           tbody'(anil,tr'(anil,td'(anil,enil) :*: enil) :*: enil) tbltbody
           thead'(anil,enil) tblthead
           tfoot'(anil,enil) tbltfoot
           tblnil 
      )
      :*: enil
  )
