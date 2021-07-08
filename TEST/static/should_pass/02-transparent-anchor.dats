
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst list_item : int
stacst page_title : int
stacst utf8 : int

(* div inside of an anchor *)
prval doc0 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     h1'(anil, text'{..}{hello_world}() :*: enil)
      :*: a'(anil,
            div'(anil,enil) :*: enil
          )
      :*: enil
  )
