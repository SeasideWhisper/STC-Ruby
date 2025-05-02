require_relative 'text'

people = Text::PEOPLE
affects = Text::AFFECTS
text = Text::TEXT


eventArray = []


personDialogue = people[rand(4)][:dialogue]
puts personDialogue
personQuestion = text[personDialogue.first][:question]
puts personQuestion