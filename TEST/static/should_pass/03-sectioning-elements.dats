
#include "./../../../mylibies.hats"
#include "./../../../HATS/atshtml_infix_prf.hats"

stacst hello_world : int
stacst list_item : int
stacst page_title : int
stacst utf8 : int

(* nav in header *)
prval doc0 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     header'(anil, nav'(anil,enil) :*: enil)
      :*: enil
  )

(* basic layout *)
stacst link0 : int 
stacst link1 : int 
stacst link2 : int
stacst ipsum_lorsum : int
prval doc0 = 
  document0(
      anil
    ,     title'{..}{page_title}() 
      :*: meta'( charset${..}{utf8}() :@: anil )
      :*: enil
    , anil
    ,     header'(anil,
            h1'( anil, text'{..}{hello_world}() :*: enil ) 
            :*: enil
          )
      :*: nav'(anil,
              a'( anil, text'{..}{link0}() :*: enil ) 
          :*: a'( anil, text'{..}{link1}() :*: enil ) 
          :*: a'( anil, text'{..}{link2}() :*: enil ) 
          :*: enil
        )
      :*: main'(anil,
          section'( anil,
               h1'( anil, text'{..}{hello_world}() :*: enil ) 
           :*: p'( anil, text'{..}{ipsum_lorsum}() :*: enil ) 
           :*: enil
          ) 
        :*: section'( anil,
               h1'( anil, text'{..}{hello_world}() :*: enil ) 
           :*: p'( anil, text'{..}{ipsum_lorsum}() :*: enil ) 
           :*: enil
          )
        :*: section'( anil,
               h1'( anil, text'{..}{hello_world}() :*: enil ) 
           :*: p'( anil, text'{..}{ipsum_lorsum}() :*: enil ) 
           :*: enil
          ) :*: enil
        )
      :*: footer'(anil,enil)
      :*: enil
  )
