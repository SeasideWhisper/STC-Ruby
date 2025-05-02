module Text

  PEOPLE = [
    {
      dialogue: ["testDialogue1"],
      name: "test"
    },
    {
      dialogue: ["testDialogue2"],
      name: "test2"
    },
    {
      dialogue: ["testDialogue3"],
      name: "test3"
    },
    {
      dialogue: ["testDialogue4"],
      name: "test4"
    },
    {
      dialogue: ["testDialogue5"],
      name: "test6"
    }
  ].freeze

  AFFECTS = {
    "testDialogue1" => {
      y: -> { puts "y" },
      n: -> { puts "n" }
    },
    "testDialogue2" => {
      y: -> { puts "y" },
      n: -> { puts "n" }
    },
    "testDialogue3" => {
      y: -> { puts "y" },
      n: -> { puts "n" }
    },
    "testDialogue4" => {
      y: -> { puts "y" },
      n: -> { puts "n" }
    },
    "testDialogue5" => {
      y: -> { puts "y" },
      n: -> { puts "n" }
    }
  }.freeze

  TEXT = {
    "testDialogue1" => {
      question: "Can I have a sandwich?",
      y: "Yay!!!",
      n: "Aww ):",
      affects: AFFECTS["testDialogue1"]
    },
    "testDialogue2" => {
      question: "Can I have a sandwich?",
      y: "Yay!!!",
      n: "Aww ):",
      affects: AFFECTS["testDialogue1"]
    },
    "testDialogue3" => {
      question: "Can I have a sandwich?",
      y: "Yay!!!",
      n: "Aww ):",
      affects: AFFECTS["testDialogue1"]
    },
    "testDialogue4" => {
      question: "Can I have a sandwich?",
      y: "Yay!!!",
      n: "Aww ):",
      affects: AFFECTS["testDialogue1"]
    },
    "testDialogue5" => {
      question: "Can I have a sandwich?",
      y: "Yay!!!",
      n: "Aww ):",
      affects: AFFECTS["testDialogue1"]
    }
  }.freeze

end