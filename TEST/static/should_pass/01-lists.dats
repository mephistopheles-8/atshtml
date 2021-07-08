
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst list_item : int
stacst page_title : int
stacst utf8 : int

(* ul elements *)
prval doc0 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     h1'(anil, text'{..}{hello_world}() :*: enil)
      :*: ul'(anil, 
               li'(anil, text'{..}{list_item}() :*: enil)
           :*: li'(anil, text'{..}{list_item}() :*: enil)
          :*: enil)
      :*: enil
  )

(* ol elements *)
prval doc1 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     h1'(anil, text'{..}{hello_world}() :*: enil)
      :*: ol'(anil, 
               li'(anil, text'{..}{list_item}() :*: enil)
           :*: li'(anil, text'{..}{list_item}() :*: enil)
          :*: enil)
      :*: enil
  )
