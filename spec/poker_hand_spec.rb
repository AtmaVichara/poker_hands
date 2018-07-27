require "rspec"
require "./lib/poker_hand"
require "./lib/card"

describe "Poker Hand Spec" do
  describe "Attributes" do
    it "should contain array of cards" do
      card = double("card", value: "4", suite: "C")
      poker_hand = PokerHand.new([card, card, card, card, card])
      expect(poker_hand).to_not be_nil
      expect(poker_hand.cards.length).to eq(5)
    end
  end
end
