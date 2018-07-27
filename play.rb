require "./lib/card"
require "./lib/poker_hand"
require "pry"

if __FILE__ == $0
  player_one_wins = 0
  reader = File.open('data/poker.txt', 'r')
  reader.each_line do |line|

    line.strip!
    mid = line.length / 2

    player_one_cards = line[0...mid].split(" ").map { |card| Card.new(card)}
    player_two_cards = line[mid..-1].split(" ").map { |card| Card.new(card)}

    player_one_hand = PokerHand.new(player_one_cards)
    player_two_hand = PokerHand.new(player_two_cards)

    player_one_hand.score_hand
    player_two_hand.score_hand

    # if the scores are equal then check for the top most card
    if player_one_hand.score > player_two_hand.score
      player_one_wins += 1
    elsif player_one_hand.score == player_two_hand.score
      player_one_wins += 1 if player_one_hand.top_card > player_two_hand.top_card
    end
  end

  puts "Player One wins #{player_one_wins} times."
end
