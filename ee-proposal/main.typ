#outline(indent: auto)

#align(bottom, grid(
  columns: (1fr, 1fr),
  align: (start, end),
  [
    #smallcaps[*Revision Changelog*]

    1#super[st]: Initial Proposal

    2#super[nd]: Language Improvements
  ],
  grid(rows: 3, columns: 2, gutter: 6pt, align: top+start,
    [#smallcaps[*Project*]], [Sky Full of Stars],
    [#smallcaps[*Authors*]], [Woong Ze Yi (33) #linebreak() Wong Kuok Jun (30)],
    [#smallcaps[*Revision*]], [2#super[nd] on #datetime.today().display()]
  )
))

#pagebreak()
#set page(numbering: "1")
#set heading(numbering: "1.")

= TL;DR

Here's an approximate list of components needed for this project: 

- Fiber Optics Light Engine

- Fiber

- Refractive Acrylic Balls 

- Step Motors

- Microcontroller

- A board with suitable holes drilled for fibers to fit in

- Other structural components, e.g., tough strings for suspension support

Here's a rough graph demonstrating the expected result of this project: 

#figure(
  image("demonstration.png"),
  caption: [Graph demonstrating the expected result]
)<expected_result>

Here's a loose list of steps to be followed for the project: 

+ Figure out the way for the visual display (i.e., light emission and transmission through fiber, the perceivability of the refracted light, the deployment and placement of the motors) to work.

+ Decide on the arrangement of the fiber.

+ Plan the structure of the final product.

+ Create a prototype for testing purposes.

+ Develop a program to control the lights (both intensity and color) and the display shape. Trial and error if needed.

+ Finalize the product.

+ Conduct a deployment test.

+ Deploy!

+ Iterate and improve afterwards.

Please note that we don't have a fixed schedule for this project. We will take sufficient time to progress as long as we meet the deadline.

#pagebreak()

= Preface

Right in front of the main hall in Genting Shopping Mall lies Sky Symphony, a dazzling matrix of moving lights capable of rendering three-dimensional visual effects. It’s probably the most astounding feature of the mall and certainly the most prominent attraction in the entire Genting experience.

#figure(
  image("skysymphony.png"),
  caption: [Sky Symphony] 
)

Sky Symphony choreographs its light changes and movements with the music playing in the background. This is a remarkable feat, as synchronizing motor triggers with music tempo is notoriously difficult, and precise motor movements to form abstract shapes in mid-air are prone to errors.

Our beloved head of the EE stream, Ms. Lee, was inspired by the magnificence of its effects and discussed the possibility of recreating such a visual display for our upcoming EE exhibition during a lecture before last year’s finals. She mentioned wanting to experiment with cheaper materials with alumni, but we haven't heard about it since.

In the meantime, my teammate was thrilled with the idea of recreating an existing large-scale project. He mentioned it not once, but three times: the first time, he demonstrated his concept for the motor workings of the light movement by snatching a correction tape from my desk; the second time, he considered applying the LED wristband theory (each wristband can be independently controlled by infrared lights) to the project; the third time, he discussed the overall idea of the project with a hand-drawn graph.

I had been expecting him to invite me to team up, and he finally did at the last minute before the end of the grouping period. I might have been too passive, but fortunately, he approached me. If we hadn’t teamed up, I would have carried on with this project by myself, although the thought of not being in a group with him caused me some remorse.

We then expressed our interest in taking over the project to the EE teachers. Ms. Lee had mixed feelings about it. She was surprised that we weren’t competing for the series (a set of inventive competitions with a single invention) and even more surprised that we aimed for such a strenuous project with a two-person team.

Standard EE exhibition groups are trios, and if needed, triads. Never duos. We considered if being a trio would be better, but apart from a disinterested person trying to force himself into our team, there was no one interested in such a massive project. We decided to remain a duo.

Ms. Lee had several ideas for this project and emphasized the optic fiber she had in storage. It should be easier and could yield better results overall if we use it, she said. Will it be an ‘easier said than done’? We’ll find out.

= Introduction

Visually and interactively impressive projects have always been the heart of every EE exhibition. Without such projects, the exhibition would be dull and dry.

Visual projects commonly consist of a large number of LEDs to catch the attention of incoming viewers. To retain viewers, a microcontroller is deployed to create variations in the visuals. Physical motions can also be created using motors to enhance the effects.

Recent projects proposed by other EE students have leaned towards being interactive and some even competitive to contend with other schools in national competitions. This leaves the exhibition without visual projects. Interactive projects only interest visitors if something catches their eye and retains them, making a visual-project-less exhibition doomed to fail.

In this work, we propose a new project potentially more ambitious than the 16^3 LED matrix cube. This project aims to:

- Create a primary visual effect to attract viewers from far distances to participate in the entire EE exhibition experience.

- Display the abilities of EE students.

- Celebrate the 35th anniversary of the EE stream.

- Serve as a milestone in the development of the ever-growing, ever-improving EE stream.

// This definitely looks like a sentence written by an EE fanatic, LOL!

= Background

Visual effects greatly increase viewer interest and are key to creating substantial participation in our exhibition.

Extensive efforts have been made to achieve such results:

- EE Exhibition 2022 aimed for a funfair-like experience to attract more visitors, even hosting a stamp card event for prizes.

- "The Black House" area in the 2022 exhibition operated like an art gallery, featuring Zodiac boards illuminated by LEDs.

- The 16#super[3] Matrix LED Cube created last year (2023) served as the opening symbol for the 2023 exhibition, showcased in the center as the biggest work.

Many more efforts have been made in past exhibitions to attract visitors, but the above examples provide sufficient context without overwhelming details.

// And, frankly, the writer himself didn't know any more examples. 

= Parts

The proposed structure emphasizes light, color, and shape of the visual.

== Light source

The light source emits light into the fiber.

For a pleasurable viewing experience, the light source must produce various colors. The more individually controllable pixel colors/light intensities, the better the visual effect.

As the project is primarily displayed outdoors, the emitted light intensity must be high enough to be visible.

The light source must ensure direct transmission of light into the fiber.

Two ideas were considered for implementing this part:

+ Using regular LEDs with lenses to focus light into the fiber.

   Advantages:

     - Cheap to make
	
   Disadvantages:

     - Time-consuming assembly
	
     - Requires extensive effort to make lenses
	
     - Success is not guaranteed

+ Using a premade fiber laser machine as the light source.

   Advantages:

     - Instant deployment
	
     - Easy to use
	
   Disadvantages:

     - Expensive

#figure(
  stack(dir: ltr, image("light_engine_box.png", width: 40%), image("fiber_optics_light_engine.png", width: 40%)),
  caption: [Fiber laser machine found in storage]
)

We decided the second idea was relatively better given the two-month time span.

== Fiber & Display 

Fiber transmits light.

Although fiber can be used as the light display, the resulting effect might not be visible enough in a lit environment (most light is refracted at the end of the fiber rather than the sides). Alternative light display methods must be considered.

We initially thought of using resins for total internal reflection and light refraction, but found a suitable component during our search for a light source:

#figure(
  image("display_ball.jpg", width: 40%),
  caption: [A disco-ball-shaped display ball]
)

This component achieves our intended visual effect. Although it incurs some cost, it significantly reduces assembly time. Therefore, we will use this component as our light display.

== Structure & Control

The layout of the fibers, color changes of the display, and deployment and control of the step motors for varying the visible height of the display greatly affect the viewing experience.

If the fibers are too far apart, the visual effects won't be well-expressed; too close, and they won't be well-perceived.

The fiber arrangement will be determined through trial and error.

The control is where the effect happens. By varying the colors of the display, the visual pattern changes. Similarly, varying the height of each fiber changes the shape of the visual.

A microcontroller facilitates these variations. We are familiar with the Arduino Uno R3 and Raspberry Pi Pico. Although any microcontroller can achieve the same result, board choice may be a matter of preference.

We have used the Pico in many projects and will continue to use it for its versatility and cutting-edge development.

#figure(
  image("four_picos.jpg", width: 70%),
  caption: [The Raspberry Pi Pico Family]
)

The microcontroller can be further controlled by methods such as Bluetooth® technology or infrared signals.

For the motors, as the fibers and displays are light, any motor can lift them. The motors will be chosen based on availability. To move the fibers, they will be placed between two wheels rotating in opposite directions controlled by the microcontroller.

= Results

Assembling all parts, we should see a result similar to this rough sketch. 

#figure(
  image("demonstration.png"),
  caption: [Graph demonstrating the expected result (Repeated figure of @expected_result)]
)

It will vary its color and shape over time, creating stunning visual effects to attract visitors. We will control its variations using remote signals/apps.

= Conclusion

In this work, we present _Sky Full of Stars_, a visual project proposed to attract visitors to participate in the entire exhibition and serve as a milestone for the 35th anniversary of the EE stream.

We divided our project into three parts: light source, fiber and display, and structure and control. Each part was thoroughly considered to determine the necessary components.

We look forward to this project being approved and are excited for the insights and experiences it will bring.

#text(weight: "bold")[Acknowledgements] #h(1em) We are grateful to Ms. Lee Poh Peng and Mr. Chua Jiunn He for their inspiration and support.

= Reflections

#grid(columns: 2, rows: 2, gutter: 8pt, 
  align(end)[*Wong Kuok Jun: *], 
  [Since the start of this project, we have brainstormed numerous methods to address the challenges encountered during the proposal discussion. Ultimately, this is just a proposal, and we may uncover additional issues as we progress. We hope this proposal provides our teacher with sufficient information about our project. We look forward to achieving excellent results.],
  align(end)[*Woong Ze Yi: *], 
  [I love how an exhibition project like this provides so many insights! Proposing something this ambitious is inherently challenging, but I enjoy delving deeply into it. Overall, I thoroughly enjoy everything this project has to offer!]
)