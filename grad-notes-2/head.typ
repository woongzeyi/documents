#import "@preview/a2c-nums:0.0.1": int-to-cn-num

#let head(doc, n, date, tstart, tend) = [
  #set page(
    header: align(end)[2024年度毕业典礼筹委会议（#int-to-cn-num(n)）]
  )
  
  #align(center)[
    *2024年度毕业典礼筹委会议（#int-to-cn-num(n)）*
    
    #table(
        columns: 2,
        align: (right, left),
        [日　期：], [#date.display("[year]年[month padding:none]月[day]日")（星期#int-to-cn-num(date.weekday())）],
        [时　间：], [#tstart.display("[hour padding:none repr:12]:[minute padding:none][period case:lower]") – #tend.display("[hour padding:none repr:12]:[minute padding:none][period case:lower]")],
        [地　点：], [新山南洋大学校友会议室厅],
        [召集人：], [郑叶枫],
        [记　录：], [黄则义],
    )
  ]
  
  #v(1em)
  
  #block(
    width: 100%,
    stroke: (
      top: 1pt, 
      bottom: 1pt
    ), 
    inset: 1em,
    align(center)[
  
      #strong[#underline[出席者：（恕不称呼）]]
      
      颜壮志、李锦星、郑叶枫、梁佩敏、袁淑珍、陈美丝、邱佩萱、黎琪姗、林建伟、
      
      戴新娇、李胤钦、全体高三正副班长
  
    ]
  )

  #doc
]