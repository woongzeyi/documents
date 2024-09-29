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

  align(center + bottom)[
    #block(line(length: 4em), spacing: 0.25em)
    #block(line(length: 4em), spacing: 0.25em)
  ]
}

= 2024 年下半年期考——电机

#include "cp7.typ"

#pagebreak()

#include "cp8.typ"

#pagebreak()

#include "cp9.typ"
