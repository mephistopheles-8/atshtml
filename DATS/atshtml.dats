
#include "./../HATS/project.hats"
#include "share/atspre_staload.hats"

staload "./../SATS/atshtml.sats"
#include "./../HATS/atshtml_infix.hats"

implement 
html5_elm_out$tag<html_>() = "html"
implement 
html5_elm_out$tag<head_>() = "head"
implement 
html5_elm_out$tag<title_>() = "title"
implement 
html5_elm_out$tag<base_>() = "base"
implement 
html5_elm_out$tag<link_>() = "link"
implement 
html5_elm_out$tag<meta_>() = "meta"
implement 
html5_elm_out$tag<style_>() = "style"
implement 
html5_elm_out$tag<body_>() = "body"
implement 
html5_elm_out$tag<article_>() = "article"
implement 
html5_elm_out$tag<section_>() = "section"
implement 
html5_elm_out$tag<nav_>() = "nav"
implement 
html5_elm_out$tag<aside_>() = "aside"
implement 
html5_elm_out$tag<h1_>() = "h1"
implement 
html5_elm_out$tag<h2_>() = "h2"
implement 
html5_elm_out$tag<h3_>() = "h3"
implement 
html5_elm_out$tag<h4_>() = "h4"
implement 
html5_elm_out$tag<h5_>() = "h5"
implement 
html5_elm_out$tag<h6_>() = "h6"
implement 
html5_elm_out$tag<header_>() = "header"
implement 
html5_elm_out$tag<footer_>() = "footer"
implement 
html5_elm_out$tag<p_>() = "p"
implement 
html5_elm_out$tag<address_>() = "address"
implement 
html5_elm_out$tag<hr_>() = "hr"
implement 
html5_elm_out$tag<pre_>() = "pre"
implement 
html5_elm_out$tag<blockquote_>() = "blockquote"
implement 
html5_elm_out$tag<ol_>() = "ol"
implement 
html5_elm_out$tag<ul_>() = "ul"
implement 
html5_elm_out$tag<li_>() = "li"
implement 
html5_elm_out$tag<dl_>() = "dl"
implement 
html5_elm_out$tag<dt_>() = "dt"
implement 
html5_elm_out$tag<dd_>() = "dd"
implement 
html5_elm_out$tag<figure_>() = "figure"
implement 
html5_elm_out$tag<figcaption_>() = "figcaption"
implement 
html5_elm_out$tag<main_>() = "main"
implement 
html5_elm_out$tag<div_>() = "div"
implement 
html5_elm_out$tag<a_>() = "a"
implement 
html5_elm_out$tag<em_>() = "em"
implement 
html5_elm_out$tag<strong_>() = "strong"
implement 
html5_elm_out$tag<small_>() = "small"
implement 
html5_elm_out$tag<s_>() = "s"
implement 
html5_elm_out$tag<cite_>() = "cite"
implement 
html5_elm_out$tag<q_>() = "q"
implement 
html5_elm_out$tag<dfn_>() = "dfn"
implement 
html5_elm_out$tag<abbr_>() = "abbr"
implement 
html5_elm_out$tag<ruby_>() = "ruby"
implement 
html5_elm_out$tag<rb_>() = "rb"
implement 
html5_elm_out$tag<rt_>() = "rt"
implement 
html5_elm_out$tag<rtc_>() = "rtc"
implement 
html5_elm_out$tag<rp_>() = "rp"
implement 
html5_elm_out$tag<data_>() = "data"
implement 
html5_elm_out$tag<time_>() = "time"
implement 
html5_elm_out$tag<code_>() = "code"
implement 
html5_elm_out$tag<var_>() = "var"
implement 
html5_elm_out$tag<samp_>() = "samp"
implement 
html5_elm_out$tag<kbd_>() = "kbd"
implement 
html5_elm_out$tag<sub_>() = "sub"
implement 
html5_elm_out$tag<sup_>() = "sup"
implement 
html5_elm_out$tag<i_>() = "i"
implement 
html5_elm_out$tag<b_>() = "b"
implement 
html5_elm_out$tag<u_>() = "u"
implement 
html5_elm_out$tag<mark_>() = "mark"
implement 
html5_elm_out$tag<bdi_>() = "bdi"
implement 
html5_elm_out$tag<bdo_>() = "bdo"
implement 
html5_elm_out$tag<span_>() = "span"
implement 
html5_elm_out$tag<br_>() = "br"
implement 
html5_elm_out$tag<wbr_>() = "wbr"
implement 
html5_elm_out$tag<ins_>() = "ins"
implement 
html5_elm_out$tag<del_>() = "del"
implement 
html5_elm_out$tag<picture_>() = "picture"
implement 
html5_elm_out$tag<source_>() = "source"
implement 
html5_elm_out$tag<img_>() = "img"
implement 
html5_elm_out$tag<iframe_>() = "iframe"
implement 
html5_elm_out$tag<embed_>() = "embed"
implement 
html5_elm_out$tag<object_>() = "object"
implement 
html5_elm_out$tag<param_>() = "param"
implement 
html5_elm_out$tag<video_>() = "video"
implement 
html5_elm_out$tag<audio_>() = "audio"
implement 
html5_elm_out$tag<track_>() = "track"
implement 
html5_elm_out$tag<map_>() = "map"
implement 
html5_elm_out$tag<area_>() = "area"
implement 
html5_elm_out$tag<svg_>() = "svg"
implement 
html5_elm_out$tag<math_>() = "math"
implement 
html5_elm_out$tag<table_>() = "table"
implement 
html5_elm_out$tag<caption_>() = "caption"
implement 
html5_elm_out$tag<colgroup_>() = "colgroup"
implement 
html5_elm_out$tag<col_>() = "col"
implement 
html5_elm_out$tag<tbody_>() = "tbody"
implement 
html5_elm_out$tag<thead_>() = "thead"
implement 
html5_elm_out$tag<tfoot_>() = "tfoot"
implement 
html5_elm_out$tag<tr_>() = "tr"
implement 
html5_elm_out$tag<td_>() = "td"
implement 
html5_elm_out$tag<th_>() = "th"
implement 
html5_elm_out$tag<form_>() = "form"
implement 
html5_elm_out$tag<label_>() = "label"
implement 
html5_elm_out$tag<input_>() = "input"
implement 
html5_elm_out$tag<button_>() = "button"
implement 
html5_elm_out$tag<select_>() = "select"
implement 
html5_elm_out$tag<datalist_>() = "datalist"
implement 
html5_elm_out$tag<optgroup_>() = "optgroup"
implement 
html5_elm_out$tag<option_>() = "option"
implement 
html5_elm_out$tag<textarea_>() = "textarea"
implement 
html5_elm_out$tag<output_>() = "output"
implement 
html5_elm_out$tag<progress_>() = "progress"
implement 
html5_elm_out$tag<meter_>() = "meter"
implement 
html5_elm_out$tag<fieldset_>() = "fieldset"
implement 
html5_elm_out$tag<legend_>() = "legend"
implement 
html5_elm_out$tag<details_>() = "details"
implement 
html5_elm_out$tag<summary_>() = "summary"
implement 
html5_elm_out$tag<script_>() = "script"
implement 
html5_elm_out$tag<noscript_>() = "noscript"
implement 
html5_elm_out$tag<template_>() = "template"
implement 
html5_elm_out$tag<canvas_>() = "canvas"


implement 
html5_attr_out$kind<_accept>() = "accept"
implement 
html5_attr_out$kind<_accept>() = "accept"
implement 
html5_attr_out$kind<_accesskey>() = "accesskey"
implement 
html5_attr_out$kind<_action>() = "action"
implement 
html5_attr_out$kind<_align>() = "align"
implement 
html5_attr_out$kind<_alt>() = "alt"
implement 
html5_attr_out$kind<_async>() = "async"
implement 
html5_attr_out$kind<_autocapitalize>() = "autocapitalize"
implement 
html5_attr_out$kind<_autocomplete>() = "autocomplete"
implement 
html5_attr_out$kind<_autofocus>() = "autofocus"
implement 
html5_attr_out$kind<_autoplay>() = "autoplay"
implement 
html5_attr_out$kind<_bgcolor>() = "bgcolor"
implement 
html5_attr_out$kind<_border>() = "border"
implement 
html5_attr_out$kind<_buffered>() = "buffered"
implement 
html5_attr_out$kind<_challenge>() = "challenge"
implement 
html5_attr_out$kind<_charset>() = "charset"
implement 
html5_attr_out$kind<_checked>() = "checked"
implement 
html5_attr_out$kind<_cite>() = "cite"
implement 
html5_attr_out$kind<_class>() = "class"
implement 
html5_attr_out$kind<_code>() = "code"
implement 
html5_attr_out$kind<_codebase>() = "codebase"
implement 
html5_attr_out$kind<_color>() = "color"
implement 
html5_attr_out$kind<_cols>() = "cols"
implement 
html5_attr_out$kind<_colspan>() = "colspan"
implement 
html5_attr_out$kind<_content>() = "content"
implement 
html5_attr_out$kind<_contenteditable>() = "contenteditable"
implement 
html5_attr_out$kind<_contextmenu>() = "contextmenu"
implement 
html5_attr_out$kind<_controls>() = "controls"
implement 
html5_attr_out$kind<_coords>() = "coords"
implement 
html5_attr_out$kind<_crossorigin>() = "crossorigin"
implement 
html5_attr_out$kind<_data>() = "data"
implement 
html5_attr_out$kind<_data>() = "data"
implement 
html5_attr_out$kind<_datetime>() = "datetime"
implement 
html5_attr_out$kind<_default>() = "default"
implement 
html5_attr_out$kind<_defer>() = "defer"
implement 
html5_attr_out$kind<_dir>() = "dir"
implement 
html5_attr_out$kind<_dirname>() = "dirname"
implement 
html5_attr_out$kind<_disabled>() = "disabled"
implement 
html5_attr_out$kind<_download>() = "download"
implement 
html5_attr_out$kind<_draggable>() = "draggable"
implement 
html5_attr_out$kind<_dropzone>() = "dropzone"
implement 
html5_attr_out$kind<_enctype>() = "enctype"
implement 
html5_attr_out$kind<_for>() = "for"
implement 
html5_attr_out$kind<_form>() = "form"
implement 
html5_attr_out$kind<_formaction>() = "formaction"
implement 
html5_attr_out$kind<_headers>() = "headers"
implement 
html5_attr_out$kind<_height>() = "height"
implement 
html5_attr_out$kind<_hidden>() = "hidden"
implement 
html5_attr_out$kind<_high>() = "high"
implement 
html5_attr_out$kind<_href>() = "href"
implement 
html5_attr_out$kind<_hreflang>() = "hreflang"
implement 
html5_attr_out$kind<_http_equiv>() = "http-equiv"
implement 
html5_attr_out$kind<_icon>() = "icon"
implement 
html5_attr_out$kind<_id>() = "id"
implement 
html5_attr_out$kind<_integrity>() = "integrity"
implement 
html5_attr_out$kind<_ismap>() = "ismap"
implement 
html5_attr_out$kind<_itemprop>() = "itemprop"
implement 
html5_attr_out$kind<_keytype>() = "keytype"
implement 
html5_attr_out$kind<_kind>() = "kind"
implement 
html5_attr_out$kind<_label>() = "label"
implement 
html5_attr_out$kind<_lang>() = "lang"
implement 
html5_attr_out$kind<_language>() = "language"
implement 
html5_attr_out$kind<_list>() = "list"
implement 
html5_attr_out$kind<_loop>() = "loop"
implement 
html5_attr_out$kind<_low>() = "low"
implement 
html5_attr_out$kind<_manifest>() = "manifest"
implement 
html5_attr_out$kind<_max>() = "max"
implement 
html5_attr_out$kind<_maxlength>() = "maxlength"
implement 
html5_attr_out$kind<_minlength>() = "minlength"
implement 
html5_attr_out$kind<_media>() = "media"
implement 
html5_attr_out$kind<_method>() = "method"
implement 
html5_attr_out$kind<_min>() = "min"
implement 
html5_attr_out$kind<_multiple>() = "multiple"
implement 
html5_attr_out$kind<_muted>() = "muted"
implement 
html5_attr_out$kind<_name>() = "name"
implement 
html5_attr_out$kind<_novalidate>() = "novalidate"
implement 
html5_attr_out$kind<_open>() = "open"
implement 
html5_attr_out$kind<_optimum>() = "optimum"
implement 
html5_attr_out$kind<_pattern>() = "pattern"
implement 
html5_attr_out$kind<_ping>() = "ping"
implement 
html5_attr_out$kind<_placeholder>() = "placeholder"
implement 
html5_attr_out$kind<_poster>() = "poster"
implement 
html5_attr_out$kind<_preload>() = "preload"
implement 
html5_attr_out$kind<_radiogroup>() = "radiogroup"
implement 
html5_attr_out$kind<_readonly>() = "readonly"
implement 
html5_attr_out$kind<_rel>() = "rel"
implement 
html5_attr_out$kind<_required>() = "required"
implement 
html5_attr_out$kind<_reversed>() = "reversed"
implement 
html5_attr_out$kind<_rows>() = "rows"
implement 
html5_attr_out$kind<_rowspan>() = "rowspan"
implement 
html5_attr_out$kind<_sandbox>() = "sandbox"
implement 
html5_attr_out$kind<_scope>() = "scope"
implement 
html5_attr_out$kind<_scoped>() = "scoped"
implement 
html5_attr_out$kind<_selected>() = "selected"
implement 
html5_attr_out$kind<_shape>() = "shape"
implement 
html5_attr_out$kind<_size>() = "size"
implement 
html5_attr_out$kind<_sizes>() = "sizes"
implement 
html5_attr_out$kind<_slot>() = "slot"
implement 
html5_attr_out$kind<_span>() = "span"
implement 
html5_attr_out$kind<_spellcheck>() = "spellcheck"
implement 
html5_attr_out$kind<_src>() = "src"
implement 
html5_attr_out$kind<_srcdoc>() = "srcdoc"
implement 
html5_attr_out$kind<_srclang>() = "srclang"
implement 
html5_attr_out$kind<_srcset>() = "srcset"
implement 
html5_attr_out$kind<_start>() = "start"
implement 
html5_attr_out$kind<_step>() = "step"
implement 
html5_attr_out$kind<_style>() = "style"
implement 
html5_attr_out$kind<_summary>() = "summary"
implement 
html5_attr_out$kind<_tabindex>() = "tabindex"
implement 
html5_attr_out$kind<_target>() = "target"
implement 
html5_attr_out$kind<_title>() = "title"
implement 
html5_attr_out$kind<_translate>() = "translate"
implement 
html5_attr_out$kind<_type>() = "type"
implement 
html5_attr_out$kind<_usemap>() = "usemap"
implement 
html5_attr_out$kind<_value>() = "value"
implement 
html5_attr_out$kind<_width>() = "width"
implement 
html5_attr_out$kind<_wrap>() = "wrap"

implement (a:t@ype+) 
html5$free<a>( x ) = ()

implement {id}{env1,env2}
html5$pop( e0, e1 ) = ()

fun {env:vt@ype+}
html5_out_escaped( env: &env, sm0: !strmixed0 ) : void 
  =   {
      val _ 
        = strmixed_foreach(sm0, env ) where {
            implement
            strmixed_foreach$fwork<env>( c, env ) 
              = {
                var buf = @[char][2]('\0') 
                val s : string
                  = ( case+ c of
                    | '"' => "&quot;" 
                    | '&' => "&amp;"
                    | '\''=> "&apos;"
                    | '>' => "&gt;"
                    | '<' => "&lt;"
                    |  c  => $UNSAFE.castvwtp1{string}( addr@buf )
                        where { 
                          val () = buf[0] := c
                        } 
                    ) : string

                val sm0 = string2mixed( s )

                val () = html5$out<env>(env,sm0)

                prval () = strmixed_free_notgc( sm0 )

              }
        }
  } 

implement (env:vt@ype+)
html5_elm_out<html5_elm_doctype><env>( env ) 
  = {
      val sm = string2mixed( "<!DOCTYPE html>" ) 
      val () = html5$out<env>(env,sm)
      prval () = strmixed_free_notgc( sm )
    } 

implement (tag,attrs,env:vt@ype+)
html5_elm_out<html5_elm_void(tag,attrs)><env>( env ) 
  = {
      val @(sm0,sm1,sm2) = @(
        string2mixed( "<" ), string2mixed(html5_elm_out$tag<tag>()), string2mixed(">")
      ) 
      val () = (
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm1); 
          html5_attr_list_out<attrs><env>(env);
          html5$out<env>(env,sm2); 
      )
      prval () = strmixed_free_notgc( sm0 )
      prval () = strmixed_free_notgc( sm1 )
      prval () = strmixed_free_notgc( sm2 )
    } 

implement (tag,attrs,children,env:vt@ype+)
html5_elm_out<html5_elm_normal(tag,attrs,children)><env>( env ) 
  = { 
      val @(sm0,sm1,sm2,sm3) = @(
        string2mixed( "<" ), string2mixed(html5_elm_out$tag<tag>()), string2mixed(">"), string2mixed("/")
      ) 
      val () = (
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm1); 
          html5_attr_list_out<attrs><env>(env);
          html5$out<env>(env,sm2);
          html5_elm_list_out<children><env>(env);
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm3);
          html5$out<env>(env,sm1); 
          html5$out<env>(env,sm2); 
      )
      prval () = strmixed_free_notgc( sm0 )
      prval () = strmixed_free_notgc( sm1 )
      prval () = strmixed_free_notgc( sm2 )
      prval () = strmixed_free_notgc( sm3 )
    } 

implement (id,attrs,env:vt@ype+)
html5_elm_out<html5_elm_script(attrs,id)><env>( env )
  = {
      val @(sm0,sm1,sm2,sm3,sm4) = @(
        string2mixed( "<" )
      , string2mixed(html5_elm_out$tag<script_>())
      , string2mixed(">")
      , string2mixed("/")
      , html5$script<id><env>( env )
      )
 
      val () = (
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm1); 
          html5_attr_list_out<attrs><env>(env);
          html5$out<env>(env,sm2);
          html5$out<env>(env,sm4);
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm3);
          html5$out<env>(env,sm1); 
          html5$out<env>(env,sm2); 
      )

      prval () = strmixed_free_notgc( sm0 )
      prval () = strmixed_free_notgc( sm1 )
      prval () = strmixed_free_notgc( sm2 )
      prval () = strmixed_free_notgc( sm3 )
      val   () = strmixed_free( sm4 )
  }

implement (id,attrs,env:vt@ype+)
html5_elm_out<html5_elm_style(attrs,id)><env>( env )
  = {
      val @(sm0,sm1,sm2,sm3,sm4) = @(
        string2mixed( "<" )
      , string2mixed(html5_elm_out$tag<style_>())
      , string2mixed(">")
      , string2mixed("/")
      , html5$style<id><env>( env )
      )
 
      val () = (
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm1); 
          html5_attr_list_out<attrs><env>(env);
          html5$out<env>(env,sm2);
          html5$out<env>(env,sm4);
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm3);
          html5$out<env>(env,sm1); 
          html5$out<env>(env,sm2); 
      )

      prval () = strmixed_free_notgc( sm0 )
      prval () = strmixed_free_notgc( sm1 )
      prval () = strmixed_free_notgc( sm2 )
      prval () = strmixed_free_notgc( sm3 )
      val   () = strmixed_free( sm4 )
  }

implement (id,attrs,env:vt@ype+)
html5_elm_out<html5_elm_comment(id)><env>( env )
  = {
      val @(sm0,sm1,sm2) = @(
        string2mixed( "<-- " )
      , string2mixed(" -->")
      , html5$comment<id><env>( env )
      )
 
      val () = (
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm2);
          html5$out<env>(env,sm1); 
      )

      prval () = strmixed_free_notgc( sm0 )
      prval () = strmixed_free_notgc( sm1 )
      val   () = strmixed_free( sm2 )
  }


implement (id,attrs,env:vt@ype+)
html5_elm_out<html5_elm_text(id)><env>( env )
  = {
      val sm0
       = html5$text<id><env>( env )
      val () = html5_out_escaped<env>( env, sm0 ) 
      val () = strmixed_free( sm0 )
  }


implement (id,xs0,xs1,env:vt@ype+)
html5_elm_out<html5_elm_many(xs0,xs1,id)><env>( env )
  = _html5_elm_out_many<html5_elm_many(xs0,xs1,id)><env>( env, false )
  where {
    extern
    fun {es: html5_elm }{env:vt@ype+}
      _html5_elm_out_many( &env, bool ) : void

    implement (id,xs0,xs1,env:vt@ype+)
    _html5_elm_out_many<html5_elm_many(xs0,xs1,id)><env>( env, b )
      = if html5$elm$many_has_next<id><env>( env )
        then (
          html5_elm_list_out<xs0><env>( env );
          _html5_elm_out_many<html5_elm_many(xs0,xs1,id)><env>(env,true);
          ignoret(5)
        ) else if ~b then html5_elm_list_out<xs1><env>( env ) else () 
  }

implement (id,xs0,xs1,env:vt@ype+)
html5_elm_out<html5_elm_either(xs0,xs1,id)><env>( env )
  = if html5$elm$either_isleft<id><env>( env ) 
    then html5_elm_list_out<xs0><env>( env )
    else html5_elm_list_out<xs1><env>( env )

implement (id,xs0,xs1,env:vt@ype+)
html5_elm_out<html5_elm_opt(xs0,id)><env>( env )
  = if html5$elm$opt_issome<id><env>( env ) 
    then html5_elm_list_out<xs0><env>( env )
    else ()

implement (id,xs0,xs1,env0:vt@ype+,env1:vt@ype+)
html5_elm_out<html5_elm_frame(env1,xs0,id)><env0>( env )
  = {
    var env' : env1 
        = html5$push<id><env0,env1>(env) 
    val () = html5_elm_list_out<xs0><env1>( env' )
    val () = html5$pop<id><env0,env1>(env,env')
    val () = html5$free<env1>(env')
  }

implement (env:vt@ype+)
html5_elm_list_out<enil><env>( env ) = () 

implement (env:vt@ype+,xs,elm)
html5_elm_list_out<elm :*: xs><env>( env ) 
  = (
    html5_elm_out<elm><env>( env );
    html5_elm_list_out<xs><env>( env );
    ignoret(5);
  ) 

implement (id,kind,env:vt@ype+) 
html5_attr_out<html5_attr(kind,id)><env>( env ) 
  = {
      val @(sm0,sm1,sm2,sm3) = @(
        string2mixed( "=" )
      , string2mixed("\"")
      , html5$attr<id><env>( env )
      , string2mixed(html5_attr_out$kind<kind>())
      )

      val () = (
          html5$out<env>(env,sm3);
          html5$out<env>(env,sm0);
          html5$out<env>(env,sm1);
          html5_out_escaped<env>(env,sm2);
          html5$out<env>(env,sm1); 
      )

      prval () = strmixed_free_notgc( sm0 )
      prval () = strmixed_free_notgc( sm1 )
      val () = strmixed_free( sm2 )
      prval () = strmixed_free_notgc( sm3 )
  }


implement (env:vt@ype+)
html5_attr_list_out<anil><env>( env ) = () 

implement (env:vt@ype+,xs,attr)
html5_attr_list_out<attr :@: xs><env>( env ) 
  =  {
    val sm0 = string2mixed(" ")
    val () = (
      html5$out<env>(env,sm0);
      html5_attr_out<attr><env>( env );
      html5_attr_list_out<xs><env>( env );
      ignoret(5);
    )
    prval () = strmixed_free_notgc( sm0 )
  } 






















 
