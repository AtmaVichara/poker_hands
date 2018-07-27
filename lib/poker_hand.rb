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

  def pair?
    kinds(2).length == 1
  end

  def two_pair?
    kinds(2).length == 2
  end

  def three_of_a_kind?
    kinds(3).length == 1
  end

  def four_of_a_kind?
    kinds(4).length == 1
  end

  def flush?
    suite = hand.first.suite
    hand.all? { |card| card.suite == suite}
  end

end
