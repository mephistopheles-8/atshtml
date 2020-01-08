(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#ifndef _ATSHTML_INFIX_HATS
#define _ATSHTML_INFIX_HATS

infixr :@:
infixr :*:
#define anil html5_attr_list_nil
#define :@: html5_attr_list_cons

#define enil html5_elm_list_nil
#define :*: html5_elm_list_cons

#endif
