require_relative "card"
require 'pry'

class PokerHand

  attr_reader :hand, :score

  def initialize(cards)
    @hand = cards
    @score = 0
  end

  # build a new hash with the values of the cards pointing to the number
  # of times they occur in a hand
  def check_repeating_values
    hand.each_with_object(Hash.new(0)) do |card, hash|
      hash[card.value] += 1
    end
  end

  # count the number of pairs by selecting them based on the argument variable passed
  # returns hash of pair(s)
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

  # first grab the suite of the first card as a basis
  # then check to see if all cards in the hand are the same suite
  def flush?
    suite = hand.first.suite
    hand.all? { |card| card.suite == suite}
  end

  # sort the hand by the values of the cards and check to see if they are consecutive
  def straight?
    holder_hand = hand.sort_by { |card| card.value}
    holder_hand.each_cons(2).all? { |first_card, comparable_card| comparable_card.value == first_card.value.next}
  end

  # if the hand is both a flush and straight then it returns true
  def straight_flush?
    flush? && straight? ? true : false
  end

  # if there is a straight flush and the upper most value of cards is present
  # then this hand is a royal flush
  def royal_flush?
    straight_flush? && hand.any? { |card| card.value == "14"}
  end

  # sort the hand by the card values and then grab the top value of the hand
  def top_card
    holder_hand = hand.sort_by { |card| card.value }
    holder_hand.last.value
  end

  # add up final score based off all the previous boolean methods
  def score_hand
    final_score = 0
    final_score += 2 if pair?
    final_score += 3 if two_pair?
    final_score += 4 if three_of_a_kind?
    final_score += 5 if straight?
    final_score += 6 if flush?
    final_score += 1 if pair? && three_of_a_kind?
    final_score += 8 if four_of_a_kind?
    final_score += 1 if royal_flush?
    @score = final_score
  end
end
