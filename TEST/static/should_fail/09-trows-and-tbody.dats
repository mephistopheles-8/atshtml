
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst page_title : int
stacst utf8 : int

(* table may not contain both tbody and table rows. *)

prval doc1 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,  table'(anil,
           thead'(anil,enil) tblthead
           tbody'(anil,tr'(anil,td'(anil,enil) :*: enil) :*: enil) tbltbody
           tr'(anil,td'(anil,enil) :*: enil) tbltr
           tfoot'(anil,enil) tbltfoot
           tblnil 
      )
      :*: enil
  )
