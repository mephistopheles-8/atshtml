
#include "./../HATS/project.hats"

staload "./atshtml.sats"
staload "./atshtml_elms.sats"
staload "./atshtml_attrs.sats"

#include "./../HATS/atshtml_infix.hats"

sortdef html5_ctx = int
stadef html5_ctx_init         = 0
stadef html5_ctx_sectioning   = 1
stadef html5_ctx_main         = 2
stadef html5_ctx_media        = 4
stadef html5_ctx_form         = 8
stadef html5_ctx_interactive  = 16
stadef html5_ctx_dfn          = 32
stadef html5_ctx_area         = 64
stadef html5_ctx_meter        = 128
stadef html5_ctx_progress     = 256 
stadef html5_ctx_noscript     = 512
stadef html5_ctx_heading      = 1024

stadef html5_content_flow( tag : html5_tag ) : bool = (
    tag == body_ ||
    tag == article_ ||
    tag == section_ ||
    tag == nav_ ||
    tag == aside_ ||
    tag == blockquote_ ||
    tag == li_ ||
    tag == dt_ ||
    tag == dd_ ||
    tag == figure_ ||
    tag == figcaption_ ||
    tag == main_ ||
    tag == div_ ||
    tag == caption_ ||
    tag == td_ ||
    tag == th_ ||
    tag == form_
  )

stadef html5_content_phrasing( tag : html5_tag ) : bool = (
    html5_content_flow(tag) ||
    tag == h1_ || 
    tag == h2_ || 
    tag == h3_ || 
    tag == h4_ || 
    tag == h5_ || 
    tag == h6_ || 
    tag == p_ || 
    tag == pre_ || 
    tag == em_ || 
    tag == strong_ || 
    tag == small_ || 
    tag == s_ || 
    tag == cite_ || 
    tag == q_ || 
    tag == dfn_ || 
    tag == abbr_ || 
    tag == rb_ || 
    tag == rt_ || 
    tag == rtc_ || 
    tag == rp_ || 
    tag == data_ || 
    tag == code_ || 
    tag == var_ || 
    tag == samp_ || 
    tag == kbd_ || 
    tag == sub_ || 
    tag == sup_ || 
    tag == i_ || 
    tag == b_ || 
    tag == u_ || 
    tag == mark_ || 
    tag == bdi_ || 
    tag == bdo_ || 
    tag == span_ || 
    tag == output_ || 
    tag == progress_ || 
    tag == meter_ 
  )



stacst html5_cnst_both : (html5_tag -> bool, html5_tag -> bool ) -> (html5_tag -> bool)

prfn html5_cnst_both_define{f1,f2: html5_tag -> bool}{tag:html5_tag}() 
  : [ html5_cnst_both(f1,f2)(tag) == (f1(tag) && f2(tag)) ] void 


dataprop ElmAttrs(tag:html5_tag,ax:html5_attr_list) = 
  |  ElmAttrsNil(tag,anil)
  | {attr:html5_attr}{ax:html5_attr_list}
     ElmAttrsCons(tag, attr :@: ax )
      of (ElmAttr(tag,attr), ElmAttrs(tag,ax))
and ElmAttr(html5_tag,html5_attr) =
  | {id:int}
    Charset$(meta_, charset$(id))

dataprop ElmChildren(par:html5_tag,es:html5_elm_list,cnst: html5_tag -> bool) =
  |  ElmChildrenNil(par,enil,cnst)
  |  {chi:html5_elm}{es:html5_elm_list}
     ElmChildrenCons(par,chi :*: es,cnst) 
      of (ElmChild(par,chi,cnst), ElmChildren(par,es,cnst))

and ElmChild(par:html5_tag,chi:html5_elm,cnst: html5_tag -> bool) =
  | {id:int}{par: html5_tag |  html5_content_phrasing(par) || par == title_}
     Text'(par,text'(id),cnst) 
  | {id:int}
    Comment'(par,comment'(id),cnst)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}{cnst(head_)}
    {cnst(head_)}
    Head'(html_,head'(attrs,nodes),cnst) 
      of (ElmAttrs(head_,attrs), ElmChildren(head_,nodes,cnst))
  | {id:int} {cnst(title_)}
    Title'(head_,title'(id),cnst) 
  | {attrs:html5_attr_list}{cnst(base_)} 
    {cnst(base_)}
    Base'(head_,base'(attrs),cnst)  of ElmAttrs(base_,attrs)
  | {attrs:html5_attr_list}{cnst(link_)} 
    {cnst(link_)}
    Link'(head_,link'(attrs),cnst)  of ElmAttrs(link_,attrs)
  | {attrs:html5_attr_list}{cnst(meta_)} 
    {cnst(meta_)}
    Meta'(head_,meta'(attrs),cnst)  of ElmAttrs(meta_,attrs)
  | {id:int}{attrs:html5_attr_list}{cnst(style_)} 
    {cnst(style_)}
    Style'(head_,style'(attrs,id),cnst)  of ElmAttrs(style_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}{cnst(body_)}
    {cnst(body_)}
    Body'(html_,body'(attrs,nodes),cnst) 
      of (ElmAttrs(body_,attrs), ElmChildren(body_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(article_)}
    Article'(par,article'(attrs,nodes),cnst) 
      of (ElmAttrs(article_,attrs), ElmChildren(article_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(section_)}
    Section'(par,section'(attrs,nodes),cnst) 
      of (ElmAttrs(section_,attrs), ElmChildren(section_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(nav_)}
    Nav'(par,nav'(attrs,nodes),cnst) 
      of (ElmAttrs(nav_,attrs), ElmChildren(nav_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(aside_)}
    Aside'(par,aside'(attrs,nodes),cnst) 
      of (ElmAttrs(aside_,attrs), ElmChildren(aside_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h1_)}
    H1'(par,h1'(attrs,nodes),cnst) 
      of (ElmAttrs(h1_,attrs), ElmChildren(h1_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h2_)}
    H2'(par,h2'(attrs,nodes),cnst) 
      of (ElmAttrs(h2_,attrs), ElmChildren(h2_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h3_)}
    H3'(par,h3'(attrs,nodes),cnst) 
      of (ElmAttrs(h3_,attrs), ElmChildren(h3_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h4_)}
    H4'(par,h4'(attrs,nodes),cnst) 
      of (ElmAttrs(h4_,attrs), ElmChildren(h4_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h5_)}
    H5'(par,h5'(attrs,nodes),cnst) 
      of (ElmAttrs(h5_,attrs), ElmChildren(h5_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h6_)}
    H6'(par,h6'(attrs,nodes),cnst) 
      of (ElmAttrs(h6_,attrs), ElmChildren(h6_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(header_)}
    Header'(par,header'(attrs,nodes),cnst) 
      of (ElmAttrs(header_,attrs), ElmChildren(header_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(footer_)}
    Footer'(par,footer'(attrs,nodes),cnst) 
      of (ElmAttrs(footer_,attrs), ElmChildren(footer_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(p_)}
    P'(par,p'(attrs,nodes),cnst) 
      of (ElmAttrs(p_,attrs), ElmChildren(p_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(address_)}
    Address'(par,address'(attrs,nodes),cnst) 
      of (ElmAttrs(address_,attrs), ElmChildren(address_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list} 
    {cnst(hr_)}
    Hr'(par,hr'(attrs),cnst)  of ElmAttrs(hr_,attrs)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(pre_)}
    Pre'(par,pre'(attrs,nodes),cnst) 
      of (ElmAttrs(pre_,attrs), ElmChildren(pre_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(blockquote_)}
    Blockquote'(par,blockquote'(attrs,nodes),cnst) 
      of (ElmAttrs(blockquote_,attrs), ElmChildren(blockquote_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ol_)}
    Ol'(par,ol'(attrs,nodes),cnst) 
      of (ElmAttrs(ol_,attrs), ElmChildren(ol_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ul_)}
    Ul'(par,ul'(attrs,nodes),cnst) 
      of (ElmAttrs(ul_,attrs), ElmChildren(ul_,nodes,cnst))
  | {par:html5_tag | par == ul_ || par == ol_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(li_)}
    Li'(par,li'(attrs,nodes),cnst) 
      of (ElmAttrs(li_,attrs), ElmChildren(li_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dl_)}
    Dl'(par,dl'(attrs,nodes),cnst) 
      of (ElmAttrs(dl_,attrs), ElmChildren(dl_,nodes,cnst))
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dt_)}
    Dt'(par,dt'(attrs,nodes),cnst) 
      of (ElmAttrs(dt_,attrs), ElmChildren(dt_,nodes,cnst))
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dd_)}
    Dd'(par,dd'(attrs,nodes),cnst) 
      of (ElmAttrs(dd_,attrs), ElmChildren(dd_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(figure_)}
    Figure'(par,figure'(attrs,nodes),cnst) 
      of (ElmAttrs(figure_,attrs), ElmChildren(figure_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(figcaption_)}
    Figcaption'(par,figcaption'(attrs,nodes),cnst) 
      of (ElmAttrs(figcaption_,attrs), ElmChildren(figcaption_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(main_)}
    Main'(par,main'(attrs,nodes),cnst) 
      of (ElmAttrs(main_,attrs), ElmChildren(main_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(div_)}
    Div'(par,div'(attrs,nodes),cnst) 
      of (ElmAttrs(div_,attrs), ElmChildren(div_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(a_)}
    A'(par,a'(attrs,nodes),cnst) 
      of (ElmAttrs(a_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(em_)}
    Em'(par,em'(attrs,nodes),cnst) 
      of (ElmAttrs(em_,attrs), ElmChildren(em_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(strong_)}
    Strong'(par,strong'(attrs,nodes),cnst) 
      of (ElmAttrs(strong_,attrs), ElmChildren(strong_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(small_)}
    Small'(par,small'(attrs,nodes),cnst) 
      of (ElmAttrs(small_,attrs), ElmChildren(small_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(s_)}
    S'(par,s'(attrs,nodes),cnst) 
      of (ElmAttrs(s_,attrs), ElmChildren(s_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(q_)}
    Q'(par,q'(attrs,nodes),cnst) 
      of (ElmAttrs(q_,attrs), ElmChildren(q_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(cite_)}
    Cite'(par,cite'(attrs,nodes),cnst) 
      of (ElmAttrs(cite_,attrs), ElmChildren(cite_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dfn_)}
    Dfn'(par,dfn'(attrs,nodes),cnst) 
      of (ElmAttrs(dfn_,attrs), ElmChildren(dfn_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(abbr_)}
    Abbr'(par,abbr'(attrs,nodes),cnst) 
      of (ElmAttrs(abbr_,attrs), ElmChildren(abbr_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ruby_)}
    Ruby'(par,ruby'(attrs,nodes),cnst) 
      of (ElmAttrs(ruby_,attrs), ElmChildren(ruby_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(rb_)}
    Rb'(par,rb'(attrs,nodes),cnst) 
      of (ElmAttrs(rb_,attrs), ElmChildren(rb_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(rt_)}
    Rt'(par,rt'(attrs,nodes),cnst) 
      of (ElmAttrs(rt_,attrs), ElmChildren(rt_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(rtc_)}
    Rtc'(par,rtc'(attrs,nodes),cnst) 
      of (ElmAttrs(rtc_,attrs), ElmChildren(rtc_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(rp_)}
    Rp'(par,rp'(attrs,nodes),cnst) 
      of (ElmAttrs(rp_,attrs), ElmChildren(rp_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(data_)}
    Data'(par,data'(attrs,nodes),cnst) 
      of (ElmAttrs(data_,attrs), ElmChildren(data_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(time_)}
    Time'(par,time'(attrs,nodes),cnst) 
      of (ElmAttrs(time_,attrs), ElmChildren(time_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(code_)}
    Code'(par,code'(attrs,nodes),cnst) 
      of (ElmAttrs(code_,attrs), ElmChildren(code_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(var_)}
    Var'(par,var'(attrs,nodes),cnst) 
      of (ElmAttrs(var_,attrs), ElmChildren(var_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(samp_)}
    Samp'(par,samp'(attrs,nodes),cnst) 
      of (ElmAttrs(samp_,attrs), ElmChildren(samp_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(kbd_)}
    Kbd'(par,kbd'(attrs,nodes),cnst) 
      of (ElmAttrs(kbd_,attrs), ElmChildren(kbd_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(sub_)}
    Sub'(par,sub'(attrs,nodes),cnst) 
      of (ElmAttrs(sub_,attrs), ElmChildren(sub_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(sup_)}
    Sup'(par,sup'(attrs,nodes),cnst) 
      of (ElmAttrs(sup_,attrs), ElmChildren(sup_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(i_)}
    I'(par,i'(attrs,nodes),cnst) 
      of (ElmAttrs(i_,attrs), ElmChildren(i_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(b_)}
    B'(par,b'(attrs,nodes),cnst) 
      of (ElmAttrs(b_,attrs), ElmChildren(b_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(u_)}
    U'(par,u'(attrs,nodes),cnst) 
      of (ElmAttrs(u_,attrs), ElmChildren(u_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(mark_)}
    Mark'(par,mark'(attrs,nodes),cnst) 
      of (ElmAttrs(mark_,attrs), ElmChildren(mark_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(bdi_)}
    Bdi'(par,bdi'(attrs,nodes),cnst) 
      of (ElmAttrs(bdi_,attrs), ElmChildren(bdi_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(bdo_)}
    Bdo'(par,bdo'(attrs,nodes),cnst) 
      of (ElmAttrs(bdo_,attrs), ElmChildren(bdo_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(span_)}
    Span'(par,span'(attrs,nodes),cnst) 
      of (ElmAttrs(span_,attrs), ElmChildren(span_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(br_)}
    Br'(par,br'(attrs),cnst)  of ElmAttrs(br_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(wbr_)}
    Wbr'(par,wbr'(attrs),cnst)  of ElmAttrs(wbr_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ins_)}
    Ins'(par,ins'(attrs,nodes),cnst) 
      of (ElmAttrs(ins_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(del_)}
    Del'(par,del'(attrs,nodes),cnst) 
      of (ElmAttrs(del_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(picture_)}
    Picture'(par,picture'(attrs,nodes),cnst) 
      of (ElmAttrs(picture_,attrs), ElmChildren(picture_,nodes,cnst))
  | {attrs:html5_attr_list} 
    {cnst(source_)}
    Source'(par,source'(attrs),cnst)  of ElmAttrs(source_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(img_)}
    Img'(par,img'(attrs),cnst)  of ElmAttrs(img_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(iframe_)}
    Iframe'(par,iframe'(attrs,nodes),cnst) 
      of (ElmAttrs(iframe_,attrs), ElmChildren(iframe_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(embed_)}
    Embed'(par,embed'(attrs),cnst)  of ElmAttrs(embed_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(object_)}
    Object'(par,object'(attrs,nodes),cnst) 
      of (ElmAttrs(object_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {attrs:html5_attr_list} 
    {cnst(param_)}
    Param'(par,param'(attrs),cnst)  of ElmAttrs(param_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(video_)}
    Video'(par,video'(attrs,nodes),cnst) 
      of (ElmAttrs(video_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(audio_)}
    Audio'(par,audio'(attrs,nodes),cnst) 
      of (ElmAttrs(audio_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {attrs:html5_attr_list} 
    {cnst(track_)}
    Track'(par,track'(attrs),cnst)  of ElmAttrs(track_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(map_)}
    Map'(par,map'(attrs,nodes),cnst) 
      of (ElmAttrs(map_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(area_)}
    Area'(par,area'(attrs),cnst)  of ElmAttrs(area_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(svg_)}
    Svg'(par,svg'(attrs,nodes),cnst) 
      of (ElmAttrs(svg_,attrs), ElmChildren(svg_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(math_)}
    Math'(par,math'(attrs,nodes),cnst) 
      of (ElmAttrs(math_,attrs), ElmChildren(math_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(table_)}
    Table'(par,table'(attrs,nodes),cnst) 
      of (ElmAttrs(table_,attrs), ElmChildren(table_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(caption_)}
    Caption'(par,caption'(attrs,nodes),cnst) 
      of (ElmAttrs(caption_,attrs), ElmChildren(caption_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(colgroup_)}
    Colgroup'(par,colgroup'(attrs,nodes),cnst) 
      of (ElmAttrs(colgroup_,attrs), ElmChildren(colgroup_,nodes,cnst))
  | {attrs:html5_attr_list} 
    {cnst(col_)}
    Col'(par,col'(attrs),cnst)  of ElmAttrs(col_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(tbody_)}
    Tbody'(table_,tbody'(attrs,nodes),cnst) 
      of (ElmAttrs(tbody_,attrs), ElmChildren(tbody_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(thead_)}
    Thead'(table_,thead'(attrs,nodes),cnst) 
      of (ElmAttrs(thead_,attrs), ElmChildren(thead_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(tfoot_)}
    Tfoot'(table_,tfoot'(attrs,nodes),cnst) 
      of (ElmAttrs(tfoot_,attrs), ElmChildren(tfoot_,nodes,cnst))
  | {par:html5_tag | par == table_ || par == tbody_ || par == thead_ || par == tfoot_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(tr_)}
    Tr'(par,tr'(attrs,nodes),cnst) 
      of (ElmAttrs(tr_,attrs), ElmChildren(tr_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(td_)}
    Td'(par,td'(attrs,nodes),cnst) 
      of (ElmAttrs(td_,attrs), ElmChildren(td_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(th_)}
    Th'(par,th'(attrs,nodes),cnst) 
      of (ElmAttrs(th_,attrs), ElmChildren(th_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0,ctx1:html5_ctx | ~has_bit(ctx1,html5_ctx_form) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(form_)}
    Form'(par,form'(attrs,nodes),cnst) 
      of (ElmAttrs(form_,attrs), ElmChildren(form_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(label_)}
    Label'(par,label'(attrs,nodes),cnst) 
      of (ElmAttrs(label_,attrs), ElmChildren(label_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(input_)}
    Input'(par,input'(attrs),cnst)  of ElmAttrs(input_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(button_)}
    Button'(par,button'(attrs,nodes),cnst) 
      of (ElmAttrs(button_,attrs), ElmChildren(button_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(select_)}
    Select'(par,select'(attrs,nodes),cnst) 
      of (ElmAttrs(select_,attrs), ElmChildren(select_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(datalist_)}
    Datalist'(par,datalist'(attrs,nodes),cnst) 
      of (ElmAttrs(datalist_,attrs), ElmChildren(datalist_,nodes,cnst))
  | {par: html5_tag | par == select_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(optgroup_)}
    Optgroup'(par,optgroup'(attrs,nodes),cnst) 
      of (ElmAttrs(optgroup_,attrs), ElmChildren(optgroup_,nodes,cnst))
  | {par:html5_tag | par == select_ || par == optgroup_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(option_)}
    Option'(par,option'(attrs,nodes),cnst) 
      of (ElmAttrs(option_,attrs), ElmChildren(option_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(textarea_)}
    Textarea'(par,textarea'(attrs,nodes),cnst) 
      of (ElmAttrs(textarea_,attrs), ElmChildren(textarea_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(output_)}
    Output'(par,output'(attrs,nodes),cnst) 
      of (ElmAttrs(output_,attrs), ElmChildren(output_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(progress_)}
    Progress'(par,progress'(attrs,nodes),cnst) 
      of (ElmAttrs(progress_,attrs), ElmChildren(progress_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(meter_)}
    Meter'(par,meter'(attrs,nodes),cnst) 
      of (ElmAttrs(meter_,attrs), ElmChildren(meter_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(fieldset_)}
    Fieldset'(par,fieldset'(attrs,nodes),cnst) 
      of (ElmAttrs(fieldset_,attrs), ElmChildren(fieldset_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(legend_)}
    Legend'(par,legend'(attrs,nodes),cnst) 
      of (ElmAttrs(legend_,attrs), ElmChildren(legend_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(details_)}
    Details'(par,details'(attrs,nodes),cnst) 
      of (ElmAttrs(details_,attrs), ElmChildren(details_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(summary_)}
    Summary'(par,summary'(attrs,nodes),cnst) 
      of (ElmAttrs(summary_,attrs), ElmChildren(summary_,nodes,cnst))
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(script_)}
    Script'(par,script'(attrs,id),cnst) 
      of (ElmAttrs(script_,attrs))
  | {par:html5_tag}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(noscript_)}
    Noscript'(par,noscript'(attrs,nodes),cnst) 
      of (ElmAttrs(noscript_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(template_)}
    Template'(par,template'(attrs,id),cnst) 
      of (ElmAttrs(template_,attrs))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(canvas_)}
    Canvas'(par,canvas'(attrs,nodes),cnst) 
      of (ElmAttrs(canvas_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  
  
 
dataprop Document(html5_elm_list) =
  | {h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    Document0( 
        doctype'
    :*: head'(h1as, h1es)
    :*: body'(bas, bes)
    :*: enil
    ) of (
      ElmAttrs(head_,h1as)
    , ElmChildren(head_,h1es,is_metadata)
    , ElmAttrs(body_,bas)
    , ElmChildren(body_,bes,is_flow)
    )   
  | {h0as,h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    Document1( 
      doctype'
     :*: html'(h0as, 
              head'(h1as, h1es)
          :*: body'(bas, bes)
          :*: enil
        ) 
     :*: enil
    ) of (
      ElmAttrs(html_,h0as)
    , ElmAttrs(head_,h1as)
    , ElmChildren(head_,h1es,is_metadata)
    , ElmAttrs(body_,bas)
    , ElmChildren(body_,bes,is_flow)
    )   

(** Be warned: we rely on the ability of ATS2 to infer `es` **) 
fun {env:vt@ype+}{es: html5_elm_list }
  html5_elm_list_out_verified( pf: Document(es) | env: &env ) : void

