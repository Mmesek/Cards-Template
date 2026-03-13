#set page(paper: "a4", margin: (x: 0.65cm, y: 0.65cm))
#set text(font: "Roboto")

#let card(name, description, icon, footer, padding: false, description_: (size: 11pt, font: "Roboto")) = {
  box(
    [#if padding == true { [\ ] }
      #if ("." in icon and icon != "") {
        box(image(icon, width: 3.7cm, height: 3cm, fit: "contain"))
      } else if icon != "" {
        show heading.where(level: 1): set text(size: 110pt, font: "Chomsky")
        box(heading(icon))
      }
      #if name != "" {
        if icon == "" {
          show heading: set text(size: 200pt)
          box(heading(name, level: 2))
        } else {
          box(heading(name, level: 2))
        }
      }
      #if description != "" {
        box(text(description, size: description_.size, font: description_.font))
      }

      #if footer != "" {
        box(text(footer, size: 7pt))
      }],
    stroke: (paint: black, thickness: 1.5pt, dash: "solid"),
    inset: 3pt,
    radius: 2em,
    clip: true,
    height: 5.5cm,
    width: 3.7cm,
  )
}

#let gridOfCards(card_data, columns: 5, rows: 14.63em, c_f: card) = {
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
    columns: (100% / columns,) * columns,
    rows: rows,
    gutter: 0cm,
    ..cards.map(
      x => {
        box(
          c_f(
            x.name,
            x.at("description", default: ""),
            x.at("icon", default: ""),
            x.at("footer", default: ""),
          ),
          inset: 0.2em,
        )
      },
    ),
    stroke: (paint: silver, thickness: 1pt, dash: "dashed"),
    align: center,
  )
}


#gridOfCards(yaml("cards.yaml"))
