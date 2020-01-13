(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"

#include "./../mylibies.hats"

#define s2m string2mixed


implement main0 () 
  = {
    stadef page_title = 0
    stadef utf8 = 1
    stadef en = 2
    stadef hello_world = 3
    stadef is_gt0 = 4
    stadef gt0_notify = 5
    stadef lte0_notify = 6
    stadef countdown = 7
    stadef nothing_to_count = 8
    stadef show_count = 9
  
    prval pf = 
      Document0(
          ANil
        ,     Title'{..}{page_title}() 
          :*: Meta'( Charset${..}{utf8}() :@: ANil )
          :*: Noscript'(ANil, Meta'(ANil) :*: ENil)
          :*: ENil
        , ANil
        ,     H1'(ANil, Text'{..}{hello_world}() :*: ENil)
          :*: Dl'(ANil, 
                Dt'(ANil,ENil) dldt 
                Dd'(ANil,ENil) dldd 
                Dd'(ANil,ENil) dldd
                (ANil, 
                  Dt'(ANil,ENil) dldt 
                  Dd'(ANil,ENil) dldd
                  DlNil) dldiv
                Dt'(ANil,ENil) dldt 
                Dd'(ANil,ENil) dldd 
                DlNil
              )
          :*: Ul'(ANil,
                Li'(ANil,Text'{..}{hello_world}() :*: ENil) 
            :*: ENil
             )
          :*: Either'{..}{is_gt0}(
                P'(ANil, Text'{..}{gt0_notify}() :*: ENil) :*: ENil
              , P'(ANil, Text'{..}{lte0_notify}() :*: ENil) :*: ENil
            )
          :*:  Form'(Action${..}{utf8}() :@: ANil,
                P'(ANil, Text'{..}{hello_world}() :*: ENil) :*: ENil
              )
          :*: ENil
      )
      where {
        #include "./../HATS/atshtml_infix_prf.hats"
      }

    stadef document 
      = doctype'
      :*: html'(lang$(en) :@: anil
            , head'(anil,
                  meta'(charset$(utf8) :@: anil) 
              :*: title'(page_title) 
              :*: enil
            ) 
          :*: body'(anil,
                 p'(anil, text'(hello_world) :*: enil)
             :*: OPT'(
                  p'(anil, text'(gt0_notify) :*: enil) :*: enil
                , is_gt0
                )
             :*: EITHER'(
                  p'(anil, text'(gt0_notify) :*: enil) :*: enil
                , p'(anil, text'(lte0_notify) :*: enil) :*: enil
                , is_gt0 
               )
             :*: ul'(anil,
                  MANY_OR'(
                    li'(anil, text'(show_count) :*: enil) :*: enil
                  , li'(anil, text'(nothing_to_count) :*: enil) :*: enil
                  , countdown 
                 ) :*: enil
                )
             :*: enil
            )
          :*: enil
      ) :*: enil

    implement
    html5$out<int>( x, sm ) = print!(UN_mixed_borrow(sm))

    implement
    html5$attr<utf8><int>( x )      = s2m("utf-8")
    implement
    html5$attr<en><int>( x )        = s2m("en")
    implement
    html5$text<page_title><int>( x )  = s2m("Hello world")
    implement
    html5$text<hello_world><int>( x ) = s2m("Hello world")
    implement
    html5$text<show_count><int>( x ) = strptr2mixed(tostrptr_int(x))
    implement
    html5$text<nothing_to_count><int>( x ) = s2m("There is nothing to count!")
    implement
    html5$text<gt0_notify><int>( x ) = s2m("Arg is greater than zero")
    implement
    html5$text<lte0_notify><int>( x ) = s2m("Arg is less than or equal to zero")
    implement
    html5$elm$opt_issome<is_gt0><int>( x ) = x > 0
    implement
    html5$elm$either_isleft<is_gt0><int>( x ) = x > 0
    implement
    html5$elm$many_has_next<countdown><int>( x ) 
      = if x > 0 then (x := x - 1; true) else false
  
    var x : int = 20
    val () = html5_elm_list_out<document><int>( x ) 
    val () = html5_elm_list_out_verified<int>( pf | x ) 


  }
