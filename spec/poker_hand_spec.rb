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
      expect(poker_hand.hand.length).to eq(5)
      expect(poker_hand.hand[0].value).to eq("4")
      expect(poker_hand.hand[0].suite).to eq("C")
    end
  end

  describe "Methods" do

    describe "check_repeating_values" do
      it "should count the number of unique values in a hand and return hash" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "4", suite: "D"),
                 double("card", value: "2", suite: "C"),
                 double("card", value: "6", suite: "A"),
                 double("card", value: "K", suite: "D")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.check_repeating_values).to eq({"4"=>2, "2"=>1, "6"=>1, "K"=>1})
      end
    end

    end
  end
end
