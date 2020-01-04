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
                  p'(anil, text'(gt0_notify) :*: enil) :*: enil, is_gt0
                )
             :*: EITHER'(
                  p'(anil, text'(gt0_notify) :*: enil) :*: enil
                , p'(anil, text'(lte0_notify) :*: enil) :*: enil
                , is_gt0 
               )
             :*: enil
            )
          :*: enil
      ) :*: enil

    implement
    html5$out<int>( x, sm ) = print!(UN_mixed_borrow(sm))

    implement
    html5$attr<utf8><int>( x )        = s2m("utf-8")
    implement
    html5$attr<en><int>( x )        = s2m("en")
    implement
    html5$text<page_title><int>( x )  = s2m("Hello world")
    implement
    html5$text<hello_world><int>( x ) = s2m("Hello world")
    implement
    html5$text<gt0_notify><int>( x ) = s2m("Arg is greater than zero")
    implement
    html5$text<lte0_notify><int>( x ) = s2m("Arg is less than or equal to zero")
    implement
    html5$elm$opt_issome<is_gt0><int>( x ) = x > 0
    implement
    html5$elm$either_isleft<is_gt0><int>( x ) = x > 0

    val () = html5_elm_list_out<document><int>( 0 ) 


  }
