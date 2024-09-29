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

= CAKUPAN UJIAN PENGGAL SEMESTER 2 (2024)

*Tingkatan Menengah Atas 3 Seni Kulinari / Elektrik dan Elektronik*

+ Pantun Enam kerat (buku teks muka surat 130-131)

  *Kefahaman KOMSAS sahaja*

+ Buku Teks Unit 5: Tanggungjawab rakyat Malaysia (muka surat 112-116)

  *Kosa kata membina ayat dan isi tempat kosong sahaja*

+ *Kertas UEC 2020*

  Tatabahasa: Bahagian C (Soalan 1-3) dan bahan luar

+ *TATABAHASA*

  #[
    #set enum(numbering: "a.")
    + Penterjemahan (Buku Teks, muka surat 53, soalan 1-2 dan bahan luar)

    + Kesalahan Umum (Buku Praktis, latihan 11-12 dan bahan luar)

    + Pengimbuhan (Buku Praktis, latihan 5-6 dan bahan luar

    + Menggabungkan Ayat (Buku Praktis, latihan 3-4 dan bahan luar)
  ]
