
#include "./../HATS/project.hats"

(** Inefficient, but useful bitwise ops in the statics **)

stadef has_bit( vec: int, pow2 : int ) : bool =
   (  (vec / pow2 ) % 2 == 1 )

stadef set_bit( vec: int, pow2 : int ) : int =
    ( ifint(has_bit(vec,pow2), vec, vec + pow2) )

stadef unset_bit( vec: int, pow2 : int ) : int =
    ( ifint(has_bit(vec,pow2), vec - pow2, vec ) )

stadef bit_bind ( b:bool, vec:int, pow2:int ) : int =
    ( ifint(b,set_bit(vec,pow2), unset_bit(vec,pow2)) )

stadef _lor8( vec: int, x : int ) : int =
    ( ifint(has_bit(vec,1) || has_bit(x,1), 1, 0 ) +
      ifint(has_bit(vec,2) || has_bit(x,2), 2, 0 ) +
      ifint(has_bit(vec,4) || has_bit(x,4), 4, 0 ) +
      ifint(has_bit(vec,8) || has_bit(x,8), 8, 0 ) +
      ifint(has_bit(vec,16) || has_bit(x,16), 16, 0 ) +
      ifint(has_bit(vec,32) || has_bit(x,32), 32, 0 ) +
      ifint(has_bit(vec,64) || has_bit(x,64), 64, 0 ) +
      ifint(has_bit(vec,128) || has_bit(x,128), 128, 0 ) )

stadef _lor12( vec: int, x : int ) : int =
    ( _lor8(vec, x) +
      ifint(has_bit(vec,256) || has_bit(x,256), 256, 0 ) +
      ifint(has_bit(vec,512) || has_bit(x,512), 512, 0 ) +
      ifint(has_bit(vec,1024) || has_bit(x,1024), 1024, 0 ) + 
      ifint(has_bit(vec,2048) || has_bit(x,2048), 2048, 0 ) 
    )

stadef _lor16( vec: int, x : int ) : int =
    ( _lor8(vec, x) +
      ifint(has_bit(vec,256) || has_bit(x,256), 256, 0 ) +
      ifint(has_bit(vec,512) || has_bit(x,512), 512, 0 ) +
      ifint(has_bit(vec,1024) || has_bit(x,1024), 1024, 0 ) +
      ifint(has_bit(vec,2048) || has_bit(x,2048), 2048, 0 ) +
      ifint(has_bit(vec,4096) || has_bit(x,4096), 4096, 0 ) +
      ifint(has_bit(vec,8192) || has_bit(x,8192), 8192, 0 ) +
      ifint(has_bit(vec,16384) || has_bit(x,16384), 16384, 0 ) +
      ifint(has_bit(vec,32768) || has_bit(x,32768), 32768, 0 ) )

(** This requires the end-user to run the proof arguments,
    but it improves performance  greatly: generally makes the difference 
    between tractable and not tractable (and improves error messages ever slightly).
**)
stacst lor8 : ( int, int ) -> int = "ext#"
stacst lor12 : ( int, int ) -> int = "ext#"
stacst lor16 : ( int, int ) -> int = "ext#"

praxi lor8_define{vec,x:int}() : [ lor8(vec,x) == _lor8(vec,x) ] void 
praxi lor12_define{vec,x:int}() : [ lor12(vec,x) == _lor12(vec,x) ] void 
praxi lor16_define{vec,x:int}() : [ lor16(vec,x) == _lor16(vec,x) ] unit_p 
praxi ifint_define{b:bool}{x,y:int}() : [(b && ifint(b,x,y) == x) || (~b && ifint(b,x,y) == y)] unit_p


sortdef content_kind = int
stadef uncategorized     = 0 // includes: document_root
stadef metadata          = 128
stadef flow              = 256
stadef sectioning        = 512 // includes: sectioning root
stadef heading           = 1024
stadef phrasing          = 2048
stadef embedded          = 4096
stadef interactive       = 8192
stadef scripting         = 16384
(*
stadef document_root     = 32768
stadef sectioning_root   = 65536
stadef palpable          = 131072
*)
sortdef html5_tag = int

stadef html_       = 0  
stadef head_       = 129 //1  + metadata
stadef title_      = 130 //2  + metadata
stadef base_       = 131 //3  + metadata
stadef link_       = 132 //4  + metadata
stadef meta_       = 133 //5  + metadata
stadef style_      = 134 //6  + metadata
stadef body_       = 775 //7  + sectioning
stadef article_    = 776 //8  + sectioning + flow 
stadef section_    = 777 //9  + sectioning + flow 
stadef nav_        = 778 //10 + sectioning + flow 
stadef aside_      = 779 //11 + sectioning + flow 
stadef h1_         = 1292 //12 + heading + flow 
stadef h2_         = 1293 //13 + heading + flow 
stadef h3_         = 1294 //14 + heading + flow 
stadef h4_         = 1295 //15 + heading + flow 
stadef h5_         = 1296 //16 + heading + flow 
stadef h6_         = 1297 //17 + heading + flow 
stadef header_     = 274 //18 + flow 
stadef footer_     = 275 //19 + flow 
stadef p_          = 276 //20 + flow 
stadef address_    = 277 //21 + flow 
stadef hr_         = 278 //22 + flow
stadef pre_        = 279 //23 + flow 
stadef blockquote_ = 792 //24 + sectioning + flow 
stadef ol_         = 281 // 25 + flow 
stadef ul_         = 282 //26 + flow 
stadef li_         = 27
stadef dl_         = 284 //28 + flow 
stadef dt_         = 29
stadef dd_         = 30
stadef figure_     = 799 //31 + sectioning + flow 
stadef figcaption_ = 32
stadef main_       = 289 //33 + flow 
stadef div_        = 290 //34 + flow 
stadef a_          = 10531//35 + phrasing + flow  + interactive
stadef em_         = 2340 //36 + phrasing + flow 
stadef strong_     = 2341 //37 + phrasing + flow 
stadef small_      = 2342 //38 + phrasing + flow 
stadef s_          = 2343 //39 + phrasing + flow 
stadef cite_       = 2344 //40 + phrasing + flow 
stadef q_          = 2345 //41 + phrasing + flow 
stadef dfn_        = 2346 //42 + phrasing + flow 
stadef abbr_       = 2347 //43 + phrasing + flow 
stadef ruby_       = 2348 //44 + phrasing + flow 
stadef rb_         = 45
stadef rt_         = 46
stadef rtc_        = 47
stadef rp_         = 48
stadef data_       = 2353 //49 + phrasing + flow 
stadef time_       = 2354 //50 + phrasing + flow 
stadef code_       = 2355 //51 + phrasing + flow 
stadef var_        = 2356 //52 + phrasing + flow 
stadef samp_       = 2357 //53 + phrasing + flow 
stadef kbd_        = 2358 // 54 + phrasing + flow 
stadef sub_        = 2359 //55 + phrasing + flow 
stadef sup_        = 2360 //56 + phrasing + flow 
stadef i_          = 2361 //57 + phrasing + flow 
stadef b_          = 2362 // 58 + phrasing + flow 
stadef u_          = 2363 // 59 + phrasing + flow 
stadef mark_       = 2364 // 60 + phrasing + flow 
stadef bdi_        = 2365//61 + phrasing + flow 
stadef bdo_        = 2366 // 62 + phrasing + flow 
stadef span_       = 2367 //63 + phrasing + flow 
stadef br_         = 2368 //64 + phrasing + flow
stadef wbr_        = 2369 //65 + phrasing + flow
stadef ins_        = 2370 //66 + phrasing + flow 
stadef del_        = 2371 //67 + phrasing + flow 
stadef picture_    = 6468 //68 + phrasing + flow + embedded
stadef source_     = 69
stadef img_        = 6470 //70 + phrasing + flow  + embedded
stadef iframe_     = 14663 //71 + phrasing + flow  + embedded + interactive
stadef embed_      = 14664 //72 + phrasing + flow  + embedded + interactive
stadef object_     = 14665 //73 + phrasing + flow  + embedded + interactive
stadef param_      = 74
stadef video_      = 14667 //75 + phrasing + flow  + embedded + interactive
stadef audio_      = 14668 //76 + phrasing + flow  + embedded + interactive
stadef track_      = 77
stadef map_        = 2382 //78 + phrasing + flow 
stadef area_       = 2383 //79 + phrasing + flow
stadef svg_        = 6480 //80 + phrasing + flow  + embedded
stadef math_       = 6481 //81 + phrasing + flow  + embedded
stadef table_      = 338 //82 + flow 
stadef caption_    = 83
stadef colgroup_   = 84
stadef col_        = 85
stadef tbody_      = 86
stadef thead_      = 87
stadef tfoot_      = 88
stadef tr_         = 89
stadef td_         = 602 //90 + sectioning
stadef th_         = 91
stadef form_       = 348 //92 + flow 
stadef label_      = 2397// 93 + phrasing + flow 
stadef input_      = 10590 //94 + phrasing + flow  + interactive
stadef button_     = 10591 //95 + phrasing + flow  + interactive
stadef select_     = 2400 //96 + phrasing + flow 
stadef datalist_   = 2401 //97 + phrasing + flow
stadef optgroup_   = 98
stadef option_     = 99
stadef textarea_   = 2404//100 + phrasing + flow 
stadef output_     = 2405//101 + phrasing + flow 
stadef progress_   = 2406//102 + phrasing + flow 
stadef meter_      = 2407//103 + phrasing + flow 
stadef fieldset_   = 872 //104 + sectioning + flow 
stadef legend_     = 105
stadef details_    = 2410 //106 + phrasing + flow 
stadef summary_    = 107
stadef script_     = 18924//108 + phrasing + flow + metadata + scripting
stadef noscript_   = 2541 //109 + phrasing + flow + metadata
stadef template_   = 18926 //110 + phrasing + flow + metadata + scripting
stadef canvas_     = 6511 //111 + phrasing + flow  + embedded

stadef is_metadata         (tag:html5_tag) : bool
    = has_bit(tag,metadata)

stadef is_flow             (tag:html5_tag) : bool
    = has_bit(tag,flow)
 
stadef is_sectioning       (tag:html5_tag) : bool
    = has_bit(tag,sectioning)

stadef is_heading          (tag:html5_tag) : bool
    = has_bit(tag,heading)

stadef is_phrasing         (tag:html5_tag) : bool
    = has_bit(tag,phrasing)

stadef is_embedded         (tag:html5_tag) : bool
    = has_bit(tag,embedded)

stadef is_interactive      (tag:html5_tag) : bool
    = has_bit(tag,interactive)

stadef is_scripting        (tag:html5_tag) : bool
    = has_bit(tag,scripting)

stadef is_transparent ( tag:html5_tag ) : bool
  = ( tag == ins_ ||
      tag == del_ ||
      tag == map_ ||
      tag == a_ || 
      tag == canvas_ ||
      tag == audio_ ||
      tag == video_ ||
      tag == noscript_ ||
      tag == object_ ) 

sortdef html5_attr_kind = int

stadef _accept           = 1
stadef _accept_charset   = 2
stadef _accesskey        = 3
stadef _action           = 4
stadef _align            = 5
stadef _alt              = 6
stadef _async            = 7
stadef _autocapitalize   = 8
stadef _autocomplete     = 9
stadef _autofocus        = 10
stadef _autoplay         = 11
stadef _bgcolor          = 12
stadef _border           = 13
stadef _buffered         = 14
stadef _challenge        = 15
stadef _charset          = 16
stadef _checked          = 17
stadef _cite             = 18
stadef _class            = 19
stadef _code             = 20
stadef _codebase         = 21
stadef _color            = 22
stadef _cols             = 23
stadef _colspan          = 24
stadef _content          = 25
stadef _contenteditable  = 26
stadef _contextmenu      = 27
stadef _controls         = 28
stadef _coords           = 29
stadef _crossorigin      = 30
stadef _data             = 31
stadef _data_kv          = 32
stadef _datetime         = 33
stadef _default          = 34
stadef _defer            = 35
stadef _dir              = 36
stadef _dirname          = 37
stadef _disabled         = 38
stadef _download         = 39
stadef _draggable        = 40
stadef _dropzone         = 41
stadef _enctype          = 42
stadef _for              = 43
stadef _form             = 44
stadef _formaction       = 45
stadef _headers          = 46
stadef _height           = 47
stadef _hidden           = 48
stadef _high             = 49
stadef _href             = 50
stadef _hreflang         = 51
stadef _http_equiv       = 52
stadef _icon             = 53
stadef _id               = 54
stadef _integrity        = 55
stadef _ismap            = 56
stadef _itemprop         = 57
stadef _keytype          = 58
stadef _kind             = 59
stadef _label            = 60
stadef _lang             = 61
stadef _language         = 62
stadef _list             = 63
stadef _loop             = 64
stadef _low              = 65
stadef _manifest         = 66
stadef _max              = 67
stadef _maxlength        = 68
stadef _minlength        = 69
stadef _media            = 70
stadef _method           = 71
stadef _min              = 72
stadef _multiple         = 73
stadef _muted            = 74
stadef _name             = 75
stadef _novalidate       = 76
stadef _open             = 77
stadef _optimum          = 78
stadef _pattern          = 79
stadef _ping             = 80
stadef _placeholder      = 81
stadef _poster           = 82
stadef _preload          = 83
stadef _radiogroup       = 84
stadef _readonly         = 85
stadef _rel              = 86
stadef _required         = 87
stadef _reversed         = 88
stadef _rows             = 89
stadef _rowspan          = 90
stadef _sandbox          = 91
stadef _scope            = 92
stadef _scoped           = 93
stadef _selected         = 94
stadef _shape            = 95
stadef _size             = 96
stadef _sizes            = 97
stadef _slot             = 98
stadef _span             = 99
stadef _spellcheck       = 100
stadef _src              = 101
stadef _srcdoc           = 102
stadef _srclang          = 103
stadef _srcset           = 104
stadef _start            = 105
stadef _step             = 106
stadef _style            = 107
stadef _summary          = 108
stadef _tabindex         = 109
stadef _target           = 110
stadef _title            = 111
stadef _translate        = 112
stadef _type             = 113
stadef _usemap           = 114
stadef _value            = 115
stadef _width            = 116
stadef _wrap             = 117

sortdef svg_tag = int

stadef svg_a = 1
stadef svg_altGlyph = 2
stadef svg_altGlyphDef = 3
stadef svg_altGlyphItem = 4
stadef svg_animate = 5
stadef svg_animateColor = 6
stadef svg_animateMotion = 7
stadef svg_animateTransform = 8
stadef svg_circle = 9
stadef svg_clipPath = 10
stadef svg_color_profile = 11
stadef svg_cursor = 12
stadef svg_defs = 13
stadef svg_desc = 14
stadef svg_discard = 15
stadef svg_ellipse = 16
stadef svg_feBlend = 17
stadef svg_feColorMatrix = 18
stadef svg_feComponentTransfer = 19
stadef svg_feComposite = 20
stadef svg_feConvolveMatrix = 21
stadef svg_feDiffuseLighting = 22
stadef svg_feDisplacementMap = 23
stadef svg_feDistantLight = 24
stadef svg_feDropShadow = 25
stadef svg_feFlood = 26
stadef svg_feFuncA = 27
stadef svg_feFuncB = 28
stadef svg_feFuncG = 29
stadef svg_feFuncR = 30
stadef svg_feGaussianBlur = 31
stadef svg_feImage = 32
stadef svg_feMerge = 33
stadef svg_feMergeNode = 34
stadef svg_feMorphology = 35
stadef svg_feOffset = 36
stadef svg_fePointLight = 37
stadef svg_feSpecularLighting = 38
stadef svg_feSpotLight = 39
stadef svg_feTile = 40
stadef svg_feTurbulence = 41
stadef svg_filter = 42
stadef svg_font = 43
stadef svg_font_face = 44
stadef svg_font_face_format = 45
stadef svg_font_face_name = 46
stadef svg_font_face_src = 47
stadef svg_font_face_uri = 48
stadef svg_foreignObject = 49
stadef svg_g = 50
stadef svg_glyph = 51
stadef svg_glyphRef = 52
stadef svg_hatch = 53
stadef svg_hatchpath = 54
stadef svg_hkern = 55
stadef svg_image = 56
stadef svg_line = 57
stadef svg_linearGradient = 58
stadef svg_marker = 59
stadef svg_mask = 60
stadef svg_mesh = 61
stadef svg_meshgradient = 62
stadef svg_meshpatch = 63
stadef svg_meshrow = 64
stadef svg_metadata = 65
stadef svg_missing_glyph = 66
stadef svg_mpath = 67
stadef svg_path = 68
stadef svg_pattern = 69
stadef svg_polygon = 70
stadef svg_polyline = 71
stadef svg_radialGradient = 72
stadef svg_rect = 73
stadef svg_script = 74
stadef svg_set = 75
stadef svg_solidcolor = 76
stadef svg_stop = 77
stadef svg_style = 78
stadef svg_svg = 79
stadef svg_switch = 80
stadef svg_symbol = 81
stadef svg_text = 82
stadef svg_textPath = 83
stadef svg_title = 84
stadef svg_tref = 85
stadef svg_tspan = 86
stadef svg_unknown = 87
stadef svg_use = 88
stadef svg_view = 89
stadef svg_vkern = 90

(** This list may be incomplete **)
sortdef mathml_tag = int

stadef math_maction = 1
stadef math_math = 2
stadef math_menclose = 3
stadef math_merror = 4
stadef math_mfenced = 5
stadef math_mfrac = 6
stadef math_mglyph = 7
stadef math_mi = 8
stadef math_mlabeledtr = 9
stadef math_mmultiscripts = 10
stadef math_mn = 11
stadef math_mo = 12
stadef math_mover = 13
stadef math_mpadded = 14
stadef math_mphantom = 15
stadef math_mroot = 16
stadef math_mrow = 17
stadef math_ms = 18
stadef math_mspace = 19
stadef math_msqrt = 20
stadef math_mstyle = 21
stadef math_msub = 22
stadef math_msubsup = 23
stadef math_msup = 24
stadef math_mtable = 25
stadef math_mtd = 26
stadef math_mtext = 27
stadef math_mtr = 28
stadef math_munder = 29
stadef math_munderover = 30
stadef math_semantics = 31

(** The goal here is to make sure we can verify
    the attribute kind at compile time.  In that
    sense, the attribute kind is never truely dynamic
**)
datasort html5_attr =
  | html5_attr of (html5_attr_kind,int)
  
  (** Combinators **)
  (** Simple conditional **)
  | html5_attr_opt of (html5_attr_list,int)
  (** Either a or b **)
  | html5_attr_either of (html5_attr_list,html5_attr_list,int)
  (**     **      **)

and  html5_attr_list =
  | html5_attr_list_nil
  | html5_attr_list_cons of (html5_attr, html5_attr_list)
 
datasort html5_elm =
  | html5_elm_doctype
  | html5_elm_void of (html5_tag,html5_attr_list)
  | html5_elm_normal of (html5_tag,html5_attr_list, html5_elm_list) 
  | html5_elm_script of (html5_attr_list,int) 
  | html5_elm_style of (html5_attr_list,int) 
  | html5_elm_comment of (int) 
  | html5_elm_text of (int)

  (** Combinators **)
  (** Used to output repeating streams of elements **)
  | html5_elm_many of (html5_elm_list, (** On empty **)html5_elm_list, int)
  (** Either a or b **)
  | html5_elm_either of (html5_elm_list, html5_elm_list, int)
  (** Simple conditional **)
  | html5_elm_opt of (html5_elm_list, int)
  (** Subdoc: push new state **)
  | html5_elm_frame of (vt@ype+,html5_elm_list,int)
  
  (**     **      **)

and html5_elm_list =
  | html5_elm_list_nil
  | html5_elm_list_cons of ( html5_elm, html5_elm_list )

(** User defined **)

(** Attr value **)
fun {id:int}{env:vt@ype+}
  html5$attr( &env ) : strmixed1

(** Script text **)
fun {id:int}{env:vt@ype+}
  html5$script( &env ) : strmixed1

(** Comment text **)
fun {id:int}{env:vt@ype+}
  html5$comment( &env ) : strmixed1

(** Text **)
fun {id:int}{env:vt@ype+}
  html5$text( &env ) : strmixed1

(** Style Text **)
fun {id:int}{env:vt@ype+}
  html5$style( &env ) : strmixed1


(** For pushing different state to the stack **)
fun {id:int}{env0,env1:vt@ype+}
  html5$push( &env0 ) : env1

fun {id:int}{env0,env1:vt@ype+}
  html5$pop( &env0, &env1 ) : void

fun {env1:vt@ype+}
  html5$free( env1 ) : void

(** Returns true if we want to display the next elm, false otherwise;
    If it returns false on the first iteration, it will show the 
    alternative elms 
**)

(** 
  Should we use a new "env" during the "many" phase?  I suppose
  it's not strictly necessary.  env becomes an iterator in that
  case, but I suppose it might also be annoying that we need
  to preserve iterator state over multiple calls...

  I suppose these all signal a "branch" -- the user could do what they
  will.
**)

fun {id:int}{env:vt@ype+}
  html5$attr$either_isleft( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$attr$opt_issome( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$elm$many_has_next( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$elm$either_isleft( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$elm$opt_issome( &env ) : bool

fun {env:vt@ype+}
  html5$out( &env, !strmixed1 ) : void

(** ** ** ** ** **)

fun {es: html5_tag }
  html5_elm_out$tag( ) : string

fun {es: html5_elm }{env:vt@ype+}
  html5_elm_out( &env ) : void

fun {es: html5_attr_kind }
  html5_attr_out$kind( ) : string

fun {es: html5_attr }{env:vt@ype+}
  html5_attr_out( &env ) : void

fun {es: html5_attr_list }{env:vt@ype+}
  html5_attr_list_out( &env ) : void
 
fun {es: html5_elm_list }{env:vt@ype+}
  html5_elm_list_out( &env ) : void 
 

 
