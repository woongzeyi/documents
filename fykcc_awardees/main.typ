#let leaderboard(file) = {
  align(center, table(
    columns: 5, 
    align: (center + horizon, center + horizon, center, center, start + horizon),
    [], [], [], [], [分数],
    ..for i in csv(file) {
      (
        table.cell(rowspan: 3, for j in i.at(0) {j + "\n"}),
        table.cell(rowspan: 3, i.at(1)),
        i.slice(2, 4),
        table.cell(rowspan: 3, i.at(-1)),
        i.slice(4, -1)
      )
    }.flatten()
  ))
}

#let individual_board1(file) = {
  align(center, table(
    columns: 5, 
    align: (center + horizon, center + horizon, center, center, start),
    [], [], [], [], [分数], 
    ..csv(file).flatten()
  ))
}

#let individual_board2(file) = {
  align(center, table(
    columns: 5, 
    align: (center + horizon, center + horizon, center, center, start + horizon),
    [], [], [], [], [分数], 
    ..for i in csv(file) {
      (
        table.cell(rowspan: 3, for j in i.at(0) {j + "\n"}),
        table.cell(rowspan: 3, i.at(1)),
        i.slice(2, 4),
        table.cell(rowspan: 3, i.at(-1)),
        i.slice(4, -1)
      )
    }.flatten()
  ))
}


#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#set text(font: "Noto Serif CJK SC")

#set heading(numbering: "1.1.a.")

#set document(
  author: "Woong Ze Yi", 
  title: "FYKCC - Awardees", 
  date: datetime.today()
)
#set page(
  header: align(end)[2024年校内电脑挑战赛 - 比赛结果],
  footer: [#datetime.today().display() #h(1fr) #counter(page).display() / #context counter(page).final().at(0)]
)

#align(center, text(size: 18pt, weight: "bold")[2024年校内电脑挑战赛 - 比赛结果])

= 总排行

本赛总分为100分；第一轮及第二轮挑战皆占总分50分。本赛设有五份奖项：冠、亚、季军及优秀奖两份。

#columns(2)[
  === 初阶组
  #leaderboard("beginners_overall.csv")
  #colbreak()
  === 高阶组
  #leaderboard("intermediates_overall.csv")
]

= 个别排行

== 第一轮：电脑常识与计算思维

本轮总分为120分。以下排名由各参赛者之本轮得分顺序排列，取前十者获得。

#columns(2)[
  === 初阶组

  #individual_board1("beginners_round1.csv")
  
  #colbreak()
  
  === 高阶组

  #individual_board1("intermediates_round1.csv")
]

#pagebreak()

== 第二轮：竞技编程

本轮总分为50分。以下排名由各参赛班级之本轮得分顺序排列，取有分数者获得。

#columns(2)[
  === 初阶组

  #individual_board2("beginners_round2.csv")
  
  #colbreak()
  
  === 高阶组

  #individual_board2("intermediates_round2.csv")
]