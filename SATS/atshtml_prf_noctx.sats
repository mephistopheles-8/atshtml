
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

dataprop ElmAttrs(tag:html5_tag,ax:html5_attr_list) = 
  |  ElmAttrsNil(tag,anil)
  | {attr:html5_attr}{ax:html5_attr_list}
     ElmAttrsCons(tag, attr :@: ax )
      of (ElmAttr(tag,attr), ElmAttrs(tag,ax))
and ElmAttr(html5_tag,html5_attr) =
  | {id:int}
    Charset$(meta_, charset$(id))

dataprop ElmChildren(par:html5_tag,es:html5_elm_list) =
  |  ElmChildrenNil(par,enil)
  |  {chi:html5_elm}{es:html5_elm_list}
     ElmChildrenCons(par,chi :*: es) 
      of (ElmChild(par,chi), ElmChildren(par,es))

and ElmChild(par:html5_tag,chi:html5_elm) =
  | {id:int} Text'(par,text'(id)) 
  | {id:int} Comment'(par,comment'(id))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Head'(html_,head'(attrs,nodes)) 
      of (ElmAttrs(head_,attrs), ElmChildren(head_,nodes))
  | {id:int} Title'(head_,title'(id)) 
  | {attrs:html5_attr_list} 
    Base'(head_,base'(attrs))  of ElmAttrs(base_,attrs)
  | {attrs:html5_attr_list} 
    Link'(head_,link'(attrs))  of ElmAttrs(link_,attrs)
  | {attrs:html5_attr_list} 
    Meta'(head_,meta'(attrs))  of ElmAttrs(meta_,attrs)
  | {id:int}{attrs:html5_attr_list} 
    Style'(head_,style'(attrs,id))  of ElmAttrs(style_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Body'(html_,body'(attrs,nodes)) 
      of (ElmAttrs(body_,attrs), ElmChildren(body_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Article'(par,article'(attrs,nodes)) 
      of (ElmAttrs(article_,attrs), ElmChildren(article_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Section'(par,section'(attrs,nodes)) 
      of (ElmAttrs(section_,attrs), ElmChildren(section_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Nav'(par,nav'(attrs,nodes)) 
      of (ElmAttrs(nav_,attrs), ElmChildren(nav_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Aside'(par,aside'(attrs,nodes)) 
      of (ElmAttrs(aside_,attrs), ElmChildren(aside_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    H1'(par,h1'(attrs,nodes)) 
      of (ElmAttrs(h1_,attrs), ElmChildren(h1_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    H2'(par,h2'(attrs,nodes)) 
      of (ElmAttrs(h2_,attrs), ElmChildren(h2_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    H3'(par,h3'(attrs,nodes)) 
      of (ElmAttrs(h3_,attrs), ElmChildren(h3_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    H4'(par,h4'(attrs,nodes)) 
      of (ElmAttrs(h4_,attrs), ElmChildren(h4_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    H5'(par,h5'(attrs,nodes)) 
      of (ElmAttrs(h5_,attrs), ElmChildren(h5_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    H6'(par,h6'(attrs,nodes)) 
      of (ElmAttrs(h6_,attrs), ElmChildren(h6_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Header'(par,header'(attrs,nodes)) 
      of (ElmAttrs(header_,attrs), ElmChildren(header_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Footer'(par,footer'(attrs,nodes)) 
      of (ElmAttrs(footer_,attrs), ElmChildren(footer_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    P'(par,p'(attrs,nodes)) 
      of (ElmAttrs(p_,attrs), ElmChildren(p_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Address'(par,address'(attrs,nodes)) 
      of (ElmAttrs(address_,attrs), ElmChildren(address_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list} 
    Hr'(par,hr'(attrs))  of ElmAttrs(hr_,attrs)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Pre'(par,pre'(attrs,nodes)) 
      of (ElmAttrs(pre_,attrs), ElmChildren(pre_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Blockquote'(par,blockquote'(attrs,nodes)) 
      of (ElmAttrs(blockquote_,attrs), ElmChildren(blockquote_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Ol'(par,ol'(attrs,nodes)) 
      of (ElmAttrs(ol_,attrs), ElmChildren(ol_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Ul'(par,ul'(attrs,nodes)) 
      of (ElmAttrs(ul_,attrs), ElmChildren(ul_,nodes))
  | {par:html5_tag | par == ul_ || par == ol_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Li'(par,li'(attrs,nodes)) 
      of (ElmAttrs(li_,attrs), ElmChildren(li_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Dl'(par,dl'(attrs,nodes)) 
      of (ElmAttrs(dl_,attrs), ElmChildren(dl_,nodes))
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Dt'(par,dt'(attrs,nodes)) 
      of (ElmAttrs(dt_,attrs), ElmChildren(dt_,nodes))
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Dd'(par,dd'(attrs,nodes)) 
      of (ElmAttrs(dd_,attrs), ElmChildren(dd_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Figure'(par,figure'(attrs,nodes)) 
      of (ElmAttrs(figure_,attrs), ElmChildren(figure_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Figcaption'(par,figcaption'(attrs,nodes)) 
      of (ElmAttrs(figcaption_,attrs), ElmChildren(figcaption_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Main'(par,main'(attrs,nodes)) 
      of (ElmAttrs(main_,attrs), ElmChildren(main_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Div'(par,div'(attrs,nodes)) 
      of (ElmAttrs(div_,attrs), ElmChildren(div_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    A'(par,a'(attrs,nodes)) 
      of (ElmAttrs(a_,attrs), ElmChildren(par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Em'(par,em'(attrs,nodes)) 
      of (ElmAttrs(em_,attrs), ElmChildren(em_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Strong'(par,strong'(attrs,nodes)) 
      of (ElmAttrs(strong_,attrs), ElmChildren(strong_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Small'(par,small'(attrs,nodes)) 
      of (ElmAttrs(small_,attrs), ElmChildren(small_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    S'(par,s'(attrs,nodes)) 
      of (ElmAttrs(s_,attrs), ElmChildren(s_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Q'(par,q'(attrs,nodes)) 
      of (ElmAttrs(q_,attrs), ElmChildren(q_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Cite'(par,cite'(attrs,nodes)) 
      of (ElmAttrs(cite_,attrs), ElmChildren(cite_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Dfn'(par,dfn'(attrs,nodes)) 
      of (ElmAttrs(dfn_,attrs), ElmChildren(dfn_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Abbr'(par,abbr'(attrs,nodes)) 
      of (ElmAttrs(abbr_,attrs), ElmChildren(abbr_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Ruby'(par,ruby'(attrs,nodes)) 
      of (ElmAttrs(ruby_,attrs), ElmChildren(ruby_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rb'(par,rb'(attrs,nodes)) 
      of (ElmAttrs(rb_,attrs), ElmChildren(rb_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rt'(par,rt'(attrs,nodes)) 
      of (ElmAttrs(rt_,attrs), ElmChildren(rt_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rtc'(par,rtc'(attrs,nodes)) 
      of (ElmAttrs(rtc_,attrs), ElmChildren(rtc_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rp'(par,rp'(attrs,nodes)) 
      of (ElmAttrs(rp_,attrs), ElmChildren(rp_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Data'(par,data'(attrs,nodes)) 
      of (ElmAttrs(data_,attrs), ElmChildren(data_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Time'(par,time'(attrs,nodes)) 
      of (ElmAttrs(time_,attrs), ElmChildren(time_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Code'(par,code'(attrs,nodes)) 
      of (ElmAttrs(code_,attrs), ElmChildren(code_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Var'(par,var'(attrs,nodes)) 
      of (ElmAttrs(var_,attrs), ElmChildren(var_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Samp'(par,samp'(attrs,nodes)) 
      of (ElmAttrs(samp_,attrs), ElmChildren(samp_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Kbd'(par,kbd'(attrs,nodes)) 
      of (ElmAttrs(kbd_,attrs), ElmChildren(kbd_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Sub'(par,sub'(attrs,nodes)) 
      of (ElmAttrs(sub_,attrs), ElmChildren(sub_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Sup'(par,sup'(attrs,nodes)) 
      of (ElmAttrs(sup_,attrs), ElmChildren(sup_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    I'(par,i'(attrs,nodes)) 
      of (ElmAttrs(i_,attrs), ElmChildren(i_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    B'(par,b'(attrs,nodes)) 
      of (ElmAttrs(b_,attrs), ElmChildren(b_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    U'(par,u'(attrs,nodes)) 
      of (ElmAttrs(u_,attrs), ElmChildren(u_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Mark'(par,mark'(attrs,nodes)) 
      of (ElmAttrs(mark_,attrs), ElmChildren(mark_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Bdi'(par,bdi'(attrs,nodes)) 
      of (ElmAttrs(bdi_,attrs), ElmChildren(bdi_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Bdo'(par,bdo'(attrs,nodes)) 
      of (ElmAttrs(bdo_,attrs), ElmChildren(bdo_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Span'(par,span'(attrs,nodes)) 
      of (ElmAttrs(span_,attrs), ElmChildren(span_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    Br'(par,br'(attrs))  of ElmAttrs(br_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    Wbr'(par,wbr'(attrs))  of ElmAttrs(wbr_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Ins'(par,ins'(attrs,nodes)) 
      of (ElmAttrs(ins_,attrs), ElmChildren(par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Del'(par,del'(attrs,nodes)) 
      of (ElmAttrs(del_,attrs), ElmChildren(par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Picture'(par,picture'(attrs,nodes)) 
      of (ElmAttrs(picture_,attrs), ElmChildren(picture_,nodes))
  | {attrs:html5_attr_list} 
    Source'(par,source'(attrs))  of ElmAttrs(source_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    Img'(par,img'(attrs))  of ElmAttrs(img_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Iframe'(par,iframe'(attrs,nodes)) 
      of (ElmAttrs(iframe_,attrs), ElmChildren(iframe_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    Embed'(par,embed'(attrs))  of ElmAttrs(embed_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Object'(par,object'(attrs,nodes)) 
      of (ElmAttrs(object_,attrs), ElmChildren(par,nodes)) // transparent
  | {attrs:html5_attr_list} 
    Param'(par,param'(attrs))  of ElmAttrs(param_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Video'(par,video'(attrs,nodes)) 
      of (ElmAttrs(video_,attrs), ElmChildren(par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Audio'(par,audio'(attrs,nodes)) 
      of (ElmAttrs(audio_,attrs), ElmChildren(par,nodes)) // transparent
  | {attrs:html5_attr_list} 
    Track'(par,track'(attrs))  of ElmAttrs(track_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Map'(par,map'(attrs,nodes)) 
      of (ElmAttrs(map_,attrs), ElmChildren(par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    Area'(par,area'(attrs))  of ElmAttrs(area_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Svg'(par,svg'(attrs,nodes)) 
      of (ElmAttrs(svg_,attrs), ElmChildren(svg_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Math'(par,math'(attrs,nodes)) 
      of (ElmAttrs(math_,attrs), ElmChildren(math_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Table'(par,table'(attrs,nodes)) 
      of (ElmAttrs(table_,attrs), ElmChildren(table_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Caption'(par,caption'(attrs,nodes)) 
      of (ElmAttrs(caption_,attrs), ElmChildren(caption_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Colgroup'(par,colgroup'(attrs,nodes)) 
      of (ElmAttrs(colgroup_,attrs), ElmChildren(colgroup_,nodes))
  | {attrs:html5_attr_list} 
    Col'(par,col'(attrs))  of ElmAttrs(col_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Tbody'(table_,tbody'(attrs,nodes)) 
      of (ElmAttrs(tbody_,attrs), ElmChildren(tbody_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Thead'(table_,thead'(attrs,nodes)) 
      of (ElmAttrs(thead_,attrs), ElmChildren(thead_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Tfoot'(table_,tfoot'(attrs,nodes)) 
      of (ElmAttrs(tfoot_,attrs), ElmChildren(tfoot_,nodes))
  | {par:html5_tag | par == table_ || par == tbody_ || par == thead_ || par == tfoot_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Tr'(par,tr'(attrs,nodes)) 
      of (ElmAttrs(tr_,attrs), ElmChildren(tr_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Td'(par,td'(attrs,nodes)) 
      of (ElmAttrs(td_,attrs), ElmChildren(td_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Th'(par,th'(attrs,nodes)) 
      of (ElmAttrs(th_,attrs), ElmChildren(th_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0,ctx1:html5_ctx | ~has_bit(ctx1,html5_ctx_form) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Form'(par,form'(attrs,nodes)) 
      of (ElmAttrs(form_,attrs), ElmChildren(form_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Label'(par,label'(attrs,nodes)) 
      of (ElmAttrs(label_,attrs), ElmChildren(label_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    Input'(par,input'(attrs))  of ElmAttrs(input_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Button'(par,button'(attrs,nodes)) 
      of (ElmAttrs(button_,attrs), ElmChildren(button_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Select'(par,select'(attrs,nodes)) 
      of (ElmAttrs(select_,attrs), ElmChildren(select_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Datalist'(par,datalist'(attrs,nodes)) 
      of (ElmAttrs(datalist_,attrs), ElmChildren(datalist_,nodes))
  | {par: html5_tag | par == select_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Optgroup'(par,optgroup'(attrs,nodes)) 
      of (ElmAttrs(optgroup_,attrs), ElmChildren(optgroup_,nodes))
  | {par:html5_tag | par == select_ || par == optgroup_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Option'(par,option'(attrs,nodes)) 
      of (ElmAttrs(option_,attrs), ElmChildren(option_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Textarea'(par,textarea'(attrs,nodes)) 
      of (ElmAttrs(textarea_,attrs), ElmChildren(textarea_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Output'(par,output'(attrs,nodes)) 
      of (ElmAttrs(output_,attrs), ElmChildren(output_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Progress'(par,progress'(attrs,nodes)) 
      of (ElmAttrs(progress_,attrs), ElmChildren(progress_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Meter'(par,meter'(attrs,nodes)) 
      of (ElmAttrs(meter_,attrs), ElmChildren(meter_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Fieldset'(par,fieldset'(attrs,nodes)) 
      of (ElmAttrs(fieldset_,attrs), ElmChildren(fieldset_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Legend'(par,legend'(attrs,nodes)) 
      of (ElmAttrs(legend_,attrs), ElmChildren(legend_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Details'(par,details'(attrs,nodes)) 
      of (ElmAttrs(details_,attrs), ElmChildren(details_,nodes))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Summary'(par,summary'(attrs,nodes)) 
      of (ElmAttrs(summary_,attrs), ElmChildren(summary_,nodes))
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Script'(par,script'(attrs,id)) 
      of (ElmAttrs(script_,attrs))
  | {par:html5_tag}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Noscript'(par,noscript'(attrs,nodes)) 
      of (ElmAttrs(noscript_,attrs), ElmChildren(par,nodes)) // transparent
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Template'(par,template'(attrs,id)) 
      of (ElmAttrs(template_,attrs))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Canvas'(par,canvas'(attrs,nodes)) 
      of (ElmAttrs(canvas_,attrs), ElmChildren(par,nodes)) // transparent
  
  
 
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
    , ElmChildren(head_,h1es)
    , ElmAttrs(body_,bas)
    , ElmChildren(body_,bes)
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
    , ElmChildren(head_,h1es)
    , ElmAttrs(body_,bas)
    , ElmChildren(body_,bes)
    )   

(** Be warned: we rely on the ability of ATS2 to infer `es` **) 
fun {env:vt@ype+}{es: html5_elm_list }
  html5_elm_list_out_verified( pf: Document(es) | env: &env ) : void

