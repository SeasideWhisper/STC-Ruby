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

def render(question)
    sprintf('%100s', question)
end


def printText(text)
  puts text
end


while KINGDOM[:money] > -1000 && KINGDOM[:citizens] > 5
    puts "Current Kingdom Status: Money: #{KINGDOM[:money]}, Citizens: #{KINGDOM[:citizens]}, Happiness: #{KINGDOM[:happiness]}"
    
    6.times do
        personDialogue = people[rand(people.length())][:dialogue].sample
        puts personDialogue if debug
        personQuestion = text[personDialogue][:question]
        puts personQuestion
        render(personQuestion)
        key = ""

        until key == "y" || key == "n"
            key = reader.read_keypress
        end
        prevKingdom = KINGDOM.dup
        if key == "y"
            puts text[personDialogue][:y]
            text[personDialogue][:affects][:y].call
        else 
            puts text[personDialogue][:n]
            text[personDialogue][:affects][:n].call
        end
        KINGDOM.each do |key, value|
            difference = value - prevKingdom[key]
            difference = "+"+difference.to_s if difference > 0
            puts "#{key.capitalize}: #{difference}" if difference != 0
        end
    end

    KINGDOM[:citizens] = [KINGDOM[:citizens], 0].max
    KINGDOM[:happiness] = [KINGDOM[:happiness], 0].max

    break if KINGDOM[:money] <= -1000 || KINGDOM[:citizens] <= 5
end

if KINGDOM[:money] <= -1000 
    puts "The kingdom has gone bankrupt and collapsed!"
elsif KINGDOM[:citizens] <= 5
    puts "The kingdom has lost too many citizens and collapsed!"
end