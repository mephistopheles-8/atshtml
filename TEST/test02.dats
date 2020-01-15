(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "share/atspre_staload.hats"

#include "./../mylibies.hats"

#define ss2m string2mixed
#define sp2m strptr2mixed

vtypedef field(a:vt@ype+) = @{ id = int, value = a }

fun {a:vt@ype+} field_label(x: &field(a), label: string) : strmixed1
  = sm where {
    var buf = @[char][32]() 
    val sm = sp2m( string0_append(label, snprintf(buf,32,"%d",x.id )) )
  } where {
    macdef snprintf(buf,bsz,pattern,value) = 
      let
        typedef
        cstring = $extype"atstype_string"
        val bufp = $UNSAFE.cast{cstring}(addr@,(buf))
        val _(*int*) =
          $extfcall(ssize_t, "snprintf", bufp, ,(bsz), ,(pattern), ,(value))
      in $UNSAFE.cast{string}(addr@,(buf))
      end
  }

stacst html5_rep_bool' : int
stadef html5_rep_bool(id:int) 
  = WITH'(bool, text'(html5_rep_bool') :*: enil, id) 

stacst html5_field_bool' : int
stacst html5_field_bool'type : int
stacst html5_field_bool'checked : int
stadef html5_field_bool(id:int, attrs:html5_attr_list) 
  = WITH'(field(bool)
    , input'(
          type$(html5_field_bool'type) 
      :@: checked$(html5_field_bool'checked) 
      :@: attrs
    ) :*: enil, id) 

stacst html5_rep_int' : int
stadef html5_rep_int(id:int) 
  = WITH'(int, text'(html5_rep_int') :*: enil, id) 

stacst html5_field_int' : int
stacst html5_field_int'type : int
stacst html5_field_int'value : int
stadef html5_field_int(id:int, attrs:html5_attr_list) 
  = WITH'(field(int)
    , input'(
          type$(html5_field_int'type) 
      :@: value$(html5_field_int'value) 
      :@: attrs
    ) :*: enil, id) 

stacst html5_rep_string' : int
stadef html5_rep_string(id:int) 
  = WITH'(string, text'(html5_rep_string') :*: enil, id) 

stacst html5_field_string' : int
stacst html5_field_string'type : int
stacst html5_field_string'value : int
stadef html5_field_string(id:int, attrs:html5_attr_list) 
  = WITH'(field(string)
    , input'(
          type$(html5_field_string'type) 
      :@: value$(html5_field_string'value) 
      :@: attrs
    ) :*: enil, id) 

stacst html5_rep_strptr' : int
stadef html5_rep_strptr(id:int) 
  = WITH'(Strptr1, text'(html5_rep_strptr') :*: enil, id) 

stacst html5_rep_uint' : int
stadef html5_rep_uint(id:int) 
  = WITH'(uint, text'(html5_rep_uint') :*: enil, id) 

stacst html5_rep_double' : int
stadef html5_rep_double(id:int) 
  = WITH'(double, text'(html5_rep_double') :*: enil, id) 

stacst html5_rep_list' : int
stadef html5_rep_list(id:int, a:t@ype+,rep_a: html5_elm, on_empty: html5_elm_list ) 
  = WITH'(List0(a), MANY_OR'(rep_a :*: enil,on_empty,html5_rep_list') :*: enil, id)

typedef myrecord = @{
    name = string
  , active = bool
  }

stacst html5_rep_myrecord' : int
stacst html5_rep_myrecord'class : int
stacst html5_rep_myrecord'name : int
stacst html5_rep_myrecord'active : int
stadef html5_rep_myrecord(id:int) 
  = WITH'(myrecord, 
      dl'(class$(html5_rep_myrecord'class) :@: anil,
           dt'(anil, text'(html5_rep_myrecord'name) :*: enil ) 
      :*:  dd'(anil, html5_rep_string(html5_rep_myrecord'name) :*: enil ) 
      :*:  dt'(anil, text'(html5_rep_myrecord'active) :*: enil ) 
      :*:  dd'(anil, html5_rep_bool(html5_rep_myrecord'active) :*: enil )
      :*:  enil 
    ) :*: enil
  , id
  )

stacst html5_field_myrecord' : int
stacst html5_field_myrecord'legend : int
stacst html5_field_myrecord'class : int
stacst html5_field_myrecord'name : int
stacst html5_field_myrecord'name'label : int
stacst html5_field_myrecord'name'id : int
stacst html5_field_myrecord'active : int
stacst html5_field_myrecord'active'label : int
stacst html5_field_myrecord'active'id : int
stadef html5_field_myrecord(id:int) 
  = WITH'(field(myrecord), 
      fieldset'(class$(html5_field_myrecord'class) :@: anil,
            legend'(anil, text'(html5_field_myrecord'legend) :*: enil )
        :*: label'(
                  for$(html5_field_myrecord'name'id)  :@: anil
                , text'(html5_field_myrecord'name'label) :*: enil
              )
        :*: html5_field_string(html5_field_myrecord'
              ,   id$(html5_field_myrecord'name'id)  
              :@: name$(html5_field_myrecord'name'id) 
              :@: anil
          )
        :*: label'(
                  for$(html5_field_myrecord'active'id)  :@: anil
                , text'(html5_field_myrecord'active'label) :*: enil
              )
        :*: html5_field_bool(html5_field_myrecord'
              ,   id$(html5_field_myrecord'active'id)  
              :@: name$(html5_field_myrecord'active'id) 
              :@: anil
          )
        :*: enil
    ) :*: enil
  , id
  )

(** Prelude **)
implement 
html5$text<html5_rep_bool'><bool>( x ) = if x then ss2m("true") else ss2m("false") 
implement 
html5$text<html5_rep_int'><int>( x ) = sp2m( tostrptr_int( x ) ) 
implement 
html5$text<html5_rep_string'><string>( x ) = ss2m( x )
implement 
html5$text<html5_rep_strptr'><Strptr1>( x ) = sp2m( copy(x) )
implement 
html5$text<html5_rep_uint'><uint>( x ) = sp2m( tostrptr_uint( x ) ) 
implement 
html5$text<html5_rep_double'><double>( x ) = sp2m( tostrptr_double( x ) ) 

implement 
html5$attr_void<html5_field_bool'checked><field(bool)>( x ) = x.value 
implement 
html5$attr<html5_field_bool'type><field(bool)>( x ) = ss2m("checkbox")
 
implement 
html5$attr<html5_field_int'value><field(int)>( x ) = sp2m( tostrptr_int( x.value ) ) 
implement 
html5$attr<html5_field_int'type><field(int)>( x ) = ss2m( "number" ) 
implement 
html5$attr<html5_field_string'value><field(string)>( x ) = ss2m( x.value )
implement 
html5$attr<html5_field_string'type><field(string)>( x ) = ss2m("text")


(** Fields **)
implement (id,a:t@ype+)
html5$push<id><a,field(a)>( x ) = @{ id = 0, value = x} 
implement (id,a:t@ype+,b:vt@ype+)
html5$push<id><field(a),field(b)>( x ) = @{ 
    id = x.id
  , value = html5$push<id><a,b>( x.value )
}
 
implement (id,a:t@ype+,b:vt@ype+)
html5$pop<id><field(a),b>( x,y ) = {
    val () = x.id := x.id + 1
    (** Avoid TCO **)
    val () = html5$pop<id><a,b>( x.value, y )
    val () = ignoret(0) 
  } 


(** html5_rep_myrecord **)
implement (a)
html5$attr<html5_rep_myrecord'class><a>( x ) = ss2m( "myrecord" ) 
implement (a)
html5$text<html5_rep_myrecord'name><a>( x ) = ss2m( "Name" ) 
implement (a)
html5$text<html5_rep_myrecord'active><a>( x ) = ss2m( "Active" ) 
implement 
html5$push<html5_rep_myrecord'name><myrecord,string>( x ) = x.name 
implement 
html5$push<html5_rep_myrecord'active><myrecord,bool>( x ) = x.active 

(** html5_field_myrecord **)

implement (a)
html5$attr<html5_field_myrecord'class><a>( x ) = ss2m( "myrecord" ) 
implement (a)
html5$text<html5_field_myrecord'legend><a>( x ) = ss2m( "My Record" )
 
implement (a)
html5$text<html5_field_myrecord'name'label><a>( x ) = ss2m( "Name" )
implement (a)
html5$text<html5_field_myrecord'active'label><a>( x ) = ss2m( "Active" )
implement (a)
html5$attr<html5_field_myrecord'name'id><field(a)>( x ) = field_label(x,"myrecord-name-")
implement (a)
html5$attr<html5_field_myrecord'active'id><field(a)>( x ) = field_label(x,"myrecord-active-")
implement 
html5$push<html5_field_myrecord'><myrecord,string>( x ) = x.name 
implement 
html5$push<html5_field_myrecord'><myrecord,bool>( x ) = x.active 

implement (a:t@ype+)
html5$free<field(a)>( x ) = ()

implement main0 () 
  = println!("Hello [test02]") where {
    var x : myrecord = @{name = "Sarah", active = true }

    implement (a)
    html5$out<a>( x, sm ) = print!(UN_mixed_borrow(sm))

    val () = println!("html5_rep_myrecord:")
    val () = html5_elm_list_out<html5_rep_myrecord(0) :*: enil><myrecord>( x ) 
    val () = print_newline()
    
    val () = println!("html5_field_myrecord:")
    val () = html5_elm_list_out<html5_field_myrecord(0) :*: enil><myrecord>( x ) 
    val () = print_newline()

  }

