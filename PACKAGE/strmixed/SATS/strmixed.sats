(* 
 ** Project : strmixed
 ** Author  : Mark Bellaire
 ** Year    : 2018
 ** License : MIT
*)

#include "./../HATS/project.hats"

absview string_v(l:addr)
absview strptr_v(l:addr)

castfn string_encode{l:addr}( string_v(l) | ptr l) : string
castfn strptr_encode{l:addr}( strptr_v(l) | ptr l) : strptr(l)

praxi string_v_ignore{l:addr} ( string_v(l) ) : void

dataview string_gc_v(bool,l:addr) =
  | string_is_gc(true,l)     of strptr_v(l) 
  | string_isnot_gc(false,l) of string_v(l)

absvt@ype strmixed(b:bool, l:addr) = @(bool,ptr) 
vtypedef strmixed0 = [b:bool][l:addr] strmixed(b,l)
vtypedef strmixed1 = [b:bool][l:agz] strmixed(b,l)

praxi strmixed_free_notgc{l:addr}( strmixed(false,l) ) : void

fun {} string2mixed( str: string  ) : [l:agz] strmixed(false,l)

fun {} strptr2mixed{l:addr}( str: strptr(l)  ) 
  : strmixed(true,l)

fun {} strmixed_peek{b:bool}{l:addr}( sm : !strmixed(b,l) ): bool b
fun {} strmixed_is_null{b:bool}{l:addr}( sm : !strmixed(b,l) ): [b1:bool | b1 == (l == null)] bool b1
fun {} strmixed_isnot_null{b:bool}{l:addr}( sm : !strmixed(b,l) ): [b1: bool | b1 == (l > null)] bool b1

fun {} strmixed_copy{b:bool}{l:addr}( sm : !strmixed(b,l) ): strmixed(b,l)

fun {} UN_mixed_borrow( sm: !strmixed0 ) :  string

castfn strmixed_decode{b:bool}{l:addr}( strmixed(b,l) ) : 
  ( string_gc_v(b,l) | @(bool b, ptr l) )

fun {} strmixed_free( sm: strmixed0 ) :<!wrt>  void 

fun {} strmixed2string{l:addr}( sm: strmixed(false,l) ) :  string

fun {} strmixed2strptr{l:addr}( sm: strmixed(true,l) ) :  strptr(l) 

fun {env:vt@ype+}
  strmixed_foreach$cont( char, &env ) 
    : bool
 
fun {env:vt@ype+}
  strmixed_foreach$fwork( char, &env >> _ ) 
    : void
 
fun {env:vt@ype+}
  strmixed_foreach( !strmixed0, &env >> _ ) 
    : size_t 

