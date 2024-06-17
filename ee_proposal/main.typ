#outline(indent: auto)

#align(bottom+end)[
  #grid(rows: 3, columns: 2, gutter: 6pt, align: top+start,
    [#smallcaps[*Project*]], [Sky Full of Stars],
    [#smallcaps[*Authors*]], [Woong Ze Yi (33) #linebreak() Wong Kuok Jun (30)],
    [#smallcaps[*Revision*]], [1#super[st] on #datetime.today().display()]
  )
]

#pagebreak()
#set page(numbering: "1")
#set heading(numbering: "1.1")

= TL;DR

Here's an approximate list of components needed for this project: 

- Fiber Optics Light Engine

- Fiber

- Refractive Acrylic Balls 

- Step Motors

- Micro-controller

- A _plane/board_ with suitable holes drilled for fibers to fit in

- Other structural components, e.g. tough strings for suspension support

Here's a rough graph demonstrating the expected result of this project: 

#figure(
  image("demonstration.png"),
  caption: [Graph demonstrating the expected result]
)<expected_result>

Here's a loose list of steps to be followed through for the project: 

+ Figure out the way for the visual display (i.e. light emission and transmission through fiber, the perceivability of the refracted light, the deployment and placement of the motors) to work 

+ Decide on the arrangement of the fiber

+ Plan the structure of the final product 

+ Create a prototype for testing purposes

+ Develop a program to control the lights (both intensity and color) and the display shape

  Trail and error if needed. 

+ Finalizing the product 

+ Deployment test

+ Deploy! 

+ Iterate and improve afterwards

Do note that we don't have a schedule planned for this project. We take sufficient time to progress our project as long as we won't be late for the deadline. 

#pagebreak()

= Preface

Right in front of the main hall in Genting Shopping Mall lies Sky Symphony, a dazzling matrix of moving lights that is able to render three-dimensional visual effects. It’s probably the most astounding feature of the mall, and is definitely the most prominent gimmick in the entirety of the Genting experience.

#figure(
  image("skysymphony.png"),
  caption: [Sky Symphony] 
)

Sky Symphony is able to choreograph its light changes and movements with the music playing in the background. It is a remarkable feat if completely thought through: incorporating motor triggers with the music tempo is notorious for being especially hard to achieve, and doing precise motor movements to form abstract shapes mid-air is prone to errors.  

Our beloved head of EE stream, Ms. Lee, getting her inspiration as she came across the magnificence of its effects, discussed the possibility of recreating such a visual for our upcoming EE exhibition in a lecture before the finals of last year. She mentioned she wanted to experiment with cheaper materials with alumni, but we have never heard of it since. 

In the meantime, my teammate was thrilled with the idea of recreating an existing  large-scale project. Not only did he mention it once, twice, but thrice: the first time, he came right in front of me and literally snatched a correction tape from my desk just to demonstrate his concept for the motor workings of the light movement; the second time, he was thinking about applying the LED wristband theory (just to briefly explain the way an LED wristband works: every wristband can be independently controlled by infrared lights) into the project; the third time, he discussed, out of nowhere, the overall idea of the project with a hand drawn graph. 

I had been expecting him to invite me for a group up, and long have I waited. He came up to me at the last minute right before the end of the grouping period. Maybe I shouldn’t have kept quiet and assumed his interest the whole time, but fortunately, at least he did come up to me. If for whatever reason, I thought, we ended up not grouping together, I would carry on with this project all by myself. But just the possibility of us not being a group of our own just set me into my own remorse. 

Moving on. We then let our willingness of taking over the project be known to the EE teachers, and Ms. Lee had some mixed feelings for it. She was surprised by us not fighting for the series (it’s a set of inventive competitions that are all participated competitively with a single invention), and was more surprised knowing that we are aiming for such a strenuous project with a two-man group. 

Standard EE exhibition groups are trios. If needed, triads. Never were there duos. We have thought through if being a trio is a better option, apart from a duck-sounding bastard trying to force himself to join our team just to do nothing, there was no one interested, and will be interested, in such a massive project. We settled ourselves as a duo, and stood firmly. 

Ms. Lee herself had several ideas in pouch for this project, and she emphasized on the optic fiber that she had several dozens of in store. It should be easier and could give out better results overall if we will use it, she said. Will it be an ‘easier said than done’? We’ll find out. 

= Introduction

Visually and interactively impressive projects has always been the heart of every EE exhibition. Without such projects, the exhibition will be dull and dry. 

Visual projects commonly consist of a large number of LEDs in order to catch the attention of the incoming viewers. In hopes of retaining the viewers, micro-controller is deployed to create variation in the visuals. Physical motions can also be created through the means of motors to reinforce the effects. 

Recent projects proposed by other EE comrades has an inclination towards being interactive, and some being competitive in order to compete with other schools in national competitions. This leaves the exhibition in a state without visual projects. As interactive projects will only be of interest to other visitors only if something catches their eye and retaining them, a visual-project-less exhibition is doomed to fail. 

In this work we propose a new project more potentially ambitious than the 16#super[3] LED matrix cube. This project aims to:

- Create a primary visual effect to attract viewers even from faraway distances to participate in the whole EE exhibition experience. 

- Display the ability of EE students. 

- Celebrate the 35-year anniversary of the EE stream. 

- Be marked as the milestone of the development of the ever-growing, ever-improving EE stream. 

// This definitely looks like a sentence written by an EE fanatic, LOL!

= Background

Visual effects can greatly increase the interest of the viewers, and is the key factor to creating a substantial participation experience in our exhibition. 

Extensive efforts have been pursued in order to achieve such results: 

- EE Exhibition 2022 opted for a funfair-like experience in hopes of gaining more attraction from the visitors. They even hosted a stamp card event to convince visitors to exchange participation for prizes.  

- "The Black House" area in the exhibition during the year 2022 operates like an art gallery and houses Zodiac boards that are illuminated using LEDs. 

- 16#super[3] Matrix LED Cube was created last year (i.e. 2023) and was used as the opening symbol in the opening ceremony of the 2023 exhibition. It was placed in the center spot and was showcased as the biggest work in that exhibition.

There are many more efforts that were put into past exhibitions to pull in visitors but were not elaborated here as the above examples is enough to provide the context and to keep the content from being too abundant. 

// And, frankly, the writer himself didn't know any more examples. 

= Parts

It should be noted that the structure proposed below has a heavy emphasis on the light, color and shape of the visual. 

== Light source

The light source is responsible for emitting light into the fiber. 

In order for the viewing experience to be pleasurable, the light source must be able to produce light of various colors. The more individually-controllable pixel _color/light intensity_ there is, the better the visual effect will be. 

As the project is primarily displayed in outdoor environment, the emitted light intensity must be high enough to be visible by the viewers. 

Do note that the light source must be taken care such that the emitted light directly transmit into the fiber. 

There were two ideas in mind for implementing this part: 

+ Using regular LEDs together with lenses, focusing enough light into the fiber.  

  This idea relies on the fact that resin is a transparent material that refracts light, that we are familiar with and can be easily utilized. 

  The advantages of such idea includes:

  - Cheap to make

    // LED: it's easy to come by in our stream. It's basically free! 
    // Resin: We have dealt with resins in the past and we can get our hands on one without much effort. 

  The downsides of such idea are:

  - Assembly is time-consuming

  - The lenses requires extensive efforts to make

  - Success is not guaranteed 

+ Using a premade fiber laser machine as light source

  We found a fiber laser machine in the storage that is able to project lasers used for display purposes. 

  #figure(
    stack(dir: ltr, image("light_engine_box.png", width: 40%), image("fiber_optics_light_engine.png", width: 40%)),
    caption: [Fiber laser machine found in storage]
  )

  Rigorous stress-testing is required for its usage and potential to be fully realized.

  The advantages of using this machine are:

  - Instant deployment 

  - Easy to use

  The downsides are:

  - Consumes a lot of money 

// Of course we have a third idea: making a laser machine of our own! Advantages? None. Disadvantages? Contains all of the above, plus IT IS DANGEROUS! 

We decided that the second idea is relatively better if the project is to be done in the time span of two months. 

== Fiber & Display 

Fiber is responsible for transmitting light.  

Although fiber may be acted as the light display (i.e. as the method of creating light effects), the resulting effect might not be visible enough to be perceived by the viewers in such lit environment [majority of the light is refracted out at the end of the fiber instead of at the side of the fiber]. Hence alternative light display methods must be considered. 

We initially thought of using the resins mentioned in the earlier subsection to produce a display that can do total internal reflection (thus spreading the light) and refract the light outwards. But this method can easily be replaced by a component we accidentally found out during the search for a suitable light source in the store room:

#figure(
  image("display_ball.jpg", width: 40%),
  caption: [A disco-ball-shaped display ball]
)

Through this we will be able to achieve the visual effect we exactly intended to reach with our initial idea. Although utilizing this component certainly uses some amount of money, it cuts our assembly time significantly. 

Hence this component will be used as our light display. 

== Structure & Control

The way that the fibers are laid out, the colors of the display change, and the (step) motors are deployed and controlled for variating the visible height of the display greatly affect how astonishing the viewing experience will be. 

If the fibers are laid out with too much distance away from each other, the visual effects will not be well-expressed. Conversely too dense and the effects will not be well-perceived. 

The arrangement of the fibers is planned to be figured out through trial and error. 

The control is where the effect happens. Through variating the colors of the display, the pattern of the visual is change. Likewise, variating the height of each individual fibers (i.e. the display) changes the shape of the visual. 

A micro-controller is where the variation happens. We are familiar with two kinds of micro-controller board: The Arduino Uno R3, and the Raspberry Pi Pico. Although any kind of micro-controller can achieve essentially the same result (it's basically what micro-controllers are made for), board kind may be chosen by personal preference.  

In our case, we have familiarized Pico and used it in many projects. We decided to continue upon using Pico for its versatility and bleeding-edge development. 

#figure(
  image("four_picos.jpg", width: 70%),
  caption: [The Raspberry Pi Pico Family]
)

The micro-controller itself can be further controlled by various methods such as Bluetooth® Technology, infrared signal, etc. 

For the (step) motor part, as the fibers and displays are light enough to essentially be lifted by any kind of motors, the motors will be chosen based on which is the most available to us. To move the fibers, the fibers will be placed in between two wheels. These wheels will be rotated in opposite direction to each other by the micro-controller-controlled motor. 

= Results

Assembling every part together, we should be able to see the result similar to this rough sketch. 

#figure(
  image("demonstration.png"),
  caption: [Graph demonstrating the expected result (Repeated figure of @expected_result)]
)

It will variate its own color and shape based on time, and create stunning visual effects that are able to attract visitors. We will be able to control its variation by using remote _signals/apps_. 

= Conclusion

In this work we presented _Sky Full of Stars_, a visual project proposed to not only attract visitors into participating the whole exhibition suite, but to also be a milestone to the 35th anniversary of the EE stream. 

We divided our project into three parts: light source, fiber and display, and structure and control. Each of the part are thought through in detail, finding out what components are needed to finish the part. 

We look forward to this project being approved, and we are excited for what insight and experience this project has in line for us. 

#[
  #show heading: it => text(
    size: 11pt,
    weight: "bold",
    style: "normal",
    it.body + "  ",
  ) 
  
  #heading[Acknowledgements]
]
We are grateful to Ms. Lee Poh Peng and Mr. Chua Jiunn He for their fruitful inspirations and supportive help.  

= Reflections

#grid(columns: 2, rows: 2, gutter: 8pt, 
  align(end)[*Wong Kuok Jun: *], 
  [Since the start of this project, we have brainstormed numerous methods to address the challenges we encountered during the proposal discussion. Ultimately, this is just a proposal, and we may uncover additional issues as we progress. We hope this proposal provides our teacher with sufficient information about our project. We look forward to achieving excellent results.],
  align(end)[*Woong Ze Yi: *], 
  [I love how an exhibition project like this provides us with so many insights! Proposing something this ambitious is inherently challenging, but I enjoy how it requires us to delve deeply beneath the surface. Overall, I thoroughly enjoy everything this project has to offer!]
)