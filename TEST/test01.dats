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
      document0(
          anil
        ,     title'{..}{page_title}() 
          :*: meta'( charset${..}{utf8}() :@: anil )
          :*: noscript'(anil, meta'(anil) :*: enil)
          :*: enil
        , anil
        ,     h1'(anil, text'{..}{hello_world}() :*: enil)
          :*: dl'(anil, 
                dt'(anil,enil) dldt 
                dd'(anil,enil) dldd 
                dd'(anil,enil) dldd
                (anil, 
                  dt'(anil,enil) dldt 
                  dd'(anil,enil) dldd
                  dlnil) dldiv
                dt'(anil,enil) dldt 
                dd'(anil,enil) dldd 
                dlnil
              )
          :*: ruby'(anil, 
                rb'(anil,enil) rbrb
                span'(anil,enil) rbphrs
                rt'(anil,enil) rbrt 
                rp'(anil,enil) rbrp 
                rp'(anil,enil) rbrp 
                rtc'(anil,enil) rbrtc 
               rbnil )
          :*: picture'(anil,
                source'(anil) picsource
                source'(anil) picsource
                img'(anil) picimg picnil )
          :*: table'(anil,
                 thead'(anil,enil) tblthead
                 tbody'(anil,tr'(anil,td'(anil,enil) :*: enil) :*: enil) tbltbody
                 tfoot'(anil,enil) tbltfoot
                 tblnil )
          :*: ul'(anil,
                li'(anil,text'{..}{hello_world}() :*: enil) 
            :*: enil
             )
          :*: EITHER'{..}{is_gt0}(
                p'(anil, text'{..}{gt0_notify}() :*: enil) :*: enil
              , p'(anil, text'{..}{lte0_notify}() :*: enil) :*: enil
            )
          :*:  form'(action${..}{utf8}() :@: anil,
                p'(anil, text'{..}{hello_world}() :*: enil) :*: enil
              )
          :*: enil
      )
      where {
        #include "./../HATS/atshtml_infix_prf.hats"
      }

    stacst site_style : int
    stacst site_bundle : int
    stacst some_comment : int
    stadef document 
      = doctype'
      :*: html'(lang$(en) :@: anil
            , head'(anil,
                  meta'(charset$(utf8) :@: anil) 
              :*: title'(page_title)
              :*: style'(anil,site_style) 
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
             :*: script'(anil,site_bundle)
             :*: comment'(some_comment)
             :*: enil
            )
          :*: enil
      ) :*: enil

    implement
    html5$out<strmixed1><int>( x, sm ) = print!(UN_mixed_borrow(sm))
    implement
    html5$out<char><int>( x, sm ) = print!(sm)
    implement
    html5$out<string><int>( x, sm ) = print!(sm)

    implement
    html5$style<site_style><int>( x )      = s2m("
      html  {
        margin: 0;
        padding: 0;
        font-size: 20px;
      }
      html::after {
        content: \"</style>\";
      }  
    ")
    implement
    html5$script<site_bundle><int>( x )      = s2m("
      (function () {
        console.log(\"</script>\");
        console.log(\"</scri\");
      })()
    ")
    implement
    html5$comment<some_comment><int>( x )      = s2m("-  before----after  -")
    implement
    html5$attr<utf8><int>( x )      = s2m("utf-8")
    implement
    html5$attr<en><int>( x )        = s2m("en")
    implement
    html5$text<page_title><int>( x )  = s2m("Hello world")
    implement
    html5$text<hello_world><int>( x ) = s2m("Hello world: Здравствуйте")
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
    val () = println!("\ndatasort:\n")
    val () = html5_elm_list_out<document><int>( x ) 
    val () = println!("\nproof:\n")
    val () = html5_elm_list_out_verified<int>( pf | x ) 


  }
