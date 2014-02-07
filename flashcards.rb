#https://github.com/To-mos/DBCFlashcards.git

require_relative 'deck.rb'
require_relative 'display.rb'

Display.clear_screen!
Display.move_cursor_to_home!
Display.draw ("Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!")

game1 = Deck.new('flashcard_samples.txt')

until game1.cards.empty?
    card = game1.select_a_card
    Display.draw("Definition: ")
    puts Display.draw(card.definition)
    Display.draw("Answer: ")

    answer = gets.chomp.downcase
    until answer == card.word.downcase
      Display.draw "Thats incorrect please try again. "
      answer = gets.chomp
    end

    Display.draw "That's correct!"

end
