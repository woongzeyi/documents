#set text(font: "Noto Serif CJK SC")

#let hash(s) = {
  let addr = 0
  for i in s {
    addr = i.to-unicode() + addr.bit-lshift(6) + addr.bit-rshift(16) - addr
    addr = addr.bit-and(0xFFFFFFFF)
  }
  str(addr, base: 16)
}

#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#show: doc => {
  set page(
    header: [_WOONG ZE YI_ #h(1fr) #context query(heading.where(level: 1)).first().body],
    footer: [#hash({ let l = doc; while type(l) == content { l = to-string(l) }; l }) #h(1fr) #counter(page).display() / #context counter(page).final().at(0)],
  )

  doc

  align(center)[
    #block(line(length: 4em), spacing: 0.25em)
    #block(line(length: 4em), spacing: 0.25em)
  ]
}

#let mcq(title, mcq_file) = {

  heading(depth: 2, title)

  let error = {
    let n = 0
    for i in csv(mcq_file) {
      if i.at(1) != "" {
        n += 1
      }
    }
    n
  }

  let total = csv(mcq_file).len()

  [Mistakes: #error #h(2em) Error rate: #{calc.round(error / total * 100, digits: 2)}%]

  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    ..csv(mcq_file).enumerate(start: 1).map(x => {
      if x.last().last() == "" {
        (str(x.first()) + ". ", x.last().first())
      } else {
        (str(x.first()) + ". ", x.last().first(), x.last().last())
      }
    }).map(x => {
      if x.len() == 2 {
        [#x.at(0)#x.at(1)]
      } else if x.len() == 3 {
        table.cell(fill: red)[#x.at(0)#x.at(1)#h(1em)#highlight[#x.at(2)]]
      } else {
        [Err]
      }
    }).flatten()
  )

}

= Computer Informatics UEC MCQ

#mcq("UEC 2017", "uec_2017.csv")

#mcq("UEC 2018", "uec_2018.csv")

#mcq("UEC 2019", "uec_2019.csv")

#pagebreak()

#mcq("UEC 2020", "uec_2020.csv")

#mcq("UEC 2021", "uec_2021.csv")

#mcq("UEC 2022", "uec_2022.csv")

#pagebreak()

#mcq("UEC 2023", "uec_2023.csv")
