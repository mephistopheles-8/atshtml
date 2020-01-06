#include "share/atspre_staload.hats"

#include "./../mylibies.hats"

#define s2m string2mixed

sortdef html5_ctx = int
stadef html5_ctx_init = 0

stacst html5_elm_appendable : (html5_ctx, html5_elm, html5_elm) -> bool
stacst html5_has_attr : (html5_tag, html5_attr_kind) -> bool

dataprop ElmAttrs(tag:html5_tag,ax:html5_attr_list) = 
  |  ElmAttrsNil(tag,anil)
  | {attr:html5_attr}{ax:html5_attr_list}
     ElmAttrsCons(tag, attr :@: ax )
      of (ElmAttr(tag,attr), ElmAttrs(tag,ax))
and ElmAttr(html5_tag,html5_attr) =
  | {id:int}
    Charset$(meta_, charset$(id))

dataprop ElmChildren(ctx:html5_ctx,par:html5_tag,es:html5_elm_list) =
  |  ElmChildrenNil(html5_ctx_init,par,enil)
  |  {par:html5_tag}{ctx0,ctx1:html5_ctx}{chi:html5_elm}{es:html5_elm_list}
     ElmChildrenCons(ctx0,par,chi :*: es) 
      of (ElmChild(ctx1,ctx0,par,chi), ElmChildren(ctx1,par,es))

and ElmChild(ctx0:html5_ctx,ctx1:html5_ctx,par:html5_tag,chi:html5_elm) =
  | {id:int}{ctx0:html5_ctx} 
    Text'(ctx0,ctx0,par,text'(id)) 
  | {id:int}{ctx0:html5_ctx} 
    Comment'(ctx0,ctx0,par,comment'(id))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Head'(ctx0,ctx0,html_,head'(attrs,nodes)) 
      of (ElmAttrs(head_,attrs), ElmChildren(ctx0,head_,nodes))
  | {id:int}{ctx0:html5_ctx} 
    Title'(ctx0,ctx0,head_,title'(id)) 
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Base'(ctx0,ctx0,head_,base'(attrs))  of ElmAttrs(base_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Link'(ctx0,ctx0,head_,link'(attrs))  of ElmAttrs(link_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Meta'(ctx0,ctx0,head_,meta'(attrs))  of ElmAttrs(meta_,attrs)
  | {id:int}{ctx0:html5_ctx}{attrs:html5_attr_list} 
    Style'(ctx0,ctx0,head_,style'(attrs,id))  of ElmAttrs(style_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Body'(ctx0,ctx0,html_,body'(attrs,nodes)) 
      of (ElmAttrs(body_,attrs), ElmChildren(ctx0,body_,nodes))
   
#define :: ElmChildrenCons
#define nil ElmChildrenNil


dataprop Document(html5_elm_list) =
  | {h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    {ctxh,ctxb:html5_ctx}
    Document0( 
        doctype'
    :*: head'(h1as, h1es)
    :*: body'(bas, bes)
    :*: enil
    ) of (
      ElmAttrs(head_,h1as)
    , ElmChildren(ctxh,head_,h1es)
    , ElmAttrs(body_,bas)
    , ElmChildren(ctxb,body_,bes)
    )   
  | {h0as,h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    {ctxh,ctxb:html5_ctx}
    Document1( 
      doctype'
     :*: html'(h0as, 
              head'(h1as, h1es)
          :*: body'(bas, bes)
          :*: enil
        ) 
     :*: enil
    ) of (
      ElmAttrs(html_,h0as)
    , ElmAttrs(head_,h1as)
    , ElmChildren(ctxh,head_,h1es)
    , ElmAttrs(body_,bas)
    , ElmChildren(ctxb,body_,bes)
    )   
    
(** Be warned: we rely on the ability of ATS2 to infer `es` **) 
fun {env:vt@ype+}{es: html5_elm_list }
  html5_elm_list_out_verified( pf: Document(es) | env: &env ) : void
  = html5_elm_list_out<es><env>( env )
 


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
          :*: Meta'( Charset${utf8}() :@: ANil )
          :*: ENil
        , ANil
        , ENil
      )
      where {
        #define :*: ElmChildrenCons
        #define ENil ElmChildrenNil
        
        #define :@: ElmAttrsCons
        #define ANil ElmAttrsNil

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
  
    var x : int = 1000
    val () = html5_elm_list_out<document><int>( x ) 
    val () = html5_elm_list_out_verified<int>( pf | x ) 


  }
