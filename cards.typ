#set page(paper: "a4", margin: (x: 0.65cm, y: 0.65cm))
#set text(font: "Roboto")

#let card(name, text_, icon) = {
  set par(leading: 0.2em)
  show heading: set text(size: 13pt)
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
  if text_ != "" {
    [\ ]
    box(text(text_, size: 11pt))
  }
}

// Function to create a grid of cards
#let gridOfCards(card_data) = {
  let cards = ()
  for card in card_data {
    for i in range(card.count) {
      cards.push(card)
    }
  }
  show heading: set align(center)
  show text: set align(center)
  grid(
    columns: (10em, 10em, 10em, 10em, 10em),
    rows: 14.63em,
    gutter: 0cm,
    ..cards.map(
      x => {
        box(card(x.name, x.description, x.icon), inset: 0.2em)
      },
    ),
    stroke: (paint: silver, thickness: 1pt, dash: "dashed"),
    align: center,
  )
}


// Example usage
#let cards = yaml("cards.yaml")
#gridOfCards(cards)
