(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"

#include "./../mylibies.hats"

#define ss2m string2mixed
#define sp2m string2mixed

stacst site_title : int

stacst page_title : int
stacst page_lang : int
stacst page_viewport : int
stacst utf8 : int
stacst viewport : int
stacst viewport_content : int

stacst home_uri : int
stacst home : int
stacst about_uri : int
stacst about : int
stacst contact_uri : int
stacst contact : int
stacst hello_world : int
stacst hello_world_msg : int

#include "./../HATS/atshtml_infix_prf.hats"

macdef link{href,t0:int}() 
  = a'( href${..}{href}() :@: anil , text'{..}{t0}() :*: enil )

macdef page_nav() = 
        link{home_uri,home}()
    :*: link{about_uri,about}()
    :*: link{contact_uri,contact}()
    :*: enil

macdef page_footer() = enil

macdef page_template( head, body )
   = document1( 
        lang${..}{page_lang}() :@: anil
      , anil
      , meta'( charset${..}{utf8}() :@: anil ) 
        :*: meta'(
               name${..}{viewport}() 
               :@: content${..}{viewport_content}()
               :@: anil    
           )
        :*: title'{..}{page_title}()
        :*: ,(head)
      , anil
      , header'(
            anil
          , h1'(anil,text'{..}{site_title}() :*: enil) :*: enil
          ) 
        :*: nav'(anil, page_nav())
        :*: main'(anil, ,(body))
        :*: footer'(anil, page_footer())
        :*: enil  
        ) 

macdef hello_world_page() 
  = page_template( enil, 
      section'(anil
        , h2'(anil, text'{..}{hello_world}() :*: enil )
          :*: p'(anil, text'{..}{hello_world_msg}() :*: enil )
          :*: enil 
          )  :*: enil
    )


implement
html5$out<strmixed1><int>( x, sm ) = print!(UN_mixed_borrow(sm))
implement
html5$out<char><int>( x, sm ) = print!(sm)
implement
html5$out<string><int>( x, sm ) = print!(sm)

implement(a:vt@ype+)
html5$attr<utf8><a>( x ) = ss2m("utf-8") 
implement(a:vt@ype+)
html5$attr<viewport><a>( x ) = ss2m("viewport") 
implement(a:vt@ype+)
html5$attr<viewport_content><a>( x ) = ss2m("width=device-width, initial-scale=1") 
implement(a:vt@ype+)
html5$attr<home_uri><a>( x ) = ss2m("home") 
implement(a:vt@ype+)
html5$attr<about_uri><a>( x ) = ss2m("about") 
implement(a:vt@ype+)
html5$attr<contact_uri><a>( x ) = ss2m("contact") 


fn hello_world_en() 
  =  html5_elm_list_out_verified<int>( doc | x ) where {
      prval doc = hello_world_page()
      implement(a:vt@ype+)
      html5$attr<page_lang><a>( x ) = ss2m("en") 
      implement(a:vt@ype+)
      html5$text<page_title><a>( x ) = ss2m("Hello World!")
      implement(a:vt@ype+)
      html5$text<hello_world><a>( x ) = ss2m("Hello World!") 
      implement(a:vt@ype+)
      html5$text<hello_world_msg><a>( x ) = ss2m("It's a bright and sunny day!") 
      implement(a:vt@ype+)
      html5$text<site_title><a>( x ) = ss2m("A Blog")
      implement(a:vt@ype+)
      html5$text<home><a>( x ) = ss2m("Home")
      implement(a:vt@ype+)
      html5$text<about><a>( x ) = ss2m("About")
      implement(a:vt@ype+)
      html5$text<contact><a>( x ) = ss2m("Contact")

      var x : int = 0 
    }

fn hello_world_fr() 
  =  html5_elm_list_out_verified<int>( doc | x ) where {
      prval doc = hello_world_page()
      implement(a:vt@ype+)
      html5$attr<page_lang><a>( x ) = ss2m("fr") 
      implement(a:vt@ype+)
      html5$text<page_title><a>( x ) = ss2m("Bonjour le monde!")
      implement(a:vt@ype+)
      html5$text<hello_world><a>( x ) = ss2m("Bonjour le monde!") 
      implement(a:vt@ype+)
      html5$text<hello_world_msg><a>( x ) = ss2m("C'est une journée lumineuse et ensoleillée!") 
      implement(a:vt@ype+)
      html5$text<site_title><a>( x ) = ss2m("Au Blog")
      implement(a:vt@ype+)
      html5$text<home><a>( x ) = ss2m("Accueil")
      implement(a:vt@ype+)
      html5$text<about><a>( x ) = ss2m("A propos")
      implement(a:vt@ype+)
      html5$text<contact><a>( x ) = ss2m("Nous contacter")

      var x : int = 0 
    }

fn hello_world_pl() 
  =  html5_elm_list_out_verified<int>( doc | x ) where {
      prval doc = hello_world_page()
      implement(a:vt@ype+)
      html5$attr<page_lang><a>( x ) = ss2m("pl") 
      implement(a:vt@ype+)
      html5$text<page_title><a>( x ) = ss2m("Witaj świecie!")
      implement(a:vt@ype+)
      html5$text<hello_world><a>( x ) = ss2m("Witaj świecie!") 
      implement(a:vt@ype+)
      html5$text<hello_world_msg><a>( x ) = ss2m("Jest jasny i słoneczny dzień!") 
      implement(a:vt@ype+)
      html5$text<site_title><a>( x ) = ss2m("Blog")
      implement(a:vt@ype+)
      html5$text<home><a>( x ) = ss2m("Dom")
      implement(a:vt@ype+)
      html5$text<about><a>( x ) = ss2m("O nas")
      implement(a:vt@ype+)
      html5$text<contact><a>( x ) = ss2m("Kontakt")

      var x : int = 0 
    }

implement main0 () = (
  hello_world_en();
  spacer(); 
  hello_world_fr();
  spacer(); 
  hello_world_pl();
  spacer(); 
) where { 
    macdef spacer() = (print_newline(); print_newline())
  }

