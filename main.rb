require_relative 'text'

people = Text::PEOPLE
affects = Text::AFFECTS
text = Text::TEXT


eventArray = []

money = 200
citizens = 50
happiness = 80

personDialogue = people[rand(4)][:dialogue]
puts personDialogue
personQuestion = text[personDialogue.first][:question]
puts personQuestion