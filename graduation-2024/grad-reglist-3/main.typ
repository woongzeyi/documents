#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#set text(font: "Noto Serif CJK SC")

#align(center)[
  #image("fylogo2.png", width: 40%)
  #text(size: 18pt)[*签到表*]
]

*活动名称*：高中部第十八届毕业典礼第三次筹委会议

*日　　期*：2024年7月31日（星期三）

*时　　间*：10:50pm - 12:10pm (第5 - 6节)

*地　　点*：新山南洋大学校友会议室厅

*负责同学*：陈建乐、黄则义

#let namelist = csv("monitors_namelist.csv")
#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center,
  [*序*],
  [*班级*],
  [*桌号*],
  [*学号*],
  [*名字*],
  [*签名*],
  ..namelist.zip(([],) * namelist.len()).flatten()
)

*公　　假*：#underline[#namelist.len()份]