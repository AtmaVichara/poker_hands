require_relative "card"

class PokerHand

  attr_reader :hand, :score

  def initialize(cards)
    @hand = cards
    @score = 0
  end

  def check_repeating_values
    hand.each_with_object(Hash.new(0)) do |card, hash|
      hash[card.value] += 1
    end
  end

  def kinds(comparable_count)
    kinds = check_repeating_values.select do |value, count|
      count == comparable_count
    end
    kinds
  end

end
