#set page(numbering: "1 / 1")

#align(center, heading(depth: 1)[Sinonim, Antonim dan Penterjemahan Kosa Kata Bahasa Melayu])

#align(center, underline[_Sila semak ketepatan setiap entri apabila menggunakan bahan ini._])

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr),
  align: (right, auto, auto, auto, auto),
  [No.], [Kosa Kata], [Sinonim], [Antonim], [Penterjemahan],
  ..csv("malay_synonym_antonym_chinese.csv").enumerate().flatten().map(x => {
    str(x)
  })
)

