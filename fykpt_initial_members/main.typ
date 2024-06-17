#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#set text(font: "Noto Serif CJK SC")

#let member_data = csv("member_data.csv")

#{
  member_data = member_data.map(x => {
    x.at(4) = x.at(4).split("\n").map(y => [- #y]).join()
    x
  })
  member_data = range(1, member_data.len()+1).map(x => str(x)).zip(member_data)
}

#set document(
  author: "Woong Ze Yi", 
  title: "FYK Programming Team - Initial Members", 
  date: datetime.today()
)
#set page(
  header: align(end)[2024年电脑编程校队 - 继任队员名单],
  footer: [#datetime.today().display() #h(1fr) #counter(page).display() / #context counter(page).final().at(0)]
)

#align(center, text(18pt, weight: "bold")[2024年电脑编程校队 - 继任队员名单])

#table(
  columns: 6, inset: 4pt,
  "序", "名字", "班级", "座号", "学号", "曾获得奖项", ..member_data.flatten()
)