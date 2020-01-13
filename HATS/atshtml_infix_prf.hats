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
#define dlnil DlNil

infixr rbphrs
infixr rbrb
infixr rbrtc
infixr rbrt
infixr rbrp

#define rbphrs RubyPhrasing'
#define rbrb RubyRb'
#define rbrtc RubyRtc'
#define rbrt RubyRt'
#define rbrp RubyRp'
#define rbnil RubyNil

infixr tblcaption
infixr tblcolgroup
infixr tblthead
infixr tbltbody
infixr tbltr
infixr tbltfoot

#define tblcaption TableCaption'
#define tblcolgroup TableColgroup'
#define tblthead TableThead'
#define tbltbody TableTbody'
#define tbltr TableTr'
#define tbltfoot TableTfoot'
#define tblnil TableNil

infixr mediaelm 
infixr mediatrack 
infixr mediasource

#define mediaelm MediaElm
#define mediatrack MediaTrack'
#define mediasource MediaSource'
#define medianil MediaNil

infixr picimg 
infixr picsource

#define picimg PictureImg'
#define picsource PictureSource'
#define picnil PictureNil

infixr fslegend 
infixr fsflow

#define fsflow FieldsetFlow'
#define fslegend FieldsetLegend'
#define fsnil FieldsetNil


 
#endif
