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

#include "./../HATS/atshtml_infix.hats"

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

dataprop ElmAttrs(tag:html5_tag,ax:html5_attr_list) = 
  |  ElmAttrsNil(tag,anil)
  | {attr:html5_attr}{ax:html5_attr_list}
     ElmAttrsCons(tag, attr :@: ax )
      of (ElmAttr(tag,attr), ElmAttrs(tag,ax))

and ElmAttr(par:html5_tag,html5_attr) =
  | {id:int}{
        par == meta_ ||
        par == script_
    } Charset$(par, charset$(id))
  | {id:int}{
        par == form_ ||
        par == input_
    } Accept$(par,accept$(id))
  | {id:int} Accept_Charset$(form_,accept_charset$(id))
  | {id:int} Accesskey$(par,accesskey$(id))
  | {id:int} Action$(form_,action$(id))
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
    } Align$(par,align$(id))
  | {id:int}{
        par == area_ ||
        par == img_ ||
        par == input_ 
    } Alt$(par,alt$(id))
  | {id:int} Async$(script_,async$(id))
  | {id:int} Autocapitalize$(par,autocapitalize$(id))
  | {id:int}{
        par == form_ ||
        par == input_ ||
        par == textarea_
    } Autocomplete$(par,autocomplete$(id))
  | {id:int}{
        par == button_ ||
        par == input_ 
    } Autofocus$(par,autofocus$(id))
  | {id:int}{
        par == video_ ||
        par == audio_ 
    } Autoplay$(par,autoplay$(id))
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
    } Bgcolor$(par,bgcolor$(id))
  | {id:int} Border$(par,border$(id))
  | {id:int} {
        par == video_ ||
        par == audio_ 
    } Buffered$(par,buffered$(id))
  | {id:int} Challenge$(par,challenge$(id))
  | {id:int} Charset$(par,charset$(id))
  | {id:int} Checked$(input_,checked$(id))
  | {id:int}{
        par == blockquote_ ||
        par == del_ ||
        par == ins_ ||
        par == q_  
    } Cite$(par,cite$(id))
  | {id:int} Class$(par,class$(id))
  | {id:int} Code$(par,code$(id))
  | {id:int} Codebase$(par,codebase$(id))
  | {id:int} Color$(hr_,color$(id))
  | {id:int} Cols$(textarea_,cols$(id))
  | {id:int}{
        par == td_ ||
        par == th_
    } Colspan$(par,colspan$(id))
  | {id:int} Content$(meta_,content$(id))
  | {id:int} Contenteditable$(par,contenteditable$(id))
  | {id:int} Contextmenu$(par,contextmenu$(id))
  | {id:int} {
        par == video_ ||
        par == audio_ 
    } Controls$(par,controls$(id))
  | {id:int} Coords$(area_,coords$(id))
  | {id:int} Crossorigin$(par,crossorigin$(id))
  | {id:int} Data$(object_,data$(id))
  | {k,v:int} DataKv$(par,data_kv$(k,v))
  | {id:int} {
        par == del_ ||
        par == ins_ ||
        par == time_ 
    } Datetime$(par,datetime$(id))
  | {id:int} Default$(track_,default$(id))
  | {id:int} Defer$(script_,defer$(id))
  | {id:int} Dir$(par,dir$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_
    } Dirname$(par,dirname$(id))
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
    } Disabled$(par,disabled$(id))
  | {id:int} Download$(par,download$(id))
  | {id:int} Draggable$(par,draggable$(id))
  | {id:int} Dropzone$(par,dropzone$(id))
  | {id:int} Enctype$(form_,enctype$(id))
  | {id:int} {
        par == label_ ||
        par == output_
    } For$(par,for$(id))
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
    } Form$(par,form$(id))
  | {id:int} {
        par == input_ ||
        par == button_
    } Formaction$(par,formaction$(id))
  | {id:int}{
        par == td_ ||
        par == th_
    } Headers$(par,headers$(id))
  | {id:int}{
        par == canvas_ ||
        par == video_ ||
        par == iframe_ ||
        par == img_ ||
        par == embed_ ||
        par == object_ ||
        par == input_ 
    } Height$(par,height$(id))
  | {id:int} Hidden$(par,hidden$(id))
  | {id:int} High$(meter_,high$(id))
  | {id:int} Href$(par,href$(id))
  | {id:int}{
        par == a_ ||
        par == area_ ||
        par == link_
    } Hreflang$(par,hreflang$(id))
  | {id:int} Http_equiv$(meta_,http_equiv$(id))
  | {id:int} Icon$(par,icon$(id))
  | {id:int} Id$(par,id$(id))
  | {id:int} {
        par == link_ ||
        par == script_
    } Integrity$(par,integrity$(id))
  | {id:int} Ismap$(img_,ismap$(id))
  | {id:int} Itemprop$(par,itemprop$(id))
  | {id:int} Keytype$(par,keytype$(id))
  | {id:int} Kind$(track_,kind$(id))
  | {id:int} Label$(track_,label$(id))
  | {id:int} Lang$(par,lang$(id))
  | {id:int} Language$(script_,language$(id))
  | {id:int} List$(input_,list$(id))
  | {id:int} {
        par == video_ ||
        par == audio_ 
    } Loop$(par,loop$(id))
  | {id:int} Low$(meter_,low$(id))
  | {id:int} Manifest$(html_,manifest$(id))
  | {id:int} {
        par == input_ ||
        par == meter_ ||
        par == progress_ 
    } Max$(par,max$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
    }  Maxlength$(par,maxlength$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
   } Minlength$(par,minlength$(id))
  | {id:int}{
        par == a_ ||
        par == area_ ||
        par == link_ ||
        par == source_ ||
        par == style_ 
    } Media$(par,media$(id))
  | {id:int} Method$(form_,method$(id))
  | {id:int} {
        par == input_ ||
        par == meter_ 
    } Min$(par,min$(id))
  | {id:int}{
        par == input_ ||
        par == select_ 
    } Multiple$(par,multiple$(id))
  | {id:int}{
        par == video_ ||
        par == audio_ 
    } Muted$(par,muted$(id))
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
    } Name$(par,name$(id))
  | {id:int} Novalidate$(form_,novalidate$(id))
  | {id:int} Open$(details_,open$(id))
  | {id:int} Optimum$(meter_,optimum$(id))
  | {id:int} Pattern$(input_,pattern$(id))
  | {id:int} {
        par == a_ ||
        par == area_
    } Ping$(par,ping$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
    } Placeholder$(par,placeholder$(id))
  | {id:int} Poster$(video_,poster$(id))
  | {id:int}{
        par == video_ ||
        par == audio_ 
    } Preload$(par,preload$(id))
  | {id:int} Radiogroup$(par,radiogroup$(id))
  | {id:int} {
        par == input_ ||
        par == textarea_ 
    } Readonly$(par,readonly$(id))
  | {id:int} {
        par == a_ ||
        par == area_ ||
        par == link_  
    } Rel$(par,rel$(id))
  | {id:int} {
        par == input_ ||
        par == select_ || 
        par == textarea_
    } Required$(par,required$(id))
  | {id:int} Reversed$(ol_,reversed$(id))
  | {id:int} Rows$(textarea_,rows$(id))
  | {id:int} {
        par == td_ ||
        par == th_
    } Rowspan$(par,rowspan$(id))
  | {id:int} Sandbox$(iframe_,sandbox$(id))
  | {id:int} Scope$(th_,scope$(id))
  | {id:int} Scoped$(style_,scoped$(id))
  | {id:int} Selected$(option_,selected$(id))
  | {id:int} {
        par == a_ ||
        par == area_
    } Shape$(par,shape$(id))
  | {id:int} {
        par == input_ ||
        par == select_ 
    } Size$(par,size$(id))
  | {id:int} {
        par == link_ ||
        par == img_ ||
        par == source_ 
   } Sizes$(par,sizes$(id))
  | {id:int} Slot$(par,slot$(id))
  | {id:int} {
      par == col_ ||
      par == colgroup_
    } Span$(par,span$(id))
  | {id:int} Spellcheck$(par,spellcheck$(id))
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
    } Src$(par,src$(id))
  | {id:int} Srcdoc$(iframe_,srcdoc$(id))
  | {id:int} Srclang$(track_,srclang$(id))
  | {id:int} Srcset$(img_,srcset$(id))
  | {id:int} Start$(ol_,start$(id))
  | {id:int} Step$(input_,step$(id))
  | {id:int} Style$(par,style$(id))
  | {id:int} Summary$(table_,summary$(id))
  | {id:int} Tabindex$(par,tabindex$(id))
  | {id:int} {
        par == a_ ||
        par == area_ ||
        par == base_ ||
        par == form_  
    } Target$(par,target$(id))
  | {id:int} Title$(par,title$(id))
  | {id:int} Translate$(par,translate$(id))
  | {id:int} {
        par == button_ ||
        par == link_ ||
        par == input_ ||
        par == embed_ ||
        par == object_ ||
        par == script_ ||
        par == source_ ||
        par == style_ 
    } Type$(par,type$(id))
  | {id:int} {
        par == img_ ||
        par == input_ ||
        par == object_ 
    } Usemap$(par,usemap$(id))
  | {id:int}{
        par == button_ ||
        par == option_ ||
        par == input_ ||
        par == li_ ||
        par == meter_ ||
        par == progress_ ||
        par == param_ 
    } Value$(par,value$(id))
  | {id:int} {
        par == canvas_ ||
        par == video_ ||
        par == iframe_ ||
        par == img_ ||
        par == embed_ ||
        par == object_ ||
        par == input_ 
    } Width$(par,width$(id))
  | {id:int} Wrap$(textarea_,wrap$(id))

  (** Combinators **)
  | {id:int}{ax:html5_attr_list} 
    Opt$(par,OPT$(ax,id))
      of ElmAttrs(par,ax) 
  | {id:int}{ax0,ax1:html5_attr_list} 
    Either$(par,EITHER$(ax0,ax1,id))
      of (ElmAttrs(par,ax0), ElmAttrs(par,ax1)) 

dataprop ElmChildren(par:html5_tag,es:html5_elm_list,cnst: html5_tag -> bool) =
  |  ElmChildrenNil(par,enil,cnst)
  |  {chi:html5_elm}{es:html5_elm_list}
     ElmChildrenCons(par,chi :*: es,cnst) 
      of (ElmChild(par,chi,cnst), ElmChildren(par,es,cnst))

and DlChildren(par:html5_tag,es:html5_elm_list,cnst : html5_tag -> bool,bool) =
  | DlNil(par,enil,cnst,false)
  | {attrs,a0:html5_attr_list}{nodes,n0,xs:html5_elm_list}
    DlDt'(par,dt'(attrs,nodes) :*: dd'(a0,n0) :*: xs,cnst,false) 
      of (ElmChild(par,dt'(attrs,nodes),cnst), DlChildren(par,dd'(a0,n0) :*: xs,cnst,true))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {b:bool}
    DlDd'(par,dd'(attrs,nodes) :*:  xs,cnst,true) 
      of (ElmChild(par,dd'(attrs,nodes),cnst), DlChildren(par,xs,cnst,b))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    DlDiv'(par,div'(attrs,nodes) :*:  xs,cnst,false) 
      of ((ElmAttrs(div_,attrs), DlChildren(div_,nodes,cnst,false)), DlChildren(par,xs,cnst,false))

and TableChildren(es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | TableNil(enil,cnst,0)
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 5}
    TableCaption'(caption'(attrs,nodes) :*:  xs,cnst,6) 
      of (ElmChild(table_,caption'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 4 }
    TableColgroup'(colgroup'(attrs,nodes) :*:  xs,cnst,5) 
      of (ElmChild(table_,colgroup'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 3}
    TableThead'(thead'(attrs,nodes) :*:  xs,cnst,4) 
      of (ElmChild(table_,thead'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 3 && x != 2}
    TableTbody'(tbody'(attrs,nodes) :*:  xs,cnst,3) 
      of (ElmChild(table_,tbody'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    {x:nat | x <= 2} 
      (** According to the spec, we need 1 or more tr, but 0 or
       more tbody; what's the difference between 0 tr and 0 tbody? *)
    TableTr'(tr'(attrs,nodes) :*:  xs,cnst,2) 
      of (ElmChild(table_,tr'(attrs,nodes),cnst), TableChildren(xs,cnst,x))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    TableTfoot'(tfoot'(attrs,nodes) :*:  xs,cnst,1) 
      of (ElmChild(table_,tfoot'(attrs,nodes),cnst), TableChildren(xs,cnst,0))

and RubyChildren(es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | RubyNil(enil,cnst,0)
  (** One or more phrasing or rb elements **)
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}
    RubyRb'(rb'(attrs,nodes) :*: xs,cnst,0) 
      of (ElmChild(ruby_,rb'(attrs,nodes),cnst), RubyChildren(xs,cnst,0))
  | {elm:html5_elm}{xs:html5_elm_list}
    RubyPhrasing'(elm :*: xs,cnst,0) 
      of (ElmChild(ruby_,elm,lam(tag) => cnst(tag) && tag != rtc_ && tag != rt_ && tag != rb_ && tag != rp_), RubyChildren(xs,cnst,0))
  (** One or more rtc or rt elements, immediately preceded or followed by an rp element **)
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}{i:int | i == 0 || i == ~1}
    RubyRtc'(rtc'(attrs,nodes) :*: xs,cnst,i + 1) 
      of (ElmChild(ruby_,rtc'(attrs,nodes),cnst), RubyChildren(xs,cnst,i))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}{i:int | i == 0 || i == ~1 }
    RubyRt'(rt'(attrs,nodes) :*: xs,cnst,i + 1) 
      of (ElmChild(ruby_,rt'(attrs,nodes),cnst), RubyChildren(xs,cnst,i))
  | {attrs:html5_attr_list}{nodes,xs:html5_elm_list}{i:int | i == 0 || i == 1}
    RubyRp'(rp'(attrs,nodes) :*: xs,cnst,i - 1) 
      of (ElmChild(ruby_,rp'(attrs,nodes),cnst), RubyChildren(xs,cnst,i))

and MediaChildren(par:html5_tag,es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | MediaNil(par,enil,cnst,0)
  | {elm:html5_elm}{es:html5_elm_list} 
    MediaElm(par,elm :*: es,cnst,0)
      (** This is messier than I would like, but not sure how to exclude source tags here;
          Still, Media elms cannot contain other media elms, so this is probably not an issue **)
      of (ElmChild(par,elm,lam(tag) => cnst(tag) && tag != source_ && tag != track_), MediaChildren(par,es,cnst,0))
  | {attrs:html5_attr_list}{es:html5_elm_list}{i:int | i == 0 || i == 1}
    MediaTrack'(par,track'(attrs) :*: es, cnst, 1 )
      of (ElmChild(par,track'(attrs),cnst), MediaChildren(par,es,cnst,i))
  | {attrs:html5_attr_list}{es:html5_elm_list}{i:int | i == 0 || i == 1 || i == 2}
    MediaSource'(par,source'(attrs) :*: es, cnst, 2 )
      of (ElmChild(par,source'(attrs),cnst), MediaChildren(par,es,cnst,i))
      
and PictureChildren(es:html5_elm_list,cnst : html5_tag -> bool,int) =
  | PictureNil(enil,cnst,0)
  | {attrs:html5_attr_list}{es:html5_elm_list} 
    PictureImg'(img'(attrs) :*: es,cnst,1)
      of (ElmChild(picture_,img'(attrs),cnst), PictureChildren(es,cnst,0))
  | {attrs:html5_attr_list}{es:html5_elm_list}{i:int | i == 2 || i == 1}
    PictureSource'(source'(attrs) :*: es, cnst, 2   )
      of (ElmChild(picture_,source'(attrs),cnst), PictureChildren(es,cnst,i))

and FieldsetChildren(es:html5_elm_list,cnst : html5_tag -> bool,bool) =
  | FieldsetNil(enil,cnst,false)
  | {attrs:html5_attr_list}{nodes,es:html5_elm_list} 
    FieldsetLegend'(legend'(attrs,nodes) :*: es,cnst,true)
      of (ElmChild(fieldset_,legend'(attrs,nodes),cnst), FieldsetChildren(es,cnst,false))
  | {elm:html5_elm}{es:html5_elm_list} 
    FieldsetFlow'(elm :*: es,cnst,false)
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
      of (ElmAttrs(article_,attrs), ElmChildren(article_,nodes,
         lam(tag) => (cnst(tag) && tag != main_) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(section_)}
    Section'(par,section'(attrs,nodes),cnst) 
      of (ElmAttrs(section_,attrs), ElmChildren(section_,nodes,
        lam(tag) => cnst(tag) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(nav_)}
    Nav'(par,nav'(attrs,nodes),cnst) 
      of (ElmAttrs(nav_,attrs), ElmChildren(nav_,nodes,
        lam(tag) => (cnst(tag) && tag != main_) || tag == header_ || tag == footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(aside_)}
    Aside'(par,aside'(attrs,nodes),cnst) 
      of (ElmAttrs(aside_,attrs), ElmChildren(aside_,nodes,
        lam(tag) => (cnst(tag) && tag != main_) || tag == header_ || tag == footer_))
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
      of (ElmAttrs(header_,attrs), ElmChildren(header_,nodes,
        lam(tag) => cnst(tag) && tag != main_ && tag != header_ && tag != footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(footer_)}
    Footer'(par,footer'(attrs,nodes),cnst) 
      of (ElmAttrs(footer_,attrs), ElmChildren(footer_,nodes,
        lam(tag) => cnst(tag) && tag != main_ && tag != header_ && tag != footer_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(p_)}
    P'(par,p'(attrs,nodes),cnst) 
      of (ElmAttrs(p_,attrs), ElmChildren(p_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(address_)}
    Address'(par,address'(attrs,nodes),cnst) 
      of (ElmAttrs(address_,attrs), ElmChildren(address_,nodes,
          lam(tag) => cnst(tag) && ~is_sectioning(tag) && ~is_heading(tag) && tag != header_ && tag != footer_ && tag != address_))
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
      of (ElmAttrs(ol_,attrs), ElmChildren(ol_,nodes,lam(tag) => cnst(tag) || tag == li_))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ul_)}
    Ul'(par,ul'(attrs,nodes),cnst) 
      of (ElmAttrs(ul_,attrs), ElmChildren(ul_,nodes,lam(tag) => cnst(tag) || tag == li_))
  | {par:html5_tag | par == ul_ || par == ol_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(li_)}
    Li'(par,li'(attrs,nodes),cnst) 
      of (ElmAttrs(li_,attrs), ElmChildren(li_,nodes,cnst))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dl_)}
    Dl'(par,dl'(attrs,nodes),cnst) 
      of (ElmAttrs(dl_,attrs), DlChildren(dl_,nodes,cnst,false))
  (*
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(dl_)}
    Dl'(par,dl'(attrs,nodes),cnst) 
      of (ElmAttrs(dl_,attrs), ElmChildren(dl_,nodes,cnst))
  *)
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Dt'(par,dt'(attrs,nodes),cnst) 
      of (ElmAttrs(dt_,attrs), ElmChildren(dt_,nodes,
        lam(tag) => cnst(tag) && ~is_sectioning(tag)))
  | {par: html5_tag | par == dl_ || par == div_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Dd'(par,dd'(attrs,nodes),cnst) 
      of (ElmAttrs(dd_,attrs), ElmChildren(dd_,nodes,cnst))

  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(figure_)}
    Figure'(par,figure'(attrs,nodes),cnst) 
      of (ElmAttrs(figure_,attrs), ElmChildren(figure_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(figcaption_)}
    Figcaption'(figure_,figcaption'(attrs,nodes),cnst) 
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
      of (ElmAttrs(a_,attrs), ElmChildren(par,nodes,
        lam(tag) => cnst(tag) && ~is_interactive(tag))) // transparent
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
      of (ElmAttrs(dfn_,attrs), ElmChildren(dfn_,nodes,
        lam(tag) => cnst(tag) && tag != dfn_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(abbr_)}
    Abbr'(par,abbr'(attrs,nodes),cnst) 
      of (ElmAttrs(abbr_,attrs), ElmChildren(abbr_,nodes,cnst))
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ruby_)}
    Ruby'(par,ruby'(attrs,nodes),cnst) 
      of (ElmAttrs(ruby_,attrs), ElmChildren(ruby_,nodes,cnst))
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(ruby_)}
    Ruby'(par,ruby'(attrs,nodes),cnst) 
      of (ElmAttrs(ruby_,attrs), RubyChildren(nodes,cnst,0))

  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rb'(ruby_,rb'(attrs,nodes),cnst) 
      of (ElmAttrs(rb_,attrs), ElmChildren(rb_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rt'(ruby_,rt'(attrs,nodes),cnst) 
      of (ElmAttrs(rt_,attrs), ElmChildren(rt_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rtc'(ruby_,rtc'(attrs,nodes),cnst) 
      of (ElmAttrs(rtc_,attrs), ElmChildren(rtc_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Rp'(ruby_,rp'(attrs,nodes),cnst) 
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
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(picture_)}
    Picture'(par,picture'(attrs,nodes),cnst) 
      of (ElmAttrs(picture_,attrs), ElmChildren(picture_,nodes,cnst))
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(picture_)}{i:int | i == 1 || i == 2}
    Picture'(par,picture'(attrs,nodes),cnst) 
      of (ElmAttrs(picture_,attrs), PictureChildren(nodes,cnst,i))

  | {par: html5_tag | par == picture_ || par == audio_ || par == video_}
    {attrs:html5_attr_list} 
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
    Param'(object_,param'(attrs),cnst)  of ElmAttrs(param_,attrs)
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(video_)}
    Video'(par,video'(attrs,nodes),cnst) 
      of (ElmAttrs(video_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(video_)}{i:int}
    Video'(par,video'(attrs,nodes),cnst) 
      of (ElmAttrs(video_,attrs), MediaChildren(par,nodes,cnst,i)) // transparent
  (*
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(audio_)}
    Audio'(par,audio'(attrs,nodes),cnst) 
      of (ElmAttrs(audio_,attrs), ElmChildren(par,nodes,cnst)) // transparent
  *)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(audio_)}{i:int}
    Audio'(par,audio'(attrs,nodes),cnst) 
      of (ElmAttrs(audio_,attrs), MediaChildren(par,nodes,cnst,i)) // transparent
  | {par: html5_tag | par == audio_ || par == video_}
    {attrs:html5_attr_list} 
    {cnst(track_)}
    Track'(par,track'(attrs),cnst)  of ElmAttrs(track_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(map_)}
    Map'(par,map'(attrs,nodes),cnst) 
      of (ElmAttrs(map_,attrs), ElmChildren(par,nodes,
        lam(tag) => cnst(tag) || tag == area_)) // transparent
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
  (*
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(table_)}
    Table'(par,table'(attrs,nodes),cnst) 
      of (ElmAttrs(table_,attrs), ElmChildren(table_,nodes,cnst))
  *)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(table_)}{x:int | x != 2}
    Table'(par,table'(attrs,nodes),cnst) 
      of (ElmAttrs(table_,attrs), TableChildren(nodes,cnst,x))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(caption_)}
    Caption'(par,caption'(attrs,nodes),cnst) 
      of (ElmAttrs(caption_,attrs), ElmChildren(caption_,nodes,
        lam(tag) => cnst(tag) && tag != table_))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Colgroup'(par,colgroup'(attrs,nodes),cnst) 
      of (ElmAttrs(colgroup_,attrs), ElmChildren(colgroup_,nodes,cnst))
  | {attrs:html5_attr_list} 
    Col'(par,col'(attrs),cnst)  of ElmAttrs(col_,attrs)
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Tbody'(table_,tbody'(attrs,nodes),cnst) 
      of (ElmAttrs(tbody_,attrs), ElmChildren(tbody_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Thead'(table_,thead'(attrs,nodes),cnst) 
      of (ElmAttrs(thead_,attrs), ElmChildren(thead_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Tfoot'(table_,tfoot'(attrs,nodes),cnst) 
      of (ElmAttrs(tfoot_,attrs), ElmChildren(tfoot_,nodes,cnst))
  | {par:html5_tag | par == table_ || par == tbody_ || par == thead_ || par == tfoot_}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    Tr'(par,tr'(attrs,nodes),cnst) 
      of (ElmAttrs(tr_,attrs), ElmChildren(tr_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Td'(tr_,td'(attrs,nodes),cnst) 
      of (ElmAttrs(td_,attrs), ElmChildren(td_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    Th'(tr_,th'(attrs,nodes),cnst) 
      of (ElmAttrs(th_,attrs), ElmChildren(th_,nodes,
        lam(tag) => cnst(tag) && ~is_sectioning(tag)))
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(form_)}
    Form'(par,form'(attrs,nodes),cnst) 
      of (ElmAttrs(form_,attrs), ElmChildren(form_,nodes,
        lam(tag) => cnst(tag) && tag != form_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(label_)}
    Label'(par,label'(attrs,nodes),cnst) 
      of (ElmAttrs(label_,attrs), ElmChildren(label_,nodes,
        lam(tag) => cnst(tag) && tag != label_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list} 
    {cnst(input_)}
    Input'(par,input'(attrs),cnst)  of ElmAttrs(input_,attrs)
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(button_)}
    Button'(par,button'(attrs,nodes),cnst) 
      of (ElmAttrs(button_,attrs), ElmChildren(button_,nodes,
        lam(tag) => cnst(tag) && ~is_interactive(tag)))
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
      of (ElmAttrs(progress_,attrs), ElmChildren(progress_,nodes,
        lam(tag) => cnst(tag) && tag != progress_))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(meter_)}
    Meter'(par,meter'(attrs,nodes),cnst) 
      of (ElmAttrs(meter_,attrs), ElmChildren(meter_,nodes,
        lam(tag) => cnst(tag) && tag != meter_))
    (*
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(fieldset_)}
    Fieldset'(par,fieldset'(attrs,nodes),cnst) 
      of (ElmAttrs(fieldset_,attrs), ElmChildren(fieldset_,nodes,cnst))
    *)
  | {par: html5_tag | html5_content_flow(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(fieldset_)}{b:bool}
    Fieldset'(par,fieldset'(attrs,nodes),cnst) 
      of (ElmAttrs(fieldset_,attrs), FieldsetChildren(nodes,cnst,b))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(legend_)}
    Legend'(fieldset_,legend'(attrs,nodes),cnst) 
      of (ElmAttrs(legend_,attrs), ElmChildren(legend_,nodes,cnst))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(details_)}
    Details'(par,details'(attrs,nodes),cnst) 
      of (ElmAttrs(details_,attrs), ElmChildren(details_,nodes,cnst))
  | {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(summary_)}
    Summary'(details_,summary'(attrs,nodes),cnst) 
      of (ElmAttrs(summary_,attrs), ElmChildren(summary_,nodes,cnst))
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(script_)}
    Script'(par,script'(attrs,id),cnst) 
      of (ElmAttrs(script_,attrs))
  | {par:html5_tag}
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(noscript_)}
    Noscript'(par,noscript'(attrs,nodes),cnst) 
      of (ElmAttrs(noscript_,attrs), ElmChildren(par,nodes,
        lam(x) => cnst(x) && x != noscript_)) // transparent
  | {id:int}{attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(template_)}
    Template'(par,template'(attrs,id),
      lam(tag) => cnst(tag) || tag == area_) 
      of (ElmAttrs(template_,attrs))
  | {par: html5_tag | html5_content_phrasing(par) }
    {attrs:html5_attr_list}{nodes:html5_elm_list}
    {cnst(canvas_)}
    Canvas'(par,canvas'(attrs,nodes),cnst) 
      of (ElmAttrs(canvas_,attrs), ElmChildren(par,nodes,cnst)) // transparent

  (** Combinators **)
 
  | {id:int}{e0,e1:html5_elm_list}
    ManyOr'(par,MANY_OR'(e0,e1,id),cnst)
      of (ElmChildren(par,e0,cnst),ElmChildren(par,e1,cnst)) 
  | {id:int}{e0,e1:html5_elm_list}
    Either'(par,EITHER'(e0,e1,id),cnst)
      of (ElmChildren(par,e0,cnst),ElmChildren(par,e1,cnst)) 
  | {id:int}{e0:html5_elm_list}
    Opt'(par,OPT'(e0,id),cnst)
      of (ElmChildren(par,e0,cnst)) 
  | {a:vt@ype+}{id:int}{e0:html5_elm_list}
    With'(par,WITH'(a,e0,id),cnst)
      of (ElmChildren(par,e0,cnst)) 
 
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
    , ElmChildren(body_,bes,lam(tag) => is_flow(tag) && tag != area_)
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
    , ElmChildren(body_,bes,lam(tag) => is_flow(tag) && tag != area_)
    )   

(** Be warned: we rely on the ability of ATS2 to infer `es` **) 
fun {env:vt@ype+}{es: html5_elm_list }
  html5_elm_list_out_verified( pf: Document(es) | env: &env ) : void

