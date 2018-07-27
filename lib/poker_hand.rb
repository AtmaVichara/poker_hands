require_relative "card"

class PokerHand

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

end
