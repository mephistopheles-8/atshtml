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
#define enil ElmChildrenNil
#define :*: ElmChildrenCons

#define anil ElmAttrsNil
#define :@: ElmAttrsCons

infixr dldt
infixr dldd
infixr dldiv

#define dldt dldt'
#define dldd dldd'
#define dldiv dldiv'

infixr rbphrs
infixr rbrb
infixr rbrtc
infixr rbrt
infixr rbrp

#define rbphrs rubyphrasing'
#define rbrb rubyrb'
#define rbrtc rubyrtc'
#define rbrt rubyrt'
#define rbrp rubyrp'
#define rbnil rubynil

infixr tblcaption
infixr tblcolgroup
infixr tblthead
infixr tbltbody
infixr tbltr
infixr tbltfoot

#define tblcaption tablecaption'
#define tblcolgroup tablecolgroup'
#define tblthead tablethead'
#define tbltbody tabletbody'
#define tbltr tabletr'
#define tbltfoot tabletfoot'
#define tblnil tablenil

infixr mediaelm 
infixr mediatrack 
infixr mediasource

#define mediatrack mediatrack'
#define mediasource mediasource'
#define medianil medianil

infixr picimg 
infixr picsource

#define picimg pictureimg'
#define picsource picturesource'
#define picnil picturenil

infixr fslegend 
infixr fsflow

#define fsflow fieldsetflow'
#define fslegend fieldsetlegend'
#define fsnil fieldsetnil


 
#endif
