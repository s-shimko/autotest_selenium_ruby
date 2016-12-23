require 'faker'

class List
  attr_reader :list_name

  def initialize(list_name)
    @list_name = list_name
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def add_cards(board_name, list_name,cards)
    puts "User2 added cards: "
    puts "---Board: #{board_name}---List: #{list_name}-----"
    cards.each do |card|
      add_card(card)
    end
  end

end