(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"

staload "./atshtml.sats"

stadef accept$(id) : html5_attr 
   = html5_attr(_accept,id)
stadef accept_charset$(id) : html5_attr 
   = html5_attr(_accept_charset,id)
stadef accesskey$(id) : html5_attr 
   = html5_attr(_accesskey,id)
stadef action$(id) : html5_attr 
   = html5_attr(_action,id)
stadef align$(id) : html5_attr 
   = html5_attr(_align,id)
stadef alt$(id) : html5_attr 
   = html5_attr(_alt,id)
stadef async$(id) : html5_attr 
   = html5_attr(_async,id)
stadef autocapitalize$(id) : html5_attr 
   = html5_attr(_autocapitalize,id)
stadef autocomplete$(id) : html5_attr 
   = html5_attr(_autocomplete,id)
stadef autofocus$(id) : html5_attr 
   = html5_attr(_autofocus,id)
stadef autoplay$(id) : html5_attr 
   = html5_attr(_autoplay,id)
stadef bgcolor$(id) : html5_attr 
   = html5_attr(_bgcolor,id)
stadef border$(id) : html5_attr 
   = html5_attr(_border,id)
stadef buffered$(id) : html5_attr 
   = html5_attr(_buffered,id)
stadef challenge$(id) : html5_attr 
   = html5_attr(_challenge,id)
stadef charset$(id) : html5_attr 
   = html5_attr(_charset,id)
stadef checked$(id) : html5_attr 
   = html5_attr_void(_checked,id)
stadef cite$(id) : html5_attr 
   = html5_attr(_cite,id)
stadef class$(id) : html5_attr 
   = html5_attr(_class,id)
stadef code$(id) : html5_attr 
   = html5_attr(_code,id)
stadef codebase$(id) : html5_attr 
   = html5_attr(_codebase,id)
stadef color$(id) : html5_attr 
   = html5_attr(_color,id)
stadef cols$(id) : html5_attr 
   = html5_attr(_cols,id)
stadef colspan$(id) : html5_attr 
   = html5_attr(_colspan,id)
stadef content$(id) : html5_attr 
   = html5_attr(_content,id)
stadef contenteditable$(id) : html5_attr 
   = html5_attr(_contenteditable,id)
stadef contextmenu$(id) : html5_attr 
   = html5_attr(_contextmenu,id)
stadef controls$(id) : html5_attr 
   = html5_attr(_controls,id)
stadef coords$(id) : html5_attr 
   = html5_attr(_coords,id)
stadef crossorigin$(id) : html5_attr 
   = html5_attr(_crossorigin,id)
stadef data$(id) : html5_attr 
   = html5_attr(_data,id)
stadef data_kv$(k,v) : html5_attr 
   = html5_attr_data(k,v)
stadef datetime$(id) : html5_attr 
   = html5_attr(_datetime,id)
stadef default$(id) : html5_attr 
   = html5_attr(_default,id)
stadef defer$(id) : html5_attr 
   = html5_attr(_defer,id)
stadef dir$(id) : html5_attr 
   = html5_attr(_dir,id)
stadef dirname$(id) : html5_attr 
   = html5_attr(_dirname,id)
stadef disabled$(id) : html5_attr 
   = html5_attr(_disabled,id)
stadef download$(id) : html5_attr 
   = html5_attr(_download,id)
stadef draggable$(id) : html5_attr 
   = html5_attr(_draggable,id)
stadef dropzone$(id) : html5_attr 
   = html5_attr(_dropzone,id)
stadef enctype$(id) : html5_attr 
   = html5_attr(_enctype,id)
stadef for$(id) : html5_attr 
   = html5_attr(_for,id)
stadef form$(id) : html5_attr 
   = html5_attr(_form,id)
stadef formaction$(id) : html5_attr 
   = html5_attr(_formaction,id)
stadef headers$(id) : html5_attr 
   = html5_attr(_headers,id)
stadef height$(id) : html5_attr 
   = html5_attr(_height,id)
stadef hidden$(id) : html5_attr 
   = html5_attr(_hidden,id)
stadef high$(id) : html5_attr 
   = html5_attr(_high,id)
stadef href$(id) : html5_attr 
   = html5_attr(_href,id)
stadef hreflang$(id) : html5_attr 
   = html5_attr(_hreflang,id)
stadef http_equiv$(id) : html5_attr 
   = html5_attr(_http_equiv,id)
stadef icon$(id) : html5_attr 
   = html5_attr(_icon,id)
stadef id$(id) : html5_attr 
   = html5_attr(_id,id)
stadef integrity$(id) : html5_attr 
   = html5_attr(_integrity,id)
stadef ismap$(id) : html5_attr 
   = html5_attr(_ismap,id)
stadef itemprop$(id) : html5_attr 
   = html5_attr(_itemprop,id)
stadef keytype$(id) : html5_attr 
   = html5_attr(_keytype,id)
stadef kind$(id) : html5_attr 
   = html5_attr(_kind,id)
stadef label$(id) : html5_attr 
   = html5_attr(_label,id)
stadef lang$(id) : html5_attr 
   = html5_attr(_lang,id)
stadef language$(id) : html5_attr 
   = html5_attr(_language,id)
stadef list$(id) : html5_attr 
   = html5_attr(_list,id)
stadef loop$(id) : html5_attr 
   = html5_attr(_loop,id)
stadef low$(id) : html5_attr 
   = html5_attr(_low,id)
stadef manifest$(id) : html5_attr 
   = html5_attr(_manifest,id)
stadef max$(id) : html5_attr 
   = html5_attr(_max,id)
stadef maxlength$(id) : html5_attr 
   = html5_attr(_maxlength,id)
stadef minlength$(id) : html5_attr 
   = html5_attr(_minlength,id)
stadef media$(id) : html5_attr 
   = html5_attr(_media,id)
stadef method$(id) : html5_attr 
   = html5_attr(_method,id)
stadef min$(id) : html5_attr 
   = html5_attr(_min,id)
stadef multiple$(id) : html5_attr 
   = html5_attr(_multiple,id)
stadef muted$(id) : html5_attr 
   = html5_attr(_muted,id)
stadef name$(id) : html5_attr 
   = html5_attr(_name,id)
stadef novalidate$(id) : html5_attr 
   = html5_attr(_novalidate,id)
stadef open$(id) : html5_attr 
   = html5_attr(_open,id)
stadef optimum$(id) : html5_attr 
   = html5_attr(_optimum,id)
stadef pattern$(id) : html5_attr 
   = html5_attr(_pattern,id)
stadef ping$(id) : html5_attr 
   = html5_attr(_ping,id)
stadef placeholder$(id) : html5_attr 
   = html5_attr(_placeholder,id)
stadef poster$(id) : html5_attr 
   = html5_attr(_poster,id)
stadef preload$(id) : html5_attr 
   = html5_attr(_preload,id)
stadef radiogroup$(id) : html5_attr 
   = html5_attr(_radiogroup,id)
stadef readonly$(id) : html5_attr 
   = html5_attr(_readonly,id)
stadef rel$(id) : html5_attr 
   = html5_attr(_rel,id)
stadef required$(id) : html5_attr 
   = html5_attr(_required,id)
stadef reversed$(id) : html5_attr 
   = html5_attr(_reversed,id)
stadef rows$(id) : html5_attr 
   = html5_attr(_rows,id)
stadef rowspan$(id) : html5_attr 
   = html5_attr(_rowspan,id)
stadef sandbox$(id) : html5_attr 
   = html5_attr(_sandbox,id)
stadef scope$(id) : html5_attr 
   = html5_attr(_scope,id)
stadef scoped$(id) : html5_attr 
   = html5_attr(_scoped,id)
stadef selected$(id) : html5_attr 
   = html5_attr(_selected,id)
stadef shape$(id) : html5_attr 
   = html5_attr(_shape,id)
stadef size$(id) : html5_attr 
   = html5_attr(_size,id)
stadef sizes$(id) : html5_attr 
   = html5_attr(_sizes,id)
stadef slot$(id) : html5_attr 
   = html5_attr(_slot,id)
stadef span$(id) : html5_attr 
   = html5_attr(_span,id)
stadef spellcheck$(id) : html5_attr 
   = html5_attr(_spellcheck,id)
stadef src$(id) : html5_attr 
   = html5_attr(_src,id)
stadef srcdoc$(id) : html5_attr 
   = html5_attr(_srcdoc,id)
stadef srclang$(id) : html5_attr 
   = html5_attr(_srclang,id)
stadef srcset$(id) : html5_attr 
   = html5_attr(_srcset,id)
stadef start$(id) : html5_attr 
   = html5_attr(_start,id)
stadef step$(id) : html5_attr 
   = html5_attr(_step,id)
stadef style$(id) : html5_attr 
   = html5_attr(_style,id)
stadef summary$(id) : html5_attr 
   = html5_attr(_summary,id)
stadef tabindex$(id) : html5_attr 
   = html5_attr(_tabindex,id)
stadef target$(id) : html5_attr 
   = html5_attr(_target,id)
stadef title$(id) : html5_attr 
   = html5_attr(_title,id)
stadef translate$(id) : html5_attr 
   = html5_attr(_translate,id)
stadef type$(id) : html5_attr 
   = html5_attr(_type,id)
stadef usemap$(id) : html5_attr 
   = html5_attr(_usemap,id)
stadef value$(id) : html5_attr 
   = html5_attr(_value,id)
stadef width$(id) : html5_attr 
   = html5_attr(_width,id)
stadef wrap$(id) : html5_attr 
   = html5_attr(_wrap,id)

(** Combinators **)

stadef OPT$(xs0,id) : html5_attr 
  = html5_attr_opt(xs0,id)

stadef EITHER$(xs0,xs1,id) : html5_attr 
  = html5_attr_either(xs0,xs1,id)
