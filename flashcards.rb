#https://github.com/To-mos/DBCFlashcards.git

require_relative 'deck.rb'
require_relative 'display.rb'

#start up the screen system
Display.clear_screen!
Display.move_cursor_to_home!
Display.fox!
Display.draw ("Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready? ")
1.upto(3) {|num| print"#{num}..."; sleep(1.0)}
Display.draw("  Go!")

game1 = Deck.new('flashcard_samples.txt')

until game1.cards.empty?
    card = game1.select_a_card
    Display.draw("Definition: ")

    puts Display.draw(card.definition)
    Display.draw("Answer: ")

    answer = gets.chomp.downcase
    exit if answer == "exit"
    until answer == card.word.downcase
      Display.reputs "Thats incorrect please try again. "
      answer = gets.chomp.downcase
      exit if answer == "exit"
    end

    Display.clear_screen!
    Display.fox!
    Display.draw "That's correct!"
end
