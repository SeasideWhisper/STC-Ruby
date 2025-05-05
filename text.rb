module Text

  PEOPLE = [
    {
      dialogue: ["goAdventure"],
      name: "Yet Yet"
    },
    {
      dialogue: ["feelinSpooky"],
      name: "Lil Fang"
    },
    {
      dialogue: ["hauntingServices"],
      name: "Monsieur Esprit"
    },
    {
      dialogue: ["darkDeal"],
      name: "Georgie"
    },
    {
      dialogue: ["constructTavern"],
      name: "Mason"
    },
  {
    dialogue: ["petCat"],
    name: "Boots"
  },
  {
    dialogue: ["slayGoblins"],
    name: "Witch"
  },
  {
    dialogue: ["coolGuy"],
    name: "Royal Advisor"
  }
].freeze

AFFECTS = {
  "goAdventure" => {
    y: -> { KINGDOM[:happiness] += 5 },
    n: -> { KINGDOM[:happiness] -= 5 }
  },
  "feelinSpooky" => {
    y: -> { KINGDOM[:happiness] -= 5 },
    n: -> {}
  },
  "hauntingServices" => {
    y: -> {
      KINGDOM[:money] -= 10
      KINGDOM[:happiness] += 5
    },
    n: -> {}
  },
  "darkDeal" => {
    y: -> {
      KINGDOM[:money] += 250
      KINGDOM[:happiness] -= 35
    },
    n: -> {}
  },
  "constructTavern" => {
    y: -> {
      KINGDOM[:money] -= 100
      KINGDOM[:happiness] += 15
    },
    n: -> {}
  },
  "petCat" => {
    y: -> { KINGDOM[:happiness] += 3 },
    n: -> {}
  },
  "slayGoblins" => {
    y: -> {
      KINGDOM[:money] -= 10
      KINGDOM[:people] += 5
    },
    n: -> { KINGDOM[:people] -= 3 }
  },
  "coolGuy" => {
    y: -> { KINGDOM[:happiness] += 5 },
    n: -> { KINGDOM[:happiness] -= 5 }
  }
}

TEXT = {
  "goAdventure" => {
    question: "Mom says I need to ask your permission to go on an adventure. So can I? Please? Please?",
    y: "Yay! Thanks Queen!",
    n: "Aww, okay...",
    affects: AFFECTS["goAdventure"]
  },
  "feelinSpooky" => {
    question: "You feelin’ spooky today?",
    y: "Muahaha!",
    n: "Aww, okay.",
    affects: AFFECTS["feelinSpooky"]
  },
  "hauntingServices" => {
    question: "Do you require any haunting services? For a small price I’ll scare some people for you.",
    y: "Consider them haunted.",
    n: "No worries, I’ll be back later.",
    affects: AFFECTS["hauntingServices"]
  },
  "darkDeal" => {
    question: "Hey buddy, care to make a deal? I’ll give you 250 gold for a few souls.",
    y: "Hehe, yeah buddy!",
    n: "Suit yourself.",
    affects: AFFECTS["darkDeal"]
  },
  "constructTavern" => {
    question: "I wish to construct a tavern, but I’ll need some gold from you to make it happen.",
    y: "Thank you! This will help the town.",
    n: "Maybe another time.",
    affects: AFFECTS["constructTavern"]
  },
  "petCat" => {
    question: "Meeoow. (Looks like he wants somebody to pat his belly...)",
    y: "*purrs*",
    n: "*hiss*",
    affects: AFFECTS["petCat"]
  },
  "slayGoblins" => {
    question: "There’s a buncha goblins in the lower quarter. I’ll slay ’em for a few gold coins if you want.",
    y: "I’ll handle it.",
    n: "Suit yourself, they’ll be back.",
    affects: AFFECTS["slayGoblins"]
  },
  "coolGuy" => {
    question: "My lady, a man wishes to settle a dispute. He says he is way cool, but his friend says he is not. Do you think he is cool?",
    y: "He is indeed cool.",
    n: "He is not cool.",
    affects: AFFECTS["coolGuy"]
  }
}.freeze

end