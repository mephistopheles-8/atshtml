
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst list_item : int
stacst page_title : int
stacst utf8 : int

(* sectioned table *)

prval doc0 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,  table'(anil,
           thead'(anil,enil) tblthead
           tbody'(anil,tr'(anil,td'(anil,enil) :*: enil) :*: enil) tbltbody
           tfoot'(anil,enil) tbltfoot
           tblnil 
      )
      :*: enil
  )

(* non-sectioned table *)

prval doc1 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    , table'(anil,
           tr'(anil,td'(anil,enil) :*: enil)  tbltr
           tr'(anil,td'(anil,enil) :*: enil)  tbltr
           tr'(anil,td'(anil,enil) :*: enil)  tbltr
           tblnil 
      )
      :*: enil
  )
