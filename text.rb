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
    },
    {
      dialogue: ["coinFlipBet"],
      name: "Gambler"
    },
    {
      dialogue: ["researchFunding"],
      name: "Scientist"
    },
    {
      dialogue: ["tellJoke"],
      name: "Jester"
    },
    {
      dialogue: ["buyFlowers"],
      name: "Gardener"
    },
    {
      dialogue: ["soupShop"],
      name: "Grandma"
    },
    {
      dialogue: ["fishingBoat"],
      name: "Fisherman"
    },
    {
      dialogue: ["dragonblade"],
      name: "Knight"
    },
    {
      dialogue: ["stealGold"],
      name: "Sneaky Girl"
    },
    {
      dialogue: ["ghostTown"],
      name: "Spirits"
    },
    {
      dialogue: ["demonicRequest"],
      name: "Demon"
    },
    {
      dalogue: []
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
    },
    "plantTrees" => {
      y: -> {
        KINGDOM[:happiness] += 4
        KINGDOM[:people] += 1
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
        KINGDOM[:people] -= 2
      },
      n: -> {
        KINGDOM[:happiness] += 2
      }
    },
    "coinFlipBet" => {
      y: -> {
        if rand < 0.5
          KINGDOM[:money] += 100
        else
          KINGDOM[:money] -= 100
        end
      },
      n: -> {}
    },
    "researchFunding" => {
      y: -> {
        KINGDOM[:money] -= 50
        KINGDOM[:happiness] += 10
        KINGDOM[:people] += 1
      },
      n: -> { KINGDOM[:happiness] -= 3 }
    },
    "tellJoke" => {
      y: -> { KINGDOM[:happiness] += 6 },
      n: -> {}
    },
    "buyFlowers" => {
      y: -> {
        KINGDOM[:money] -= 5
        KINGDOM[:happiness] += 7
      },
      n: -> { KINGDOM[:people] += 3 }
    },
    "soupShop" => {
      y: -> {
        KINGDOM[:money] -= 10
        KINGDOM[:happiness] += 5
      },
      n: -> {}
    },
    "fishingBoat" => {
      y: -> {
        KINGDOM[:money] -= 100
        KINGDOM[:money] += 150
      },
      n: -> {}
    },
    "dragonblade" => {
      y: -> {
        KINGDOM[:money] -= 300
        KINGDOM[:happiness] += 20
      },
      n: -> {}
    },
    "stealGold" => {
      y: -> {
        KINGDOM[:money] += 100
        KINGDOM[:happiness] -= 10
      },
      n: -> {}
    },
    "ghostTown" => {
      y: -> {
        KINGDOM[:happiness] += 10
        KINGDOM[:people] += 5
      },
      n: -> {}
    },
    "demonicRequest" => {
      y: -> {
        KINGDOM[:money] += 500
        KINGDOM[:happiness] -= 50
      },
      n: -> {}
    }
  }
end
