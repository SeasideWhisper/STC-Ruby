require_relative 'text'
require "tty-reader"

debug = false

reader = TTY::Reader.new

people = Text::PEOPLE
affects = Text::AFFECTS
text = Text::TEXT

eventArray = []

KINGDOM = {
    money: 200,
    citizens: 50,
    happiness: 80
}

# USE `bundle install` TO INSTALL DEPENDENCIES

while KINGDOM[:money] > -1000 && KINGDOM[:citizens] > 5
    puts "Current Kingdom Status: Money: #{KINGDOM[:money]}, Citizens: #{KINGDOM[:citizens]}, Happiness: #{KINGDOM[:happiness]}"
    
    6.times do
        personDialogue = people[rand(people.length())][:dialogue]
        puts personDialogue if debug
        personQuestion = text[personDialogue.first][:question]
        puts personQuestion
        key = ""

        # yo ben i fixed it so that it loops until "y" or "n" is entered
        until key == "y" || key == "n"
            key = reader.read_keypress
        end

        # shows ye or no
        puts text[personDialogue.first][key]

        # applies the effect
        text[personDialogue.first][:affects][key].call
    end

    # makes sure happiness and citizens dont go into the negatives
    KINGDOM[:citizens] = [KINGDOM[:citizens], 0].max
    KINGDOM[:happiness] = [KINGDOM[:happiness], 0].max

    # stops if kingdom dies or collapses or whatever
    break if KINGDOM[:money] <= -1000 || KINGDOM[:citizens] <= 5
end

if KINGDOM[:money] <= -1000 
    puts "The kingdom has gone bankrupt and collapsed!"
elsif KINGDOM[:citizens] <= 5
    puts "The kingdom has lost too many citizens and collapsed!"
end
