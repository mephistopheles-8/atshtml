(* 
 ** Project : atshtml
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#include "./../HATS/project.hats"

staload "./atshtml.sats"
staload "./atshtml_elms.sats"
staload "./atshtml_attrs.sats"


stadef html5_content_flow( tag : html5_tag ) : bool = (
    tag == body_ ||
    tag == article_ ||
    tag == section_ ||
    tag == nav_ ||
    tag == aside_ ||
    tag == header_ ||
    tag == footer_ ||
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
    tag == ruby_ || 
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
    tag == meter_ || 
    tag == picture_ 
  )

#include "./../HATS/atshtml_infix.hats"

dataprop ElmAttrs(tag:html5_tag,ax:html5_attr_list) = 
  |  ElmAttrsNil(tag,anil)
  | {attr:html5_attr}{ax:html5_attr_list}
     ElmAttrsCons(tag, attr :@: ax )
      of (ElmAttr(tag,attr), ElmAttrs(tag,ax))

and ElmAttr(par:html5_tag,html5_attr) =
  | {id:int}{
        par == meta_ ||
        par == script_
    } charset$(par, charset$(id))
  | {id:int}{
        par == form_ ||
        par == input_
    } accept$(par,accept$(id))
  | {id:int} accept_charset$(form_,accept_charset$(id))
  | {id:int} accesskey$(par,accesskey$(id))
  | {id:int} action$(form_,action$(id))
  | {id:int}{
        par == caption_ ||
        par == col_ ||
        par == colgroup_ ||
        par == hr_ ||
        par == iframe_ ||
        par == img_ ||
        par == table_ ||
        par == tbody_ ||
        par == td_ ||
        par == tfoot_ ||
        par == th_ ||
        par == thead_ ||
        par == tr_  
    } align$(par,align$(id))
  | {id:int}{
        par == area_ ||
        par == img_ ||
        par == input_ 
    } alt$(par,alt$(id))
  | {id:int} async$(script_,async$(id))
  | {id:int} autocapitalize$(par,autocapitalize$(id))
  | {id:int}{
        par == form_ ||
        par == input_ ||
        par == textarea_
    } autocomplete$(par,autocomplete$(id))
  | {id:int}{
        par == button_ ||
        par == input_ 
    } autofocus$(par,autofocus$(id))
  | {id:int}{
        par == video_ ||
        par == audio_ 
    } autoplay$(par,autoplay$(id))
  | {id:int}{
        par == body_ ||
        par == col_ ||
        par == colgroup_ ||
        par == table_ ||
        par == tbody_ ||
        par == tfoot_ ||
        par == td_ ||
        par == th_ ||
        par == tr_ 
    } bgcolor$(par,bgcolor$(id))
  | {id:int} border$(par,border$(id))
  | {id:int} {
        par == video_ ||
        par == audio_ 
    } buffered$(par,buffered$(id))
  | {id:int} challenge$(par,challenge$(id))
  | {id:int} charset$(par,charset$(id))
  | {id:int} checked$(input_,checked$(id))
  | {id:int}{
        par == blockquote_ ||
        par == del_ ||
        par == ins_ ||
        par == q_  
    } cite$(par,cite$(id))
  | {id:int} class$(par,class$(id))
  | {id:int} code$(par,code$(id))
  | {id:int} codebase$(par,codebase$(id))
  | {id:int} color$(hr_,color$(id))
  | {id:int} cols$(textarea_,cols$(id))
  | {id:int}{
        par == td_ ||
        par == th_
    } colspan$(par,colspan$(id))
  | {id:int} content$(meta_,content$(id))
  | {id:int} contenteditable$(par,contenteditable$(id))
  | {id:int} contextmenu$(par,contextmenu$(id))
  | {id:int} {
        par == video_ ||
        par == audio_ 
    } controls$(par,controls$(id))
  | {id:int} coords$(area_,coords$(id))
  | {id:int} crossorigin$(par,crossorigin$(id))
  | {id:int} data$(object_,data$(id))
  | {k,v:int} datakv$(par,data_kv$(k,v))
  | {id:int} {
        par == del_ ||
        par == ins_ ||
        par == time_ 
    } datetime$(par,datetime$(id))
  | {id:int} default$(track_,default$(id))
  | {id:int} defer$(script_,defer$(id))
  | {id:int} dir$(par,dir$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_
    } dirname$(par,dirname$(id))
  | {id:int} {
        par == button_ ||
        par == fieldset_ ||
        par == input_ ||
        par == label_ ||
        par == meter_ || 
        par == object_ ||
        par == output_ ||
        par == progress_ ||
        par == select_ ||
        par == textarea_ 
    } disabled$(par,disabled$(id))
  | {id:int} download$(par,download$(id))
  | {id:int} draggable$(par,draggable$(id))
  | {id:int} dropzone$(par,dropzone$(id))
  | {id:int} enctype$(form_,enctype$(id))
  | {id:int} {
        par == label_ ||
        par == output_
    } for$(par,for$(id))
  | {id:int} {
        par == button_ ||
        par == fieldset_ ||
        par == input_ ||
        par == label_ ||
        par == meter_ || 
        par == object_ ||
        par == output_ ||
        par == progress_ ||
        par == select_ ||
        par == textarea_ 
    } form$(par,form$(id))
  | {id:int} {
        par == input_ ||
        par == button_
    } formaction$(par,formaction$(id))
  | {id:int}{
        par == td_ ||
        par == th_
    } headers$(par,headers$(id))
  | {id:int}{
        par == canvas_ ||
        par == video_ ||
        par == iframe_ ||
        par == img_ ||
        par == embed_ ||
        par == object_ ||
        par == input_ 
    } height$(par,height$(id))
  | {id:int} hidden$(par,hidden$(id))
  | {id:int} high$(meter_,high$(id))
  | {id:int} href$(par,href$(id))
  | {id:int}{
        par == a_ ||
        par == area_ ||
        par == link_
    } hreflang$(par,hreflang$(id))
  | {id:int} http_equiv$(meta_,http_equiv$(id))
  | {id:int} icon$(par,icon$(id))
  | {id:int} id$(par,id$(id))
  | {id:int} {
        par == link_ ||
        par == script_
    } integrity$(par,integrity$(id))
  | {id:int} ismap$(img_,ismap$(id))
  | {id:int} itemprop$(par,itemprop$(id))
  | {id:int} keytype$(par,keytype$(id))
  | {id:int} kind$(track_,kind$(id))
  | {id:int} label$(track_,label$(id))
  | {id:int} lang$(par,lang$(id))
  | {id:int} language$(script_,language$(id))
  | {id:int} list$(input_,list$(id))
  | {id:int} {
        par == video_ ||
        par == audio_ 
    } loop$(par,loop$(id))
  | {id:int} low$(meter_,low$(id))
  | {id:int} manifest$(html_,manifest$(id))
  | {id:int} {
        par == input_ ||
        par == meter_ ||
        par == progress_ 
    } max$(par,max$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
    }  maxlength$(par,maxlength$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
   } minlength$(par,minlength$(id))
  | {id:int}{
        par == a_ ||
        par == area_ ||
        par == link_ ||
        par == source_ ||
        par == style_ 
    } media$(par,media$(id))
  | {id:int} method$(form_,method$(id))
  | {id:int} {
        par == input_ ||
        par == meter_ 
    } min$(par,min$(id))
  | {id:int}{
        par == input_ ||
        par == select_ 
    } multiple$(par,multiple$(id))
  | {id:int}{
        par == video_ ||
        par == audio_ 
    } muted$(par,muted$(id))
  | {id:int}{
        par == button_ ||
        par == form_ ||
        par == fieldset_ ||
        par == iframe_ ||
        par == input_ ||
        par == object_ ||
        par == output_ ||
        par == select_ ||
        par == textarea_ ||
        par == map_ ||
        par == meta_ ||
        par == param_
    } name$(par,name$(id))
  | {id:int} novalidate$(form_,novalidate$(id))
  | {id:int} open$(details_,open$(id))
  | {id:int} optimum$(meter_,optimum$(id))
  | {id:int} pattern$(input_,pattern$(id))
  | {id:int} {
        par == a_ ||
        par == area_
    } ping$(par,ping$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
    } placeholder$(par,placeholder$(id))
  | {id:int} poster$(video_,poster$(id))
  | {id:int}{
        par == video_ ||
        par == audio_ 
    } preload$(par,preload$(id))
  | {id:int} radiogroup$(par,radiogroup$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
    } readonly$(par,readonly$(id))
  | {id:int} {
        par == a_ ||
        par == area_ ||
        par == link_  
    } rel$(par,rel$(id))
  | {id:int} {
        par == input_ ||
        par == select_ || 
        par == textarea_
    } required$(par,required$(id))
  | {id:int} reversed$(ol_,reversed$(id))
  | {id:int} rows$(textarea_,rows$(id))
  | {id:int} {
        par == td_ ||
        par == th_
    } rowspan$(par,rowspan$(id))
  | {id:int} sandbox$(iframe_,sandbox$(id))
  | {id:int} scope$(th_,scope$(id))
  | {id:int} scoped$(style_,scoped$(id))
  | {id:int} selected$(option_,selected$(id))
  | {id:int} {
        par == a_ ||
        par == area_
    } shape$(par,shape$(id))
  | {id:int} {
        par == input_ ||
        par == select_ 
    } size$(par,size$(id))
  | {id:int} {
        par == link_ ||
        par == img_ ||
        par == source_ 
   } sizes$(par,sizes$(id))
  | {id:int} slot$(par,slot$(id))
  | {id:int} {
      par == col_ ||
      par == colgroup_
    } span$(par,span$(id))
  | {id:int} spellcheck$(par,spellcheck$(id))
  | {id:int} {
        par == audio_ ||
        par == embed_ ||
        par == iframe_ ||
        par == img_ ||
        par == input_ ||
        par == script_ ||
        par == source_ ||
        par == track_ ||
        par == video_  
    } src$(par,src$(id))
  | {id:int} srcdoc$(iframe_,srcdoc$(id))
  | {id:int} srclang$(track_,srclang$(id))
  | {id:int} srcset$(img_,srcset$(id))
  | {id:int} start$(ol_,start$(id))
  | {id:int} step$(input_,step$(id))
  | {id:int} style$(par,style$(id))
  | {id:int} summary$(table_,summary$(id))
  | {id:int} tabindex$(par,tabindex$(id))
  | {id:int} {
        par == a_ ||
        par == area_ ||
        par == base_ ||
        par == form_  
    } target$(par,target$(id))
  | {id:int} title$(par,title$(id))
  | {id:int} translate$(par,translate$(id))
  | {id:int} {
        par == button_ ||
        par == link_ ||
        par == input_ ||
        par == embed_ ||
        par == object_ ||
        par == script_ ||
        par == source_ ||
        par == style_ 
    } type$(par,type$(id))
  | {id:int} {
        par == img_ ||
        par == input_ ||
        par == object_ 
    } usemap$(par,usemap$(id))
  | {id:int}{
        par == button_ ||
        par == option_ ||
        par == input_ ||
        par == li_ ||
        par == meter_ ||
        par == progress_ ||
        par == param_ 
    } value$(par,value$(id))
  | {id:int} {
        par == canvas_ ||
        par == video_ ||
        par == iframe_ ||
        par == img_ ||
        par == embed_ ||
        par == object_ ||
        par == input_ 
    } width$(par,width$(id))
  | {id:int} wrap$(textarea_,wrap$(id))

  (** Combinators **)
  | {id:int}{ax:html5_attr_list} 
    OPT$(par,OPT$(ax,id))
      of ElmAttrs(par,ax) 
  | {id:int}{ax0,ax1:html5_attr_list} 
    EITHER$(par,EITHER$(ax0,ax1,id))
      of (ElmAttrs(par,ax0), ElmAttrs(par,ax1)) 

dataprop ElmChildren(par:html5_tag,es:html5_elm_list,cnst: html5_tag -> bool) =
  |  ElmChildrenNil(par,enil,cnst)
  |  {chi:html5_elm}{es:html5_elm_list}
     ElmChildrenCons(par,chi :*: es,cnst) 
      of (ElmChild(par,chi,cnst), ElmChildren(par,es,cnst))

and DlChildren(par:html5_tag,es:html5_elm_list,cnst : html5_tag -> bool,bool) =
  | dlnil(par,enil,cnst,false)
  | {attrs,a0:html5_attr_list}{nodes,n0,xs:html5_elm_list}
    dldt'(par,dt'(attrs,nodes) :*: dd'(a0,n0) :*: xs,cnst,false) 
      of (ElmChild(par,dt'(attrs,nodes),cnst), DlChildren(par,dd'(a0,n0) :*: xs,cnst,true))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {b:bool}
    dldd'(par,dd'(attrs,nodes) :*:  xs,cnst,true) 
      of (ElmChild(par,dd'(attrs,nodes),cnst), DlChildren(par,xs,cnst,b))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    dldiv'(par,div'(attrs,nodes) :*:  xs,cnst,false) 
      of ((ElmAttrs(div_,attrs), DlChildren(div_,nodes,cnst,false)), DlChildren(par,xs,cnst,false))

and TableChildren(es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | tablenil(enil,cnst,0)
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 5}
    tablecaption'(caption'(attrs,nodes) :*:  xs,cnst,6) 
      of (ElmChild(table_,caption'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 4 }
    tablecolgroup'(colgroup'(attrs,nodes) :*:  xs,cnst,5) 
      of (ElmChild(table_,colgroup'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 3}
    tablethead'(thead'(attrs,nodes) :*:  xs,cnst,4) 
      of (ElmChild(table_,thead'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 3 && x != 2}
    tabletbody'(tbody'(attrs,nodes) :*:  xs,cnst,3) 
      of (ElmChild(table_,tbody'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 2} 
      (** According to the spec, we need 1 or more tr, but 0 or
       more tbody; what's the difference between 0 tr and 0 tbody? *)
    tabletr'(tr'(attrs,nodes) :*:  xs,cnst,2) 
      of (ElmChild(table_,tr'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    tabletfoot'(tfoot'(attrs,nodes) :*:  xs,cnst,1) 
      of (ElmChild(table_,tfoot'(attrs,nodes),cnst), TableChildren(xs,cnst,0))

and RubyChildren(es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | rubynil(enil,cnst,0)
  (** One or more phrasing or rb elements **)
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    rubyrb'(rb'(attrs,nodes) :*: xs,cnst,0) 
      of (ElmChild(ruby_,rb'(attrs,nodes),cnst), RubyChildren(xs,cnst,0))
  | {elm:html5_elm}{xs:html5_elm_list}
    rubyphrasing'(elm :*: xs,cnst,0) 
      of (ElmChild(ruby_,elm,lam(tag) => cnst(tag) && tag != rtc_ && tag != rt_ && tag != rb_ && tag != rp_), RubyChildren(xs,cnst,0))
  (** One or more rtc or rt elements, immediately preceded or followed by an rp element **)
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}{i:int | i == 0 || i == ~1}
    rubyrtc'(rtc'(attrs,nodes) :*: xs,cnst,i + 1) 
      of (ElmChild(ruby_,rtc'(attrs,nodes),cnst), RubyChildren(xs,cnst,i))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}{i:int | i == 0 || i == ~1 }
    rubyrt'(rt'(attrs,nodes) :*: xs,cnst,i + 1) 
      of (ElmChild(ruby_,rt'(attrs,nodes),cnst), RubyChildren(xs,cnst,i))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}{i:int | i == 0 || i == 1}
    rubyrp'(rp'(attrs,nodes) :*: xs,cnst,i - 1) 
      of (ElmChild(ruby_,rp'(attrs,nodes),cnst), RubyChildren(xs,cnst,i))

and MediaChildren(par:html5_tag,es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | medianil(par,enil,cnst,0)
  | {elm:html5_elm}{es:html5_elm_list} 
    Mediaelm(par,elm :*: es,cnst,0)
      (** This is messier than I would like, but not sure how to exclude source tags here;
          Still, Media elms cannot contain other media elms, so this is probably not an issue **)
      of (ElmChild(par,elm,lam(tag) => cnst(tag) && tag != source_ && tag != track_), MediaChildren(par,es,cnst,0))
  | {attrs:html5_attr_list}{es:html5_elm_list}{i:int | i == 0 || i == 1}
    mediatrack'(par,track'(attrs) :*: es, cnst, 1 )
      of (ElmChild(par,track'(attrs),cnst), MediaChildren(par,es,cnst,i))
  | {attrs:html5_attr_list}{es:html5_elm_list}{i:int | i == 0 || i == 1 || i == 2}
    mediasource'(par,source'(attrs) :*: es, cnst, 2 )
      of (ElmChild(par,source'(attrs),cnst), MediaChildren(par,es,cnst,i))
      
and PictureChildren(es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | picturenil(enil,cnst,0)
  | {attrs:html5_attr_list}{es:html5_elm_list} 
    pictureimg'(img'(attrs) :*: es,cnst,1)
      of (ElmChild(picture_,img'(attrs),cnst), PictureChildren(es,cnst,0))
  | {attrs:html5_attr_list}{es:html5_elm_list}{i:int | i == 2 || i == 1}
    picturesource'(source'(attrs) :*: es, cnst, 2   )
      of (ElmChild(picture_,source'(attrs),cnst), PictureChildren(es,cnst,i))

and FieldsetChildren(es:html5_elm_list,cnst : html5_tag -> bool,bool) =
  | fieldsetnil(enil,cnst,false)
  | {attrs:html5_attr_list}{nodes,es:html5_elm_list} 
    fieldsetlegend'(legend'(attrs,nodes) :*: es,cnst,true)
      of (ElmChild(fieldset_,legend'(attrs,nodes),cnst), FieldsetChildren(es,cnst,false))
  | {elm:html5_elm}{es:html5_elm_list} 
    fieldsetflow'(elm :*: es,cnst,false)
      (** This is messier than I would like, but not sure how to exclude source tags here; **)
      of (ElmChild(fieldset_,elm,lam(tag) => cnst(tag) && tag != legend_), FieldsetChildren(es,cnst,false))
(** Notes: it's assumed that flow content is the most permissive.
    Any items with a content model of "flow" just pass the constraint
    to their children.  More restrictive content models 
    will be the union of the cnst and their own rules

    <area> elements are the only ones that require a specific ancestor
    (<map> or <template>).  This is done by prohibiting them at the
    and then easing the restriction inside of a <map> or <template>

    A similar approach is done with header / footer tags, which cannot
    contain header / footer tags unless they are the children of sectioning content.
    They are "excluded" in the header element and then permitted as children
    of sectioning elements
**)
and ElmChild(par:html5_tag,chi:html5_elm,cnst: html5_tag -> bool) =
  | {id:int}{par: html5_tag |  html5_content_phrasing(par) || par == title_}
     text'(par,text'(id),cnst) 
  | {id:int}
    comment'(par,comment'(id),cnst)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}{cnst(head_)}
    {cnst(head_)}
    head'(html_,head'(attrs,nodes),cnst) 
      of (ElmAttrs(head_,attrs), ElmChildren(head_,nodes,cnst))
  | {id:int} {cnst(title_)}
    title'(head_,title'(id),cnst) 
  | {attrs:html5_attr_list}{cnst(base_)} 
    {cnst(base_)}
    base'(head_,base'(attrs),cnst)  of ElmAttrs(base_,attrs)
  | {attrs:html5_attr_list}{cnst(link_)} 
    {cnst(link_)}
    link'(head_,link'(attrs),cnst)  of ElmAttrs(link_,attrs)
  | {attrs:html5_attr_list}{cnst(meta_)} 
    {cnst(meta_)}
    meta'(head_,meta'(attrs),cnst)  of ElmAttrs(meta_,attrs)
  | {id:int}{attrs:html5_attr_list}{cnst(style_)} 
    {cnst(style_)}
    style'(head_,style'(attrs,id),cnst)  of ElmAttrs(style_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}{cnst(body_)}
    {cnst(body_)}
    body'(html_,body'(attrs,nodes),cnst) 
      of (ElmAttrs(body_,attrs), ElmChildren(body_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(article_)}
    article'(par,article'(attrs,nodes),cnst) 
      of (ElmAttrs(article_,attrs), ElmChildren(article_,nodes,
         lam(tag) => (cnst(tag) && tag != main_) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(section_)}
    section'(par,section'(attrs,nodes),cnst) 
      of (ElmAttrs(section_,attrs), ElmChildren(section_,nodes,
        lam(tag) => cnst(tag) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(nav_)}
    nav'(par,nav'(attrs,nodes),cnst) 
      of (ElmAttrs(nav_,attrs), ElmChildren(nav_,nodes,
        lam(tag) => (cnst(tag) && tag != main_) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(aside_)}
    aside'(par,aside'(attrs,nodes),cnst) 
      of (ElmAttrs(aside_,attrs), ElmChildren(aside_,nodes,
        lam(tag) => (cnst(tag) && tag != main_) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h1_)}
    h1'(par,h1'(attrs,nodes),cnst) 
      of (ElmAttrs(h1_,attrs), ElmChildren(h1_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h2_)}
    h2'(par,h2'(attrs,nodes),cnst) 
      of (ElmAttrs(h2_,attrs), ElmChildren(h2_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h3_)}
    h3'(par,h3'(attrs,nodes),cnst) 
      of (ElmAttrs(h3_,attrs), ElmChildren(h3_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h4_)}
    h4'(par,h4'(attrs,nodes),cnst) 
      of (ElmAttrs(h4_,attrs), ElmChildren(h4_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h5_)}
    h5'(par,h5'(attrs,nodes),cnst) 
      of (ElmAttrs(h5_,attrs), ElmChildren(h5_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(h6_)}
    h6'(par,h6'(attrs,nodes),cnst) 
      of (ElmAttrs(h6_,attrs), ElmChildren(h6_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(header_)}
    header'(par,header'(attrs,nodes),cnst) 
      of (ElmAttrs(header_,attrs), ElmChildren(header_,nodes,
        lam(tag) => cnst(tag) && tag != main_ && tag != header_ && tag != footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(footer_)}
    footer'(par,footer'(attrs,nodes),cnst) 
      of (ElmAttrs(footer_,attrs), ElmChildren(footer_,nodes,
        lam(tag) => cnst(tag) && tag != main_ && tag != header_ && tag != footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(p_)}
    p'(par,p'(attrs,nodes),cnst) 
      of (ElmAttrs(p_,attrs), ElmChildren(p_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(address_)}
    address'(par,address'(attrs,nodes),cnst) 
      of (ElmAttrs(address_,attrs), ElmChildren(address_,nodes,
          lam(tag) => cnst(tag) && ~is_sectioning(tag) && ~is_heading(tag) && tag != header_ && tag != footer_ && tag != address_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list} 
    {cnst(hr_)}
    hr'(par,hr'(attrs),cnst)  of ElmAttrs(hr_,attrs)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(pre_)}
    pre'(par,pre'(attrs,nodes),cnst) 
      of (ElmAttrs(pre_,attrs), ElmChildren(pre_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(blockquote_)}
    blockquote'(par,blockquote'(attrs,nodes),cnst) 
      of (ElmAttrs(blockquote_,attrs), ElmChildren(blockquote_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ol_)}
    ol'(par,ol'(attrs,nodes),cnst) 
      of (ElmAttrs(ol_,attrs), ElmChildren(ol_,nodes,lam(tag) => cnst(tag) || tag == li_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ul_)}
    ul'(par,ul'(attrs,nodes),cnst) 
      of (ElmAttrs(ul_,attrs), ElmChildren(ul_,nodes,lam(tag) => cnst(tag) || tag == li_))
  | {par:html5_tag | par == ul_ || par == ol_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(li_)}
    li'(par,li'(attrs,nodes),cnst) 
      of (ElmAttrs(li_,attrs), ElmChildren(li_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dl_)}
    dl'(par,dl'(attrs,nodes),cnst) 
      of (ElmAttrs(dl_,attrs), DlChildren(dl_,nodes,cnst,false))
  (*
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dl_)}
    dl'(par,dl'(attrs,nodes),cnst) 
      of (ElmAttrs(dl_,attrs), ElmChildren(dl_,nodes,cnst))
  *)
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    dt'(par,dt'(attrs,nodes),cnst) 
      of (ElmAttrs(dt_,attrs), ElmChildren(dt_,nodes,
        lam(tag) => cnst(tag) && ~is_sectioning(tag)))
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    dd'(par,dd'(attrs,nodes),cnst) 
      of (ElmAttrs(dd_,attrs), ElmChildren(dd_,nodes,cnst))

  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(figure_)}
    figure'(par,figure'(attrs,nodes),cnst) 
      of (ElmAttrs(figure_,attrs), ElmChildren(figure_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(figcaption_)}
    figcaption'(figure_,figcaption'(attrs,nodes),cnst) 
      of (ElmAttrs(figcaption_,attrs), ElmChildren(figcaption_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(main_)}
    main'(par,main'(attrs,nodes),cnst) 
      of (ElmAttrs(main_,attrs), ElmChildren(main_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(div_)}
    div'(par,div'(attrs,nodes),cnst) 
      of (ElmAttrs(div_,attrs), ElmChildren(div_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(a_)}
    a'(par,a'(attrs,nodes),cnst) 
      of (ElmAttrs(a_,attrs), ElmChildren(par,nodes,
        lam(tag) => cnst(tag) && ~is_interactive(tag))) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(em_)}
    em'(par,em'(attrs,nodes),cnst) 
      of (ElmAttrs(em_,attrs), ElmChildren(em_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(strong_)}
    strong'(par,strong'(attrs,nodes),cnst) 
      of (ElmAttrs(strong_,attrs), ElmChildren(strong_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(small_)}
    small'(par,small'(attrs,nodes),cnst) 
      of (ElmAttrs(small_,attrs), ElmChildren(small_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(s_)}
    s'(par,s'(attrs,nodes),cnst) 
      of (ElmAttrs(s_,attrs), ElmChildren(s_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(q_)}
    q'(par,q'(attrs,nodes),cnst) 
      of (ElmAttrs(q_,attrs), ElmChildren(q_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(cite_)}
    cite'(par,cite'(attrs,nodes),cnst) 
      of (ElmAttrs(cite_,attrs), ElmChildren(cite_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dfn_)}
    dfn'(par,dfn'(attrs,nodes),cnst) 
      of (ElmAttrs(dfn_,attrs), ElmChildren(dfn_,nodes,
        lam(tag) => cnst(tag) && tag != dfn_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(abbr_)}
    abbr'(par,abbr'(attrs,nodes),cnst) 
      of (ElmAttrs(abbr_,attrs), ElmChildren(abbr_,nodes,cnst))
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ruby_)}
    ruby'(par,ruby'(attrs,nodes),cnst) 
      of (ElmAttrs(ruby_,attrs), ElmChildren(ruby_,nodes,cnst))
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ruby_)}
    ruby'(par,ruby'(attrs,nodes),cnst) 
      of (ElmAttrs(ruby_,attrs), RubyChildren(nodes,cnst,0))

  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    rb'(ruby_,rb'(attrs,nodes),cnst) 
      of (ElmAttrs(rb_,attrs), ElmChildren(rb_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    rt'(ruby_,rt'(attrs,nodes),cnst) 
      of (ElmAttrs(rt_,attrs), ElmChildren(rt_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    rtc'(ruby_,rtc'(attrs,nodes),cnst) 
      of (ElmAttrs(rtc_,attrs), ElmChildren(rtc_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    rp'(ruby_,rp'(attrs,nodes),cnst) 
      of (ElmAttrs(rp_,attrs), ElmChildren(rp_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(data_)}
    data'(par,data'(attrs,nodes),cnst) 
      of (ElmAttrs(data_,attrs), ElmChildren(data_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(time_)}
    time'(par,time'(attrs,nodes),cnst) 
      of (ElmAttrs(time_,attrs), ElmChildren(time_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(code_)}
    code'(par,code'(attrs,nodes),cnst) 
      of (ElmAttrs(code_,attrs), ElmChildren(code_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(var_)}
    var'(par,var'(attrs,nodes),cnst) 
      of (ElmAttrs(var_,attrs), ElmChildren(var_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(samp_)}
    samp'(par,samp'(attrs,nodes),cnst) 
      of (ElmAttrs(samp_,attrs), ElmChildren(samp_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(kbd_)}
    kbd'(par,kbd'(attrs,nodes),cnst) 
      of (ElmAttrs(kbd_,attrs), ElmChildren(kbd_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(sub_)}
    sub'(par,sub'(attrs,nodes),cnst) 
      of (ElmAttrs(sub_,attrs), ElmChildren(sub_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(sup_)}
    sup'(par,sup'(attrs,nodes),cnst) 
      of (ElmAttrs(sup_,attrs), ElmChildren(sup_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(i_)}
    i'(par,i'(attrs,nodes),cnst) 
      of (ElmAttrs(i_,attrs), ElmChildren(i_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(b_)}
    b'(par,b'(attrs,nodes),cnst) 
      of (ElmAttrs(b_,attrs), ElmChildren(b_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(u_)}
    u'(par,u'(attrs,nodes),cnst) 
      of (ElmAttrs(u_,attrs), ElmChildren(u_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(mark_)}
    mark'(par,mark'(attrs,nodes),cnst) 
      of (ElmAttrs(mark_,attrs), ElmChildren(mark_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(bdi_)}
    bdi'(par,bdi'(attrs,nodes),cnst) 
      of (ElmAttrs(bdi_,attrs), ElmChildren(bdi_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(bdo_)}
    bdo'(par,bdo'(attrs,nodes),cnst) 
      of (ElmAttrs(bdo_,attrs), ElmChildren(bdo_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(span_)}
    span'(par,span'(attrs,nodes),cnst) 
      of (ElmAttrs(span_,attrs), ElmChildren(span_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(br_)}
    br'(par,br'(attrs),cnst)  of ElmAttrs(br_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(wbr_)}
    wbr'(par,wbr'(attrs),cnst)  of ElmAttrs(wbr_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ins_)}
    ins'(par,ins'(attrs,nodes),cnst) 
      of (ElmAttrs(ins_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(del_)}
    del'(par,del'(attrs,nodes),cnst) 
      of (ElmAttrs(del_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(picture_)}
    picture'(par,picture'(attrs,nodes),cnst) 
      of (ElmAttrs(picture_,attrs), ElmChildren(picture_,nodes,cnst))
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(picture_)}{i:int | i == 1 || i == 2}
    picture'(par,picture'(attrs,nodes),cnst) 
      of (ElmAttrs(picture_,attrs), PictureChildren(nodes,cnst,i))

  | {par: html5_tag | par == picture_ || par == audio_ || par == video_}
    {attrs:html5_attr_list} 
    source'(par,source'(attrs),cnst)  of ElmAttrs(source_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(img_)}
    img'(par,img'(attrs),cnst)  of ElmAttrs(img_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(iframe_)}
    iframe'(par,iframe'(attrs,nodes),cnst) 
      of (ElmAttrs(iframe_,attrs), ElmChildren(iframe_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(embed_)}
    embed'(par,embed'(attrs),cnst)  of ElmAttrs(embed_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(object_)}
    object'(par,object'(attrs,nodes),cnst) 
      of (ElmAttrs(object_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  | {attrs:html5_attr_list} 
    {cnst(param_)}
    param'(object_,param'(attrs),cnst)  of ElmAttrs(param_,attrs)
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(video_)}
    video'(par,video'(attrs,nodes),cnst) 
      of (ElmAttrs(video_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(video_)}{i:int}
    video'(par,video'(attrs,nodes),cnst) 
      of (ElmAttrs(video_,attrs), MediaChildren(par,nodes,cnst,i)) // transparent
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(audio_)}
    audio'(par,audio'(attrs,nodes),cnst) 
      of (ElmAttrs(audio_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(audio_)}{i:int}
    audio'(par,audio'(attrs,nodes),cnst) 
      of (ElmAttrs(audio_,attrs), MediaChildren(par,nodes,cnst,i)) // transparent
  | {par: html5_tag | par == audio_ || par == video_}
    {attrs:html5_attr_list} 
    {cnst(track_)}
    track'(par,track'(attrs),cnst)  of ElmAttrs(track_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(map_)}
    map'(par,map'(attrs,nodes),cnst) 
      of (ElmAttrs(map_,attrs), ElmChildren(par,nodes,
        lam(tag) => cnst(tag) || tag == area_)) // transparent
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(area_)}
    area'(par,area'(attrs),cnst)  of ElmAttrs(area_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(svg_)}
    svg'(par,svg'(attrs,nodes),cnst) 
      of (ElmAttrs(svg_,attrs), ElmChildren(svg_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(math_)}
    math'(par,math'(attrs,nodes),cnst) 
      of (ElmAttrs(math_,attrs), ElmChildren(math_,nodes,cnst))
  (*
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(table_)}
    table'(par,table'(attrs,nodes),cnst) 
      of (ElmAttrs(table_,attrs), ElmChildren(table_,nodes,cnst))
  *)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(table_)}{x:int | x != 2}
    table'(par,table'(attrs,nodes),cnst) 
      of (ElmAttrs(table_,attrs), TableChildren(nodes,cnst,x))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(caption_)}
    caption'(par,caption'(attrs,nodes),cnst) 
      of (ElmAttrs(caption_,attrs), ElmChildren(caption_,nodes,
        lam(tag) => cnst(tag) && tag != table_))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    colgroup'(par,colgroup'(attrs,nodes),cnst) 
      of (ElmAttrs(colgroup_,attrs), ElmChildren(colgroup_,nodes,cnst))
  | {attrs:html5_attr_list} 
    col'(par,col'(attrs),cnst)  of ElmAttrs(col_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    tbody'(table_,tbody'(attrs,nodes),cnst) 
      of (ElmAttrs(tbody_,attrs), ElmChildren(tbody_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    thead'(table_,thead'(attrs,nodes),cnst) 
      of (ElmAttrs(thead_,attrs), ElmChildren(thead_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    tfoot'(table_,tfoot'(attrs,nodes),cnst) 
      of (ElmAttrs(tfoot_,attrs), ElmChildren(tfoot_,nodes,cnst))
  | {par:html5_tag | par == table_ || par == tbody_ || par == thead_ || par == tfoot_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    tr'(par,tr'(attrs,nodes),cnst) 
      of (ElmAttrs(tr_,attrs), ElmChildren(tr_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    td'(tr_,td'(attrs,nodes),cnst) 
      of (ElmAttrs(td_,attrs), ElmChildren(td_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    th'(tr_,th'(attrs,nodes),cnst) 
      of (ElmAttrs(th_,attrs), ElmChildren(th_,nodes,
        lam(tag) => cnst(tag) && ~is_sectioning(tag)))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(form_)}
    form'(par,form'(attrs,nodes),cnst) 
      of (ElmAttrs(form_,attrs), ElmChildren(form_,nodes,
        lam(tag) => cnst(tag) && tag != form_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(label_)}
    label'(par,label'(attrs,nodes),cnst) 
      of (ElmAttrs(label_,attrs), ElmChildren(label_,nodes,
        lam(tag) => cnst(tag) && tag != label_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(input_)}
    input'(par,input'(attrs),cnst)  of ElmAttrs(input_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(button_)}
    button'(par,button'(attrs,nodes),cnst) 
      of (ElmAttrs(button_,attrs), ElmChildren(button_,nodes,
        lam(tag) => cnst(tag) && ~is_interactive(tag)))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(select_)}
    select'(par,select'(attrs,nodes),cnst) 
      of (ElmAttrs(select_,attrs), ElmChildren(select_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(datalist_)}
    datalist'(par,datalist'(attrs,nodes),cnst) 
      of (ElmAttrs(datalist_,attrs), ElmChildren(datalist_,nodes,cnst))
  | {par: html5_tag | par == select_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(optgroup_)}
    optgroup'(par,optgroup'(attrs,nodes),cnst) 
      of (ElmAttrs(optgroup_,attrs), ElmChildren(optgroup_,nodes,cnst))
  | {par:html5_tag | par == select_ || par == optgroup_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(option_)}
    option'(par,option'(attrs,nodes),cnst) 
      of (ElmAttrs(option_,attrs), ElmChildren(option_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(textarea_)}
    textarea'(par,textarea'(attrs,nodes),cnst) 
      of (ElmAttrs(textarea_,attrs), ElmChildren(textarea_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(output_)}
    output'(par,output'(attrs,nodes),cnst) 
      of (ElmAttrs(output_,attrs), ElmChildren(output_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(progress_)}
    progress'(par,progress'(attrs,nodes),cnst) 
      of (ElmAttrs(progress_,attrs), ElmChildren(progress_,nodes,
        lam(tag) => cnst(tag) && tag != progress_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(meter_)}
    meter'(par,meter'(attrs,nodes),cnst) 
      of (ElmAttrs(meter_,attrs), ElmChildren(meter_,nodes,
        lam(tag) => cnst(tag) && tag != meter_))
    (*
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(fieldset_)}
    fieldset'(par,fieldset'(attrs,nodes),cnst) 
      of (ElmAttrs(fieldset_,attrs), ElmChildren(fieldset_,nodes,cnst))
    *)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(fieldset_)}{b:bool}
    fieldset'(par,fieldset'(attrs,nodes),cnst) 
      of (ElmAttrs(fieldset_,attrs), FieldsetChildren(nodes,cnst,b))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(legend_)}
    legend'(fieldset_,legend'(attrs,nodes),cnst) 
      of (ElmAttrs(legend_,attrs), ElmChildren(legend_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(details_)}
    details'(par,details'(attrs,nodes),cnst) 
      of (ElmAttrs(details_,attrs), ElmChildren(details_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(summary_)}
    summary'(details_,summary'(attrs,nodes),cnst) 
      of (ElmAttrs(summary_,attrs), ElmChildren(summary_,nodes,cnst))
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(script_)}
    script'(par,script'(attrs,id),cnst) 
      of (ElmAttrs(script_,attrs))
  | {par:html5_tag}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(noscript_)}
    noscript'(par,noscript'(attrs,nodes),cnst) 
      of (ElmAttrs(noscript_,attrs), ElmChildren(par,nodes,
        lam(x) => cnst(x) && x != noscript_)) // transparent
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(template_)}
    template'(par,template'(attrs,id),
      lam(tag) => cnst(tag) || tag == area_) 
      of (ElmAttrs(template_,attrs))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(canvas_)}
    canvas'(par,canvas'(attrs,nodes),cnst) 
      of (ElmAttrs(canvas_,attrs), ElmChildren(par,nodes,cnst)) // transparent

  (** Combinators **)
 
  | {id:int}{e0,e1:html5_elm_list}
    MANY_OR'(par,MANY_OR'(e0,e1,id),cnst)
      of (ElmChildren(par,e0,cnst),ElmChildren(par,e1,cnst)) 
  | {id:int}{e0,e1:html5_elm_list}
    EITHER'(par,EITHER'(e0,e1,id),cnst)
      of (ElmChildren(par,e0,cnst),ElmChildren(par,e1,cnst)) 
  | {id:int}{e0:html5_elm_list}
    OPT'(par,OPT'(e0,id),cnst)
      of (ElmChildren(par,e0,cnst)) 
  | {a:vt@ype+}{id:int}{e0:html5_elm_list}
    WITH'(par,WITH'(a,e0,id),cnst)
      of (ElmChildren(par,e0,cnst)) 
 
dataprop Document(html5_elm_list) =
  | {h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    document0( 
        doctype'
    :*: head'(h1as, h1es)
    :*: body'(bas, bes)
    :*: enil
    ) of (
      ElmAttrs(head_,h1as)
    , ElmChildren(head_,h1es,is_metadata)
    , ElmAttrs(body_,bas)
    , ElmChildren(body_,bes,lam(tag) => is_flow(tag) && tag != area_)
    )   
  | {h0as,h1as,bas:html5_attr_list}
    {h1es,bes:html5_elm_list}
    document1( 
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
    , ElmChildren(body_,bes,lam(tag) => is_flow(tag) && tag != area_)
    )   

(** Be warned: we rely on the ability of ATS2 to infer `es` **) 
fun {env:vt@ype+}{es: html5_elm_list }
  html5_elm_list_out_verified( pf: Document(es) | env: &env ) : void

