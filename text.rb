module Text

  PEOPLE = [
    {
      dialogue: ["goAdventure"],
      name: "Yet Yet"
    },
    {
      dialogue: ["feelinSpooky",  "nickName", "vampireCrystal"],
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
    },
    {
      dialogue: ["plantTrees"],
      name: "Greenthumb"
    },
    {
      dialogue: ["taxRequest"],
      name: "Collector"
    },
    {
      dialogue: ["dragonSighting"],
      name: "Scout"
    }
  ].freeze

  AFFECTS = {
    "goAdventure" => {
      y: -> { KINGDOM[:happiness] += 5 },
      n: -> { KINGDOM[:happiness] -= 5 }
    },
    "feelinSpooky" => {
      y: -> { KINGDOM[:citizens] -= 1 },
      n: -> {}
    },
    "nickName" => {
      y: -> { KINGDOM[:happiness] +=1 },
      n: -> { KINGDOM[:happiness] -=1 }
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
        KINGDOM[:citizens] += 5
      },
      n: -> { KINGDOM[:citizens] -= 3 }
    },
    "coolGuy" => {
      y: -> { KINGDOM[:happiness] += 5 },
      n: -> { KINGDOM[:happiness] -= 5 }
    },
    "plantTrees" => {
      y: -> {
        KINGDOM[:happiness] += 4
        KINGDOM[:citizens] += 1
        KINGDOM[:money] -= 20
      },
      n: -> { KINGDOM[:happiness] -= 2 }
    },
    "taxRequest" => {
      y: -> {
        KINGDOM[:money] += 50
        KINGDOM[:happiness] -= 10
      },
      n: -> {}
    },
    "dragonSighting" => {
      y: -> {
        KINGDOM[:happiness] -= 10
        KINGDOM[:citizens] -= 2
      },
      n: -> {
        KINGDOM[:happiness] += 2
      }
    }
  }.freeze

  TEXT = {
    "goAdventure" => {
      question: "Mom says I need to ask your permission to go on an adventure. So can I? Please? Please?",
      y: "Yay! Thanks Queen!",
      n: "Aww, okay...",
      affects: AFFECTS["goAdventure"]
    },
    "feelinSpooky" => {
      question: "You feelin’ spooky today?",
      y: "Heck yeah! Let the blood flow!",
      n: "Not even a little spook? Little baby bat?",
      affects: AFFECTS["feelinSpooky"]
    },
    "nickName" => {
      question: "I'm the Duke of Spook! Do you want a spooky nickname?",
      y: "Hmm... You can be... The Creep Queen?",
      n: "Aw, man... You're no fun.",
      affects: AFFECTS["nickName"]
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
    },
    "plantTrees" => {
      question: "May I plant trees along the village road? It’ll brighten the town and clean the air!",
      y: "Wonderful! The village will bloom!",
      n: "Oh... that’s unfortunate. The soil stays bare.",
      affects: AFFECTS["plantTrees"]
    },
    "taxRequest" => {
      question: "Would you approve a small tax increase? The treasury could use a boost.",
      y: "The gold flows in!",
      n: "Very well, no taxes today.",
      affects: AFFECTS["taxRequest"]
    },
    "dragonSighting" => {
      question: "Your Grace! A dragon was spotted near the outskirts. Should we alert the town?",
      y: "The bells toll. Fear spreads.",
      n: "We stay quiet... for now.",
      affects: AFFECTS["dragonSighting"]
    }
  }.freeze

end
