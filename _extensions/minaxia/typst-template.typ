#let article(
  title: none,
  subtitle: none,
  version: none,
  doc,
) = {
  let cylenk-primary = rgb("#5f1992")
  let cylenk-link = rgb("#231992")
  let cylenk-charcoal = rgb("#1e1e1d")


  set document(title: title)
  set par(justify: true, leading: 0.65em)

  set text(
    lang: "en",
    region: "GB",
    font: ("Libertinus Serif",),
    size: 11pt,
    fill: cylenk-charcoal,
  )

  set page(margin: (x: 15mm, y: 25mm))

  if title != none {
    set page(header: none, footer: none)
    set text(size: 14pt)
    let line-strokes = 2pt + cylenk-primary
    
    //Domain Context
    align(right,
      block(
      stroke: (left: line-strokes),
      inset: (left: 1.5em, right: 0.5em, top: 0.5em, bottom: 0.5em),
      align(left,
          smallcaps[
            Hardware\
            Software\
            Firmware\
            Connected Systems])))



    // Title and Doc info
    v(1fr)
    // line(stroke: line-strokes, length: 2.5cm)
    block(text(size: 40pt, smallcaps(title)))
    v(0.5em)
    block(text(size: 20pt, subtitle))
    v(1em)
    line(stroke: line-strokes, length: 2.5cm)
    block[
      #smallcaps[Version]: #version \
      #smallcaps(datetime.today().display("[month repr:long] [year]"))
    ]
    v(1fr)


    // Footer branding
    
    let label = smallcaps[Published and Maintained By]

    context {
      let w = measure(label).width
      show underline: it => it.body 


      grid(
        columns: (auto, 1fr, auto),
        block(
          line(stroke: line-strokes, length: 2.5cm)
          +stack( 
            dir: ttb,
            spacing: 8pt,
            label,
            image("brand/logo-with-no-bg.svg", width: w))),
        [],
          grid.cell(
            align: bottom + right,
            align(left, stack(
              dir: ttb,
              spacing: 8pt,
              line(stroke: line-strokes),
              link("https://cylenk.com/minaxia", text(fill:black, strong[cylenk.com/minaxia])))
            ))
      )
    }

    pagebreak(weak: true)
  }

  set page(
    header: align(
      right,
      image("brand/logo-text-only-no-bg.svg", width: 20mm),
    ),
    footer: align(
      right,
      box(context counter(page).display("1")),
    ),
  )
  

  // The title page precedes these rules, leaving its URL plain black.
  show link: it => {
    set text(fill: cylenk-link)
    emph(it)
  }

  //Headings
  set heading(numbering: "1.1.1")
  show heading: it => {
    v(1em)
    text(fill: cylenk-primary, font: ("Libertinus Sans"), it)
    v(0.2em)
  }
  show heading.where(level: 1): it => colbreak(weak: true) + it

  //Paragraphs
  // You should also edit this in callouts in definitions.typ
  let  par-margin= 1.5cm
  show par: it => block(
    inset: (left: par-margin, right: par-margin),
    it,
  )
  show list: it => block(
    inset: (left: par-margin, right: par-margin),
    it,
  )
  show enum: it => block(
    inset: (left: par-margin, right: par-margin),
    it,
  )



  block(above: 0em, below: 2em)[
    #outline(
      title: [Table of contents],
      depth: 2,
      indent: 1.5em,
    )
  ]

  doc
}

#set table(
  inset: 6pt,
  stroke: none,
)
