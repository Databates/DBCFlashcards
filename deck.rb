require_relative 'card.rb'


class Deck
  attr_reader :file
  attr_accessor :cards
  def initialize(filename)
    @file = filename
    @cards = []
    @used_cards
    create_cards
    shuffle
  end

  def create_cards
    holder =[]
    File.foreach(file).with_index do |row, index|
      if (index + 1) % 3 != 0
        holder << row.chomp
      end
    end

    holder.each_with_index do |item, index|
      if index % 2 == 0 && index != 0
        cards << Card.new(holder[index - 1], holder[index])
      end
    end
  end

  def select_a_card
    cards.pop
  end

  def shuffle
    cards.shuffle!
  end

end



