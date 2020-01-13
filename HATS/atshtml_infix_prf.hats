(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#ifndef _ATSHTML_INFIX_PRF_HATS
#define _ATSHTML_INFIX_PRF_HATS

infixr :@:
infixr :*:
#define ENil ElmChildrenNil
#define :*: ElmChildrenCons

#define ANil ElmAttrsNil
#define :@: ElmAttrsCons

infixr dldt
infixr dldd
infixr dldiv

#define dldt DlDt'
#define dldd DlDd'
#define dldiv DlDiv'
 
#endif
