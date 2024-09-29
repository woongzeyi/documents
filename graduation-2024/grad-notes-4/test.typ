#import "common.typ": *

#let tabulate1(doc) = {

  let n = counter("number")
  n.update(1)

  show heading: x => {
    set text(
      size: 11pt,
      weight: "regular",
      style: "normal",
    )
    context table(
      columns: (
        measure([0.0.0]).width + 10pt,
        1fr,
        measure([Ｘ]).width + 10pt,
      ),
      align: (end, start, start),
      counter(heading).display(),
      {
        let c = to-string(x.body).split("|")
        if (c.len() == 1) {
          c.at(0).trim()
        } else if (c.len() == 2) {
          c.at(1).trim()
        } else {
          panic("Pipe separated values are more than 2. ")
        }
      },
      {
        let c = to-string(x.body).split("|")
        if (c.len() == 1) {
          // place(dx: -4.5pt, dy: -5pt, line(length: 20pt, stroke: 2pt+ white))
        } else if (c.len() == 2) {
          c.at(0).trim()
        } else {
          panic("Pipe separated values are more than 2. ")
        }
      },
    )
    n.update(1)
  }

  show enum: x => {
    context table(
      columns: (
        measure([0.0.0]).width + 10pt,
        1fr,
        measure([Ｘ]).width + 10pt,
      ),
      align: (end, start, start),
      [#{
          if counter(heading).get().len() < 1 {
            [0.]
          }
        }#counter(heading).display()#{
          if counter(heading).get().len() < 2 {
            [0.]
          }
        }#numbering("1.", n.get().at(0))],
      {
        if x.children.first().body.has("text") {
          let c = to-string(x.children.first().body).split("|")
          if (c.len() == 1) {
            c.at(0).trim()
          } else if (c.len() == 2) {
            c.at(1).trim()
          } else {
            panic("Pipe separated values are more than 2. ")
          }
        } else {
          let c = x.children.first().body.children.map(to-string).join().split("|")
          if (c.len() == 1) {
            for i in x.children.first().body.children {
              i
            }
          } else if (c.len() == 2) {
            let pipe_yet = false
            for i in x.children.first().body.children {
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
          } else {
            panic("Pipe separated values are more than 2. ")
          }
        }
      },
      {
        if x.children.first().body.has("text") {
          let c = to-string(x.children.first().body).split("|")
          if (c.len() == 1) {
            // place(dx: -4.5pt, dy: -5pt, line(length: 20pt, stroke: 2pt+ white))
          } else if (c.len() == 2) {
            c.at(0).trim()
          } else {
            panic("Pipe separated values are more than 2. ")
          }
        } else {
          let c = x.children.first().body.children.map(to-string).join().split("|")
          if (c.len() == 1) {
            // place(dx: -4.5pt, dy: -5pt, line(length: 20pt, stroke: 2pt+ white))
          } else if (c.len() == 2) {
            c.at(0).trim()
          } else {
            panic("Pipe separated values are more than 2. ")
          }
        }
      },
    )
    n.step()
  }

  set heading(numbering: "1.")

  stack(..doc.children.flatten())
}

#let tabulate2(doc) = {
  let parse-heading(d, c) = {
    let c_s = to-string(c).split("|")
    if c_s.len() > 2 {
      panic("More than 1 pipe exist!")
    }
    (
      {
        counter("alt_heading").step(level: d)
        context counter("alt_heading").display("1.")
      },
      if c_s.len() == 1 {
        c_s.at(0).trim()
      } else {
        c_s.at(1).trim()
      },
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
            } else {
              i
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
    ([\*], c, [])
  }

  let parse-children(c) = {
    ([\*], c, [])
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

  {
    set text(
      size: 11pt,
      weight: "regular",
      style: "normal",
    )
    context table(
      columns: (
        measure([0.0.0]).width + 10pt,
        1fr,
        measure([Ｘ]).width + 10pt,
      ),
      align: (start, start, start),
      ..merge_reporters(parse(doc))
    )
  }

  show heading: none

  show text: none

  show enum: none

  show table: none

  doc
}