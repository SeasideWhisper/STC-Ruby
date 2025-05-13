require_relative "text"
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
  happiness: 80,
}

def render(question)
  sprintf("%100s", question)
end

red = "\e[31m"
green = "\e[32m"
yellow = "\e[33m"
blue = "\e[34m"
white = "\e[37m"
reset = "\e[0m"
bold = "\e[1m"
underlined = "\e[4m"
italic = "\e[3m"

printText = ->(text, name = nil) {
  if name
    puts green + underlined + name + reset + ": " + text + reset
  else
    puts text + reset
  end
  sleep 0.5 if !debug
}

def printText(text, name = nil)
  printText.call(text)
end

while KINGDOM[:money] > -1000 && KINGDOM[:citizens] > 5
  oldKingdom = KINGDOM.dup
  prevName = ""
  6.times do
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    puts "Current Kingdom Status: Money: #{KINGDOM[:money]}, Citizens: #{KINGDOM[:citizens]}, Happiness: #{KINGDOM[:happiness]}"
    keyedDialogue = nil
    personName = ""

    while keyedDialogue.nil? || prevName == personName
      person = people[rand(people.length())]
      personName = person[:name]
      if person[:dialogue]
        personDialogue = person[:dialogue].sample
        printText.call(personDialogue) if debug
        keyedDialogue = text[personDialogue]
      end
    end
    prevName = personName.dup
    personQuestion = keyedDialogue[:question]
    printText.call(personQuestion, personName)
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
      differenceString = "+" + difference.to_s if difference > 0
      effectText = red + "#{key.capitalize}: #{differenceString}"
      if difference > 0
        effectText = green + "#{key.capitalize}: #{differenceString}"
      end
      printText.call(effectText) if difference != 0
    end
    sleep 1 if !debug
  end

  KINGDOM[:citizens] = [KINGDOM[:citizens], 0].max
  KINGDOM[:happiness] = [KINGDOM[:happiness], 0].max

  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n=========================\nWeek Summary:"
  KINGDOM.each do |key, value|
    difference = value - oldKingdom[key]
    differenceString = difference.to_s
    differenceString = "+" + difference.to_s if difference > 0
    effectText = red + "#{key.capitalize}: #{differenceString}"
    if difference > 0
      effectText = green + "#{key.capitalize}: #{differenceString}"
    end
    printText.call(effectText)
  end
  printText.call("Current Kingdom Status: Money: #{KINGDOM[:money]}, Citizens: #{KINGDOM[:citizens]}, Happiness: #{KINGDOM[:happiness]}")
  printText.call("========================")
  if KINGDOM[:happiness] > 20
    printText.call(green + "Your Citizens are Happy!")
    newCitizens = (KINGDOM[:happiness] - 20) / 6
    printText.call(green + "+" + newCitizens.to_s + " Citizens")
    KINGDOM[:citizens] += newCitizens
  else
    printText.call(red + "Your Citizens are Unhappy!")
    lostCitizens = (20 - KINGDOM[:happiness]) / 3
    printText.call(red + "-" + lostCitizens.to_s + " Citizens")
    KINGDOM[:citizens] -= lostCitizens
  end
  puts "========================="
  puts "Press [space] to continue!"

  key = ""
  until key == " "
    key = reader.read_keypress
    puts "[" + key + "]" if debug
  end

  break if KINGDOM[:money] <= -1000 || KINGDOM[:citizens] <= 5
end

if KINGDOM[:money] <= -1000
  puts "The kingdom has gone bankrupt and collapsed!"
elsif KINGDOM[:citizens] <= 5
  puts "The kingdom has lost too many citizens and collapsed!"
end
