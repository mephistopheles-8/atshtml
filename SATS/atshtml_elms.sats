#include "./../HATS/project.hats"
#include "./../HATS/atshtml_infix.hats"
staload "./atshtml.sats"

stadef doctype' : html5_elm 
   = html5_elm_doctype()
stadef text'(id) : html5_elm 
   = html5_elm_text(id)
stadef comment'(id) : html5_elm 
   = html5_elm_comment(id)
stadef html'(attrs,nodes) : html5_elm 
   = html5_elm_normal(html_,attrs,nodes)
stadef head'(attrs,nodes) : html5_elm 
   = html5_elm_normal(head_,attrs,nodes)
stadef title'(id) : html5_elm 
   = html5_elm_normal(title_,anil,html5_elm_text(id) :*: enil)
stadef base'(attrs) : html5_elm 
   = html5_elm_void(base_,attrs)
stadef link'(attrs) : html5_elm 
   = html5_elm_void(link_,attrs)
stadef meta'(attrs) : html5_elm 
   = html5_elm_void(meta_,attrs)
stadef style'(attrs,id) : html5_elm 
   = html5_elm_script(attrs,id)
stadef body'(attrs,nodes) : html5_elm 
   = html5_elm_normal(body_,attrs,nodes)
stadef article'(attrs,nodes) : html5_elm 
   = html5_elm_normal(article_,attrs,nodes)
stadef section'(attrs,nodes) : html5_elm 
   = html5_elm_normal(section_,attrs,nodes)
stadef nav'(attrs,nodes) : html5_elm 
   = html5_elm_normal(nav_,attrs,nodes)
stadef aside'(attrs,nodes) : html5_elm 
   = html5_elm_normal(aside_,attrs,nodes)
stadef h1'(attrs,nodes) : html5_elm 
   = html5_elm_normal(h1_,attrs,nodes)
stadef h2'(attrs,nodes) : html5_elm 
   = html5_elm_normal(h2_,attrs,nodes)
stadef h3'(attrs,nodes) : html5_elm 
   = html5_elm_normal(h3_,attrs,nodes)
stadef h4'(attrs,nodes) : html5_elm 
   = html5_elm_normal(h4_,attrs,nodes)
stadef h5'(attrs,nodes) : html5_elm 
   = html5_elm_normal(h5_,attrs,nodes)
stadef h6'(attrs,nodes) : html5_elm 
   = html5_elm_normal(h6_,attrs,nodes)
stadef header'(attrs,nodes) : html5_elm 
   = html5_elm_normal(header_,attrs,nodes)
stadef footer'(attrs,nodes) : html5_elm 
   = html5_elm_normal(footer_,attrs,nodes)
stadef p'(attrs,nodes) : html5_elm 
   = html5_elm_normal(p_,attrs,nodes)
stadef address'(attrs,nodes) : html5_elm 
   = html5_elm_normal(address_,attrs,nodes)
stadef hr'(attrs) : html5_elm 
   = html5_elm_void(hr_,attrs)
stadef pre'(attrs,nodes) : html5_elm 
   = html5_elm_normal(pre_,attrs,nodes)
stadef blockquote'(attrs,nodes) : html5_elm 
   = html5_elm_normal(blockquote_,attrs,nodes)
stadef ol'(attrs,nodes) : html5_elm 
   = html5_elm_normal(ol_,attrs,nodes)
stadef ul'(attrs,nodes) : html5_elm 
   = html5_elm_normal(ul_,attrs,nodes)
stadef li'(attrs,nodes) : html5_elm 
   = html5_elm_normal(li_,attrs,nodes)
stadef dl'(attrs,nodes) : html5_elm 
   = html5_elm_normal(dl_,attrs,nodes)
stadef dt'(attrs,nodes) : html5_elm 
   = html5_elm_normal(dt_,attrs,nodes)
stadef dd'(attrs,nodes) : html5_elm 
   = html5_elm_normal(dd_,attrs,nodes)
stadef figure'(attrs,nodes) : html5_elm 
   = html5_elm_normal(figure_,attrs,nodes)
stadef figcaption'(attrs,nodes) : html5_elm 
   = html5_elm_normal(figcaption_,attrs,nodes)
stadef main'(attrs,nodes) : html5_elm 
   = html5_elm_normal(main_,attrs,nodes)
stadef div'(attrs,nodes) : html5_elm 
   = html5_elm_normal(div_,attrs,nodes)
stadef a'(attrs,nodes) : html5_elm 
   = html5_elm_normal(a_,attrs,nodes)
stadef em'(attrs,nodes) : html5_elm 
   = html5_elm_normal(em_,attrs,nodes)
stadef strong'(attrs,nodes) : html5_elm 
   = html5_elm_normal(strong_,attrs,nodes)
stadef small'(attrs,nodes) : html5_elm 
   = html5_elm_normal(small_,attrs,nodes)
stadef s'(attrs,nodes) : html5_elm 
   = html5_elm_normal(s_,attrs,nodes)
stadef cite'(attrs,nodes) : html5_elm 
   = html5_elm_normal(cite_,attrs,nodes)
stadef q'(attrs,nodes) : html5_elm 
   = html5_elm_normal(q_,attrs,nodes)
stadef dfn'(attrs,nodes) : html5_elm 
   = html5_elm_normal(dfn_,attrs,nodes)
stadef abbr'(attrs,nodes) : html5_elm 
   = html5_elm_normal(abbr_,attrs,nodes)
stadef ruby'(attrs,nodes) : html5_elm 
   = html5_elm_normal(ruby_,attrs,nodes)
stadef rb'(attrs,nodes) : html5_elm 
   = html5_elm_normal(rb_,attrs,nodes)
stadef rt'(attrs,nodes) : html5_elm 
   = html5_elm_normal(rt_,attrs,nodes)
stadef rtc'(attrs,nodes) : html5_elm 
   = html5_elm_normal(rtc_,attrs,nodes)
stadef rp'(attrs,nodes) : html5_elm 
   = html5_elm_normal(rp_,attrs,nodes)
stadef data'(attrs,nodes) : html5_elm 
   = html5_elm_normal(data_,attrs,nodes)
stadef time'(attrs,nodes) : html5_elm 
   = html5_elm_normal(time_,attrs,nodes)
stadef code'(attrs,nodes) : html5_elm 
   = html5_elm_normal(code_,attrs,nodes)
stadef var'(attrs,nodes) : html5_elm 
   = html5_elm_normal(var_,attrs,nodes)
stadef samp'(attrs,nodes) : html5_elm 
   = html5_elm_normal(samp_,attrs,nodes)
stadef kbd'(attrs,nodes) : html5_elm 
   = html5_elm_normal(kbd_,attrs,nodes)
stadef sub'(attrs,nodes) : html5_elm 
   = html5_elm_normal(sub_,attrs,nodes)
stadef sup'(attrs,nodes) : html5_elm 
   = html5_elm_normal(sup_,attrs,nodes)
stadef i'(attrs,nodes) : html5_elm 
   = html5_elm_normal(i_,attrs,nodes)
stadef b'(attrs,nodes) : html5_elm 
   = html5_elm_normal(b_,attrs,nodes)
stadef u'(attrs,nodes) : html5_elm 
   = html5_elm_normal(u_,attrs,nodes)
stadef mark'(attrs,nodes) : html5_elm 
   = html5_elm_normal(mark_,attrs,nodes)
stadef bdi'(attrs,nodes) : html5_elm 
   = html5_elm_normal(bdi_,attrs,nodes)
stadef bdo'(attrs,nodes) : html5_elm 
   = html5_elm_normal(bdo_,attrs,nodes)
stadef span'(attrs,nodes) : html5_elm 
   = html5_elm_normal(span_,attrs,nodes)
stadef br'(attrs) : html5_elm 
   = html5_elm_void(br_,attrs)
stadef wbr'(attrs) : html5_elm 
   = html5_elm_void(wbr_,attrs)
stadef ins'(attrs,nodes) : html5_elm 
   = html5_elm_normal(ins_,attrs,nodes)
stadef del'(attrs,nodes) : html5_elm 
   = html5_elm_normal(del_,attrs,nodes)
stadef picture'(attrs,nodes) : html5_elm 
   = html5_elm_normal(picture_,attrs,nodes)
stadef source'(attrs) : html5_elm 
   = html5_elm_void(source_,attrs)
stadef img'(attrs) : html5_elm 
   = html5_elm_void(img_,attrs)
stadef iframe'(attrs,nodes) : html5_elm 
   = html5_elm_normal(iframe_,attrs,nodes)
stadef embed'(attrs) : html5_elm 
   = html5_elm_void(embed_,attrs)
stadef object'(attrs,nodes) : html5_elm 
   = html5_elm_normal(object_,attrs,nodes)
stadef param'(attrs) : html5_elm 
   = html5_elm_void(param_,attrs)
stadef video'(attrs,nodes) : html5_elm 
   = html5_elm_normal(video_,attrs,nodes)
stadef audio'(attrs,nodes) : html5_elm 
   = html5_elm_normal(audio_,attrs,nodes)
stadef track'(attrs) : html5_elm 
   = html5_elm_void(track_,attrs)
stadef map'(attrs,nodes) : html5_elm 
   = html5_elm_normal(map_,attrs,nodes)
stadef area'(attrs) : html5_elm 
   = html5_elm_void(area_,attrs)
stadef svg'(attrs,nodes) : html5_elm 
   = html5_elm_normal(svg_,attrs,nodes)
stadef math'(attrs,nodes) : html5_elm 
   = html5_elm_normal(math_,attrs,nodes)
stadef table'(attrs,nodes) : html5_elm 
   = html5_elm_normal(table_,attrs,nodes)
stadef caption'(attrs,nodes) : html5_elm 
   = html5_elm_normal(caption_,attrs,nodes)
stadef colgroup'(attrs,nodes) : html5_elm 
   = html5_elm_normal(colgroup_,attrs,nodes)
stadef col'(attrs) : html5_elm 
   = html5_elm_void(col_,attrs)
stadef tbody'(attrs,nodes) : html5_elm 
   = html5_elm_normal(tbody_,attrs,nodes)
stadef thead'(attrs,nodes) : html5_elm 
   = html5_elm_normal(thead_,attrs,nodes)
stadef tfoot'(attrs,nodes) : html5_elm 
   = html5_elm_normal(tfoot_,attrs,nodes)
stadef tr'(attrs,nodes) : html5_elm 
   = html5_elm_normal(tr_,attrs,nodes)
stadef td'(attrs,nodes) : html5_elm 
   = html5_elm_normal(td_,attrs,nodes)
stadef th'(attrs,nodes) : html5_elm 
   = html5_elm_normal(th_,attrs,nodes)
stadef form'(attrs,nodes) : html5_elm 
   = html5_elm_normal(form_,attrs,nodes)
stadef label'(attrs,nodes) : html5_elm 
   = html5_elm_normal(label_,attrs,nodes)
stadef input'(attrs) : html5_elm 
   = html5_elm_void(input_,attrs)
stadef button'(attrs,nodes) : html5_elm 
   = html5_elm_normal(button_,attrs,nodes)
stadef select'(attrs,nodes) : html5_elm 
   = html5_elm_normal(select_,attrs,nodes)
stadef datalist'(attrs,nodes) : html5_elm 
   = html5_elm_normal(datalist_,attrs,nodes)
stadef optgroup'(attrs,nodes) : html5_elm 
   = html5_elm_normal(optgroup_,attrs,nodes)
stadef option'(attrs,nodes) : html5_elm 
   = html5_elm_normal(option_,attrs,nodes)
stadef textarea'(attrs,nodes) : html5_elm 
   = html5_elm_normal(textarea_,attrs,nodes)
stadef output'(attrs,nodes) : html5_elm 
   = html5_elm_normal(output_,attrs,nodes)
stadef progress'(attrs,nodes) : html5_elm 
   = html5_elm_normal(progress_,attrs,nodes)
stadef meter'(attrs,nodes) : html5_elm 
   = html5_elm_normal(meter_,attrs,nodes)
stadef fieldset'(attrs,nodes) : html5_elm 
   = html5_elm_normal(fieldset_,attrs,nodes)
stadef legend'(attrs,nodes) : html5_elm 
   = html5_elm_normal(legend_,attrs,nodes)
stadef details'(attrs,nodes) : html5_elm 
   = html5_elm_normal(details_,attrs,nodes)
stadef summary'(attrs,nodes) : html5_elm 
   = html5_elm_normal(summary_,attrs,nodes)
stadef script'(attrs,id) : html5_elm 
   = html5_elm_script(attrs,id)
stadef noscript'(attrs,nodes) : html5_elm 
   = html5_elm_normal(noscript_,attrs,nodes)
stadef template'(attrs,nodes) : html5_elm 
   = html5_elm_normal(template_,attrs,nodes)
stadef canvas'(attrs,nodes) : html5_elm 
   = html5_elm_normal(canvas_,attrs,nodes)

(** Combinators **)

stadef EITHER'(xs0,xs1,id) : html5_elm
  = html5_elm_either(xs0,xs1,id)

stadef MANY'(xs0,id) : html5_elm
  = html5_elm_many(xs0,enil,id)

stadef MANY_OR'(xs0,xs1,id) : html5_elm
  = html5_elm_many(xs0,xs1,id)

stadef OPT'(xs0,id) : html5_elm
  = html5_elm_opt(xs0,id)
