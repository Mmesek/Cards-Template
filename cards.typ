#set page(paper: "a4", margin: (x: 0.65cm, y: 0.65cm))
#set text(font: "Roboto")

#let card(name, description, icon) = {
  if icon != "" {
    box(image(icon, width: 3.7cm, height: 3cm, fit: "contain"))
  }

  if name != "" {
    [\ ]
    if icon == "" {
      show heading: set text(size: 200pt)
      box(heading(name))
    } else {
      box(heading(name))
    }
  }

  if description != "" {
    [\ ]
    box(text(description, size: 11pt))
  }
}

#let gridOfCards(card_data, columns: 5, rows: 14.63em) = {
  let cards = ()
  for card in card_data {
    for i in range(card.at("count", default: 1)) {
      cards.push(card)
    }
  }

  show heading: set align(center)
  show text: set align(center)
  show heading: set text(size: 13pt)
  set par(leading: 0.2em)

  grid(
    columns: columns,
    rows: rows,
    gutter: 0cm,
    ..cards.map(
      x => {
        box(
          card(
            x.name,
            x.at("description", default: ""),
            x.at("icon", default: ""),
          ),
          inset: 0.2em,
        )
      },
    ),
    stroke: (paint: silver, thickness: 1pt, dash: "dashed"),
    align: center,
  )
}


//#gridOfCards(yaml("cards.yaml"))
