require 'faker'

class Cards

  attr_reader :card_name

  def initialize
    @card_name = Faker::Name.title
  end

  def add_comment_to_a_card(card_name, comment)
    puts "To card #{card_name} added a comment: '#{comment}'"
    puts ""
  end

  def delete_comment_from_a_card(card_name, comment)
    puts "From card #{card_name} deleted a comment: '#{comment}'"
    puts ""
  end

  def self.generate_n_cards(n)
    cards = []
    n.times do
      cards << self.new
    end
    cards
  end

  def to_s
    "Card: #{@card_name}"
  end

end