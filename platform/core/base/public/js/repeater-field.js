$((function(){var t,e=(t={"&amp;":"&","&lt;":"<","&gt;":">","&quot;":'"',"&#39;":"'"},function(e){return null==t?void 0:t[e]}),a=/&(?:amp|lt|gt|quot|#39);/g,n=RegExp(a.source);$(document).on("click",'[data-target="repeater-add"]',(function(){var t,o=$(this).data("id"),i=$("#".concat(o,"_group")),d=$("#".concat(o,"_template")),r=$("#".concat(o,"_fields")),c=parseInt(i.data("nextIndex")),l=d.html(),_=r.text();l=l.replace(/__key__/g,c),_=_.replace(/__key__/g,c),l=l.replace(/__fields__/g,(t=(t=_).toString())&&n.test(t)?t.replace(a,e):t),i.append(l),i.data("nextIndex",c+1),window.Botble&&(window.Botble.initResources(),window.Botble.initMediaIntegrate()),window.EditorManagement&&(window.EDITOR=(new EditorManagement).init())})),$(document).on("click",'[data-target="repeater-remove"]',(function(){var t=$(this).data("id");$('[data-id="'.concat(t,'"]')).remove()}))}));