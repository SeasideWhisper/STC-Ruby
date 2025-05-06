module Events
 EVENTS = {
    "tavern" = > {
      name: "Party Tonight",
      text: "There's a party at the tavern tonight, your citizens are happy!"
      recurring: 0,
      affects: AFFECTS["tavern"],
      condition: { (KINGDOM[:happiness] > 100) }
    }
 }

  AFFECTS = {
    "tavern" => {

    }
  }

end
