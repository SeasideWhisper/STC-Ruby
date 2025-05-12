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


red = "\e[31m"
green = "\e[32m"
yellow = "\e[33m"
blue = "\e[34m"
white = "\e[37m"
reset = "\e[0m"


printText = ->(text) { 
    puts text+reset 
    sleep 0.5
}

def printText(text)
    printText.call(text)
end

while KINGDOM[:money] > -1000 && KINGDOM[:citizens] > 5
    puts "Current Kingdom Status: Money: #{KINGDOM[:money]}, Citizens: #{KINGDOM[:citizens]}, Happiness: #{KINGDOM[:happiness]}"
    
    6.times do
        
        personDialogue = people[rand(people.length())][:dialogue].sample
        printText.call(personDialogue)  if debug
        personQuestion = text[personDialogue][:question]
        printText.call(personQuestion)
        render(personQuestion)
        key = ""

        until key == "y" || key == "n"
            key = reader.read_keypress
        end
        prevKingdom = KINGDOM.dup
        if key == "y"
            printText.call(text[personDialogue][:y])
            text[personDialogue][:affects][:y].call(printText)
        else 
            printText.call(text[personDialogue][:n])
            text[personDialogue][:affects][:n].call(printText)
        end
        KINGDOM.each do |key, value|
            difference = value - prevKingdom[key]
            differenceString = difference.to_s
            differenceString = "+"+difference.to_s if difference > 0
            effectText = red+"#{key.capitalize}: #{differenceString}"
            if difference > 0
                effectText = green+"#{key.capitalize}: #{differenceString}"
            end
            printText.call(effectText)if difference != 0
        end
        sleep 1
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