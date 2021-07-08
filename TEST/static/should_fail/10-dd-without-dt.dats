
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst list_item : int
stacst page_title : int
stacst utf8 : int

(* description lists *)

prval doc0 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    , dl'(anil,
          (** no dt *)
          dd'(anil,enil) dldd 
          dt'(anil,enil) dldt 
          dd'(anil,enil) dldd 
          dt'(anil,enil) dldt 
          dd'(anil,enil) dldd 
          dlnil
        ) :*: enil
  )
