#ifndef _ATSHTML_INFIX_HATS
#define _ATSHTML_INFIX_HATS

infixr :@:
infixr :*:
#define anil html5_attr_list_nil
#define :@: html5_attr_list_cons

#define enil html5_elm_list_nil
#define :*: html5_elm_list_cons

#define text   html5_elm_text
#define script html5_elm_script
#define style  html5_elm_style
#define comment html5_elm_comment

#endif
