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
        personDialogue = people[rand(people.length())][:dialogue].sample
        puts personDialogue if debug
        personQuestion = text[personDialogue.first][:question]
        puts personQuestion
        key = ""

        # yo ben i fixed it so that it loops until "y" or "n" is entered
        until key == "y" || key == "n"
            key = reader.read_keypress
        end
        prevKingdom = KINGDOM.dup
        # shows ye or no
        if key == "y"
            puts text[personDialogue.first][:y]
            text[personDialogue.first][:affects][:y].call
        else 
            puts text[personDialogue.first][:n]
            text[personDialogue.first][:affects][:n].call
        end
        KINGDOM.each do |key, value|
            difference = value - prevKingdom[key]
            difference = "+"+difference.to_s if difference > 0
            puts "#{key.capitalize}: #{difference}" if difference != 0
        end
        
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
