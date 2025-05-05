require_relative 'text'

people = Text::PEOPLE
affects = Text::AFFECTS
text = Text::TEXT

eventArray = []

KINGDOM = {
    money = 200
    citizens = 50
    happiness = 80
}



personDialogue = people[rand(people.length())][:dialogue]
puts personDialogue
personQuestion = text[personDialogue.first][:question]
puts personQuestion

