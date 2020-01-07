
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

dataprop ElmChildren(ctx:html5_ctx,par:html5_tag,es:html5_elm_list) =
  |  ElmChildrenNil(html5_ctx_init,par,enil)
  |  {par:html5_tag}{ctx0,ctx1:html5_ctx}{chi:html5_elm}{es:html5_elm_list}
     ElmChildrenCons(ctx1,par,chi :*: es) 
      of (ElmChild(ctx0,ctx1,par,chi), ElmChildren(ctx0,par,es))

and ElmChild(ctx0:html5_ctx,ctx1:html5_ctx,par:html5_tag,chi:html5_elm) =
  | {id:int}{par: html5_tag | html5_content_phrasing(par) }{ctx0:html5_ctx} 
    Text'(ctx0,ctx0,par,text'(id)) 
  | {id:int}{ctx0:html5_ctx} 
    Comment'(ctx0,ctx0,par,comment'(id))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Head'(ctx0,ctx0,html_,head'(attrs,nodes)) 
      of (ElmAttrs(head_,attrs), ElmChildren(ctx0,head_,nodes))
  | {id:int}{ctx0:html5_ctx} 
    Title'(ctx0,ctx0,head_,title'(id)) 
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Base'(ctx0,ctx0,head_,base'(attrs))  of ElmAttrs(base_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Link'(ctx0,ctx0,head_,link'(attrs))  of ElmAttrs(link_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Meta'(ctx0,ctx0,head_,meta'(attrs))  of ElmAttrs(meta_,attrs)
  | {id:int}{ctx0:html5_ctx}{attrs:html5_attr_list} 
    Style'(ctx0,ctx0,head_,style'(attrs,id))  of ElmAttrs(style_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Body'(ctx0,set_bit(ctx0,html5_ctx_sectioning),html_,body'(attrs,nodes)) 
      of (ElmAttrs(body_,attrs), ElmChildren(ctx0,body_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Article'(ctx0,set_bit(ctx0,html5_ctx_sectioning),par,article'(attrs,nodes)) 
      of (ElmAttrs(article_,attrs), ElmChildren(ctx0,article_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Section'(ctx0,set_bit(ctx0,html5_ctx_sectioning),par,section'(attrs,nodes)) 
      of (ElmAttrs(section_,attrs), ElmChildren(ctx0,section_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Nav'(ctx0,set_bit(ctx0,html5_ctx_sectioning),par,nav'(attrs,nodes)) 
      of (ElmAttrs(nav_,attrs), ElmChildren(ctx0,nav_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Aside'(ctx0,set_bit(ctx0,html5_ctx_sectioning),par,aside'(attrs,nodes)) 
      of (ElmAttrs(aside_,attrs), ElmChildren(ctx0,aside_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0,ctx1:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    H1'(ctx0,set_bit(lor12(ctx0,ctx1),html5_ctx_heading),par,h1'(attrs,nodes)) 
      of (ElmAttrs(h1_,attrs), ElmChildren(ctx1,h1_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    H2'(ctx0,set_bit(ctx0,html5_ctx_heading),par,h2'(attrs,nodes)) 
      of (ElmAttrs(h2_,attrs), ElmChildren(ctx0,h2_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    H3'(ctx0,set_bit(ctx0,html5_ctx_heading),par,h3'(attrs,nodes)) 
      of (ElmAttrs(h3_,attrs), ElmChildren(ctx0,h3_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    H4'(ctx0,set_bit(ctx0,html5_ctx_heading),par,h4'(attrs,nodes)) 
      of (ElmAttrs(h4_,attrs), ElmChildren(ctx0,h4_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    H5'(ctx0,set_bit(ctx0,html5_ctx_heading),par,h5'(attrs,nodes)) 
      of (ElmAttrs(h5_,attrs), ElmChildren(ctx0,h5_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    H6'(ctx0,set_bit(ctx0,html5_ctx_heading),par,h6'(attrs,nodes)) 
      of (ElmAttrs(h6_,attrs), ElmChildren(ctx0,h6_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Header'(ctx0,ctx0,par,header'(attrs,nodes)) 
      of (ElmAttrs(header_,attrs), ElmChildren(ctx0,header_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Footer'(ctx0,ctx0,par,footer'(attrs,nodes)) 
      of (ElmAttrs(footer_,attrs), ElmChildren(ctx0,footer_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    P'(ctx0,ctx0,par,p'(attrs,nodes)) 
      of (ElmAttrs(p_,attrs), ElmChildren(ctx0,p_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Address'(ctx0,ctx0,par,address'(attrs,nodes)) 
      of (ElmAttrs(address_,attrs), ElmChildren(ctx0,address_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Hr'(ctx0,ctx0,par,hr'(attrs))  of ElmAttrs(hr_,attrs)
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Pre'(ctx0,ctx0,par,pre'(attrs,nodes)) 
      of (ElmAttrs(pre_,attrs), ElmChildren(ctx0,pre_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Blockquote'(ctx0,ctx0,par,blockquote'(attrs,nodes)) 
      of (ElmAttrs(blockquote_,attrs), ElmChildren(ctx0,blockquote_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Ol'(ctx0,ctx0,par,ol'(attrs,nodes)) 
      of (ElmAttrs(ol_,attrs), ElmChildren(ctx0,ol_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0,ctx1:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Ul'(ctx0,lor12(ctx0,ctx1),par,ul'(attrs,nodes)) 
      of (ElmAttrs(ul_,attrs), ElmChildren(ctx1,ul_,nodes))
  | {ctx0:html5_ctx}
    {par:html5_tag | par == ul_ || par == ol_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Li'(ctx0,ctx0,par,li'(attrs,nodes)) 
      of (ElmAttrs(li_,attrs), ElmChildren(ctx0,li_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Dl'(ctx0,ctx0,par,dl'(attrs,nodes)) 
      of (ElmAttrs(dl_,attrs), ElmChildren(ctx0,dl_,nodes))
  | {par: html5_tag | par == dl_ || par == div_}
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Dt'(ctx0,ctx0,par,dt'(attrs,nodes)) 
      of (ElmAttrs(dt_,attrs), ElmChildren(ctx0,dt_,nodes))
  | {par: html5_tag | par == dl_ || par == div_}
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Dd'(ctx0,ctx0,par,dd'(attrs,nodes)) 
      of (ElmAttrs(dd_,attrs), ElmChildren(ctx0,dd_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Figure'(ctx0,ctx0,par,figure'(attrs,nodes)) 
      of (ElmAttrs(figure_,attrs), ElmChildren(ctx0,figure_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Figcaption'(ctx0,ctx0,par,figcaption'(attrs,nodes)) 
      of (ElmAttrs(figcaption_,attrs), ElmChildren(ctx0,figcaption_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Main'(ctx0,set_bit(ctx0,html5_ctx_main),par,main'(attrs,nodes)) 
      of (ElmAttrs(main_,attrs), ElmChildren(ctx0,main_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Div'(ctx0,ctx0,par,div'(attrs,nodes)) 
      of (ElmAttrs(div_,attrs), ElmChildren(ctx0,div_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    A'(ctx0,ctx0,par,a'(attrs,nodes)) 
      of (ElmAttrs(a_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Em'(ctx0,ctx0,par,em'(attrs,nodes)) 
      of (ElmAttrs(em_,attrs), ElmChildren(ctx0,em_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Strong'(ctx0,ctx0,par,strong'(attrs,nodes)) 
      of (ElmAttrs(strong_,attrs), ElmChildren(ctx0,strong_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Small'(ctx0,ctx0,par,small'(attrs,nodes)) 
      of (ElmAttrs(small_,attrs), ElmChildren(ctx0,small_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    S'(ctx0,ctx0,par,s'(attrs,nodes)) 
      of (ElmAttrs(s_,attrs), ElmChildren(ctx0,s_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Q'(ctx0,ctx0,par,q'(attrs,nodes)) 
      of (ElmAttrs(q_,attrs), ElmChildren(ctx0,q_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Cite'(ctx0,ctx0,par,cite'(attrs,nodes)) 
      of (ElmAttrs(cite_,attrs), ElmChildren(ctx0,cite_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Dfn'(ctx0,ctx0,par,dfn'(attrs,nodes)) 
      of (ElmAttrs(dfn_,attrs), ElmChildren(ctx0,dfn_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Abbr'(ctx0,ctx0,par,abbr'(attrs,nodes)) 
      of (ElmAttrs(abbr_,attrs), ElmChildren(ctx0,abbr_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Ruby'(ctx0,ctx0,par,ruby'(attrs,nodes)) 
      of (ElmAttrs(ruby_,attrs), ElmChildren(ctx0,ruby_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Rb'(ctx0,ctx0,par,rb'(attrs,nodes)) 
      of (ElmAttrs(rb_,attrs), ElmChildren(ctx0,rb_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Rt'(ctx0,ctx0,par,rt'(attrs,nodes)) 
      of (ElmAttrs(rt_,attrs), ElmChildren(ctx0,rt_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Rtc'(ctx0,ctx0,par,rtc'(attrs,nodes)) 
      of (ElmAttrs(rtc_,attrs), ElmChildren(ctx0,rtc_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Rp'(ctx0,ctx0,par,rp'(attrs,nodes)) 
      of (ElmAttrs(rp_,attrs), ElmChildren(ctx0,rp_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Data'(ctx0,ctx0,par,data'(attrs,nodes)) 
      of (ElmAttrs(data_,attrs), ElmChildren(ctx0,data_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Time'(ctx0,ctx0,par,time'(attrs,nodes)) 
      of (ElmAttrs(time_,attrs), ElmChildren(ctx0,time_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Code'(ctx0,ctx0,par,code'(attrs,nodes)) 
      of (ElmAttrs(code_,attrs), ElmChildren(ctx0,code_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Var'(ctx0,ctx0,par,var'(attrs,nodes)) 
      of (ElmAttrs(var_,attrs), ElmChildren(ctx0,var_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Samp'(ctx0,ctx0,par,samp'(attrs,nodes)) 
      of (ElmAttrs(samp_,attrs), ElmChildren(ctx0,samp_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Kbd'(ctx0,ctx0,par,kbd'(attrs,nodes)) 
      of (ElmAttrs(kbd_,attrs), ElmChildren(ctx0,kbd_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Sub'(ctx0,ctx0,par,sub'(attrs,nodes)) 
      of (ElmAttrs(sub_,attrs), ElmChildren(ctx0,sub_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Sup'(ctx0,ctx0,par,sup'(attrs,nodes)) 
      of (ElmAttrs(sup_,attrs), ElmChildren(ctx0,sup_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    I'(ctx0,ctx0,par,i'(attrs,nodes)) 
      of (ElmAttrs(i_,attrs), ElmChildren(ctx0,i_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    B'(ctx0,ctx0,par,b'(attrs,nodes)) 
      of (ElmAttrs(b_,attrs), ElmChildren(ctx0,b_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    U'(ctx0,ctx0,par,u'(attrs,nodes)) 
      of (ElmAttrs(u_,attrs), ElmChildren(ctx0,u_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Mark'(ctx0,ctx0,par,mark'(attrs,nodes)) 
      of (ElmAttrs(mark_,attrs), ElmChildren(ctx0,mark_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Bdi'(ctx0,ctx0,par,bdi'(attrs,nodes)) 
      of (ElmAttrs(bdi_,attrs), ElmChildren(ctx0,bdi_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Bdo'(ctx0,ctx0,par,bdo'(attrs,nodes)) 
      of (ElmAttrs(bdo_,attrs), ElmChildren(ctx0,bdo_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Span'(ctx0,ctx0,par,span'(attrs,nodes)) 
      of (ElmAttrs(span_,attrs), ElmChildren(ctx0,span_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Br'(ctx0,ctx0,par,br'(attrs))  of ElmAttrs(br_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Wbr'(ctx0,ctx0,par,wbr'(attrs))  of ElmAttrs(wbr_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Ins'(ctx0,ctx0,par,ins'(attrs,nodes)) 
      of (ElmAttrs(ins_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Del'(ctx0,ctx0,par,del'(attrs,nodes)) 
      of (ElmAttrs(del_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Picture'(ctx0,ctx0,par,picture'(attrs,nodes)) 
      of (ElmAttrs(picture_,attrs), ElmChildren(ctx0,picture_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Source'(ctx0,ctx0,par,source'(attrs))  of ElmAttrs(source_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Img'(ctx0,ctx0,par,img'(attrs))  of ElmAttrs(img_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Iframe'(ctx0,ctx0,par,iframe'(attrs,nodes)) 
      of (ElmAttrs(iframe_,attrs), ElmChildren(ctx0,iframe_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Embed'(ctx0,ctx0,par,embed'(attrs))  of ElmAttrs(embed_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Object'(ctx0,ctx0,par,object'(attrs,nodes)) 
      of (ElmAttrs(object_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Param'(ctx0,ctx0,par,param'(attrs))  of ElmAttrs(param_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Video'(ctx0,ctx0,par,video'(attrs,nodes)) 
      of (ElmAttrs(video_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Audio'(ctx0,ctx0,par,audio'(attrs,nodes)) 
      of (ElmAttrs(audio_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Track'(ctx0,ctx0,par,track'(attrs))  of ElmAttrs(track_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Map'(ctx0,ctx0,par,map'(attrs,nodes)) 
      of (ElmAttrs(map_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Area'(ctx0,ctx0,par,area'(attrs))  of ElmAttrs(area_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Svg'(ctx0,ctx0,par,svg'(attrs,nodes)) 
      of (ElmAttrs(svg_,attrs), ElmChildren(ctx0,svg_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Math'(ctx0,ctx0,par,math'(attrs,nodes)) 
      of (ElmAttrs(math_,attrs), ElmChildren(ctx0,math_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Table'(ctx0,ctx0,par,table'(attrs,nodes)) 
      of (ElmAttrs(table_,attrs), ElmChildren(ctx0,table_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Caption'(ctx0,ctx0,par,caption'(attrs,nodes)) 
      of (ElmAttrs(caption_,attrs), ElmChildren(ctx0,caption_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Colgroup'(ctx0,ctx0,par,colgroup'(attrs,nodes)) 
      of (ElmAttrs(colgroup_,attrs), ElmChildren(ctx0,colgroup_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Col'(ctx0,ctx0,par,col'(attrs))  of ElmAttrs(col_,attrs)
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Tbody'(ctx0,ctx0,table_,tbody'(attrs,nodes)) 
      of (ElmAttrs(tbody_,attrs), ElmChildren(ctx0,tbody_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Thead'(ctx0,ctx0,table_,thead'(attrs,nodes)) 
      of (ElmAttrs(thead_,attrs), ElmChildren(ctx0,thead_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Tfoot'(ctx0,ctx0,table_,tfoot'(attrs,nodes)) 
      of (ElmAttrs(tfoot_,attrs), ElmChildren(ctx0,tfoot_,nodes))
  | {par:html5_tag | par == table_ || par == tbody_ || par == thead_ || par == tfoot_}
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Tr'(ctx0,ctx0,par,tr'(attrs,nodes)) 
      of (ElmAttrs(tr_,attrs), ElmChildren(ctx0,tr_,nodes))
  | {par:html5_tag | par == tr_}{ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Td'(ctx0,ctx0,par,td'(attrs,nodes)) 
      of (ElmAttrs(td_,attrs), ElmChildren(ctx0,td_,nodes))
  | {par: html5_tag | par == tr_}{ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Th'(ctx0,ctx0,par,th'(attrs,nodes)) 
      of (ElmAttrs(th_,attrs), ElmChildren(ctx0,th_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0,ctx1:html5_ctx | ~has_bit(ctx1,html5_ctx_form) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Form'(ctx0,set_bit(lor12(ctx0,ctx1),html5_ctx_form),par,form'(attrs,nodes)) 
      of (ElmAttrs(form_,attrs), ElmChildren(ctx1,form_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Label'(ctx0,ctx0,par,label'(attrs,nodes)) 
      of (ElmAttrs(label_,attrs), ElmChildren(ctx0,label_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list} 
    Input'(ctx0,ctx0,par,input'(attrs))  of ElmAttrs(input_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Button'(ctx0,ctx0,par,button'(attrs,nodes)) 
      of (ElmAttrs(button_,attrs), ElmChildren(ctx0,button_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Select'(ctx0,ctx0,par,select'(attrs,nodes)) 
      of (ElmAttrs(select_,attrs), ElmChildren(ctx0,select_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Datalist'(ctx0,ctx0,par,datalist'(attrs,nodes)) 
      of (ElmAttrs(datalist_,attrs), ElmChildren(ctx0,datalist_,nodes))
  | {par: html5_tag | par == select_}
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Optgroup'(ctx0,ctx0,par,optgroup'(attrs,nodes)) 
      of (ElmAttrs(optgroup_,attrs), ElmChildren(ctx0,optgroup_,nodes))
  | {par:html5_tag | par == select_ || par == optgroup_}
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Option'(ctx0,ctx0,par,option'(attrs,nodes)) 
      of (ElmAttrs(option_,attrs), ElmChildren(ctx0,option_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Textarea'(ctx0,ctx0,par,textarea'(attrs,nodes)) 
      of (ElmAttrs(textarea_,attrs), ElmChildren(ctx0,textarea_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Output'(ctx0,ctx0,par,output'(attrs,nodes)) 
      of (ElmAttrs(output_,attrs), ElmChildren(ctx0,output_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Progress'(ctx0,ctx0,par,progress'(attrs,nodes)) 
      of (ElmAttrs(progress_,attrs), ElmChildren(ctx0,progress_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Meter'(ctx0,ctx0,par,meter'(attrs,nodes)) 
      of (ElmAttrs(meter_,attrs), ElmChildren(ctx0,meter_,nodes))
  | {par: html5_tag | html5_content_flow(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Fieldset'(ctx0,ctx0,par,fieldset'(attrs,nodes)) 
      of (ElmAttrs(fieldset_,attrs), ElmChildren(ctx0,fieldset_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Legend'(ctx0,ctx0,par,legend'(attrs,nodes)) 
      of (ElmAttrs(legend_,attrs), ElmChildren(ctx0,legend_,nodes))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Details'(ctx0,ctx0,par,details'(attrs,nodes)) 
      of (ElmAttrs(details_,attrs), ElmChildren(ctx0,details_,nodes))
  | {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Summary'(ctx0,ctx0,par,summary'(attrs,nodes)) 
      of (ElmAttrs(summary_,attrs), ElmChildren(ctx0,summary_,nodes))
  | {id:int}{ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Script'(ctx0,ctx0,par,script'(attrs,id)) 
      of (ElmAttrs(script_,attrs))
  | {par:html5_tag}{ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Noscript'(ctx0,ctx0,par,noscript'(attrs,nodes)) 
      of (ElmAttrs(noscript_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  | {id:int}{ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Template'(ctx0,ctx0,par,template'(attrs,id)) 
      of (ElmAttrs(template_,attrs))
  | {par: html5_tag | html5_content_phrasing(par) }
    {ctx0:html5_ctx}{attrs:html5_attr_list}{nodes:html5_elm_list}
    Canvas'(ctx0,ctx0,par,canvas'(attrs,nodes)) 
      of (ElmAttrs(canvas_,attrs), ElmChildren(ctx0,par,nodes)) // transparent
  
  
 
dataprop Document(html5_elm_list) =
  | {h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    {ctxh,ctxb:html5_ctx}
    Document0( 
        doctype'
    :*: head'(h1as, h1es)
    :*: body'(bas, bes)
    :*: enil
    ) of (
      ElmAttrs(head_,h1as)
    , ElmChildren(ctxh,head_,h1es)
    , ElmAttrs(body_,bas)
    , ElmChildren(ctxb,body_,bes)
    )   
  | {h0as,h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    {ctxh,ctxb:html5_ctx}
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
    , ElmChildren(ctxh,head_,h1es)
    , ElmAttrs(body_,bas)
    , ElmChildren(ctxb,body_,bes)
    )   

(** Be warned: we rely on the ability of ATS2 to infer `es` **) 
fun {env:vt@ype+}{es: html5_elm_list }
  html5_elm_list_out_verified( pf: Document(es) | env: &env ) : void

