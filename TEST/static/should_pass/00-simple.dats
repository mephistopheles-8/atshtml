
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst page_title : int
stacst utf8 : int

prval doc1 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     h1'(anil, text'{..}{hello_world}() :*: enil)
      :*: p'(anil, text'{..}{hello_world}() :*: enil)
      :*: enil
  )
