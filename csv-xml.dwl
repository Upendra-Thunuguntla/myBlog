%dw 2.0
var dirs = ["direction-l", "direction-r"]
fun makeLink(site,id) = 
    if (isEmpty(site))
    "location.href ='" ++ ("#" ++ id) ++ "';"
    else
    "location.href ='" ++ site ++ "';"

output application/xml  writeDeclaration=false
---

  ul @(class: "timeline"): 
    li: payload map (if ($.isTitle == "TRUE")
      {
        div @(class: "time-header", id: $.Id, onclick: makeLink($.link,$.Id)): {
          div @(class: "time-head"): $.Title
        }
      }
    else if (mod($$, 2) == 0)
      {
        div @(class: dirs[mod($$, 2)], id: $.Id, onclick: makeLink($.link,$.Id)): {
          div @(class: "flag-wrapper"): {
            span @(class: "flag"): $.Title,
            span @(class: "time-wrapper"): {
              span @(class: "time"): $.Time
            }
          },
          div @(class: "desc"): $.Desc replace "\n" with "***"
        }
      }
    else
      {
        div @(class: dirs[mod($$, 2)], id: $.Id, onclick: makeLink($.link,$.Id)): {
          div @(class: "flag-wrapper"): {
            span @(class: "flag"): $.Title,
            span @(class: "time-wrapper"): {
              span @(class: "time"): $.Time
            }
          },
          div @(class: "desc"): $.Desc replace "\n" with "***"
        }
      })

