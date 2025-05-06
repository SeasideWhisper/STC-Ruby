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

# USE `bundle install` TO INSTALL DEPENDENCEIS




while KINGDOM[:money] > -1000 && KINGDOM[:citizens] > 5
    puts "Current Kingdom Status: Money: #{KINGDOM[:money]}, Citizens: #{KINGDOM[:citizens]}, Happiness: #{KINGDOM[:happiness]}"
    
    6.times do
        personDialogue = people[rand(people.length())][:dialogue]
        puts personDialogue if debug
        personQuestion = text[personDialogue.first][:question]
        puts personQuestion
        key = ""
        while key != "y" || key != "n"
            key = reader.read_keypress
        end

    end

    # Ensure values don't go negative
    KINGDOM[:citizens] = [KINGDOM[:citizens], 0].max
    KINGDOM[:happiness] = [KINGDOM[:happiness], 0].max

    # Break the loop if the kingdom collapses
    break if KINGDOM[:money] <= -1000 || KINGDOM[:citizens] <= 5
end

if KINGDOM[:money] <= -1000 
puts "The kingdom has gone bankrupt and collapsed!"
elsif KINGDOM[:citizens] <= 5
    puts "The kingdom has lost too many citizens and collapsed!"
end
