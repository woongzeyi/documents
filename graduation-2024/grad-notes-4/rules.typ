#import "common.typ": *

#let formatting(doc) = {
  import "@preview/cuti:0.2.1": show-cn-fakebold
  show: show-cn-fakebold
  set text(font: "Noto Serif CJK SC")

  set page(footer: [#datetime.today().display() #h(1fr) #counter(page).display() / #context counter(page).final().at(0)])

  set heading(
    numbering: "1.",
    bookmarked: false,
  )
  // Heading should not have styles, it breaks the reading flow
  show heading: it => text(
    size: 11pt,
    weight: "regular",
    style: "normal",
    it,
  )

  // Modifying the outline to be a list of headings instead
  show outline.entry: it => {
    if it.at("label", default: none) == <modified-entry> {
      it // prevent infinite recursion
    } else {
      [#outline.entry(
          it.level,
          it.element,
          {
            let c = to-string(it.body.children.slice(1).join()).split("|")
            if c.len() == 2 {
              it.body.children.slice(0, 2).join()
              c.at(1).trim()
            } else {
              it.body
            }
          },
          [],
          [],
        ) <modified-entry>]
    }
  }

  set enum(full: true)

  doc
}

#let tabulate(doc) = {
  let parse-heading(d, c) = {
    let c_s = to-string(c).split("|")
    if c_s.len() > 2 {
      panic("More than 1 pipe exist!")
    }
    (
      strong({
        counter("alt_heading").step(level: d)
        context counter("alt_heading").display("1.")
      }),
      strong(if c_s.len() == 1 {
        c_s.at(0).trim()
      } else {
        c_s.at(1).trim()
      }),
      if c_s.len() == 2 {
        c_s.at(0).trim()
      },
    )
  }

  let parse-enum(c) = {
    let c_s = to-string(c).split("|")
    if c_s.len() > 2 {
      panic("More than 1 pipe exist!")
    }
    (
      {
        counter("alt_heading").step(level: 3)
        context counter("alt_heading").display("1.")
      },
      if c_s.len() == 1 {
        c
      } else {
        let pipe_yet = false
        for i in c.children {
          let temp = to-string(i)
          if not pipe_yet and type(temp) == str {
            let temp2 = temp.split("|")
            if temp2.len() == 2 {
              temp2.at(1).trim()
              pipe_yet = true
            }
          } else if pipe_yet {
            i
          }
        }
      },
      if c_s.len() == 2 {
        c_s.at(0).trim()
      },
    )
  }

  let parse-text(c) = {
    ([\*], c, none)
  }

  let parse-children(c) = {
    ([\*], c, none)
  }

  let parse(doc) = {
    for (i, e) in doc.children.enumerate() {
      if e.has("body") and e.has("depth") {
        // Heading
        parse-heading(e.depth, e.body)
      } else if e.has("body") and not e.has("depth") {
        // Numbered list
        parse-enum(e.body)
      } else if e.has("text") {
        // Text element
        parse-text(e.text)
      } else if e.has("children") {
        parse-children(e)
      }
    }
  }

  let merge_reporters(c) = {
    {
      let merge_rs = 0
      for (i, j) in c.rev().enumerate() {
        if not (((i / 3) - int(i / 3)) > 0) {
          // Hacky modulo
          if j == none {
            merge_rs += 1
          } else {
            (table.cell(rowspan: merge_rs + 1, j),)
            merge_rs = 0
          }
        } else {
          (j,)
        }
      }
    }.rev()
  }

  context table(
    columns: (
      measure([0.0.00]).width + 10pt,
      1fr,
      measure([ＸＸＸ]).width + 10pt,
    ),
    align: (start, start, start),
    [*项目*], [*会议报告/议决事项*], [*备注*],
    ..merge_reporters(parse(doc))
  )

  show heading: none

  show list: none

  show text: none

  show enum: none

  show table: none

  show parbreak: none

  doc
}
