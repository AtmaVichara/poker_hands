require "rspec"
require "./lib/poker_hand"

describe "Poker Hand Spec" do
  describe "Attributes" do
    it "should contain array of cards" do
      card = double("card", value: "4", suite: "C")
      poker_hand = PokerHand.new([card, card, card, card, card])
      expect(poker_hand).to_not be_nil
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

    describe "#kinds" do
      it "returns hash of all the values and their counts" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "4", suite: "D"),
                 double("card", value: "2", suite: "C"),
                 double("card", value: "6", suite: "A"),
                 double("card", value: "K", suite: "D")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.kinds(2)).to eq({"4" => 2})
      end
    end

    describe "#pair?" do
      it "returns true if there is a pair of values in the hand" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "4", suite: "D"),
                 double("card", value: "2", suite: "C"),
                 double("card", value: "6", suite: "A"),
                 double("card", value: "K", suite: "D")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.pair?).to eq(true)
      end
    end

    describe "#two_pair?" do
      it "returns true if there are two pairs of values in the hand" do
        cards = [double("card", value: "2", suite: "C"),
                 double("card", value: "2", suite: "D"),
                 double("card", value: "6", suite: "A"),
                 double("card", value: "3", suite: "C"),
                 double("card", value: "3", suite: "S")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.two_pair?).to eq(true)
      end
    end

    describe "#three_of_a_kind?" do
      it "returns true if there is a three of the same values in the hand" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "4", suite: "D"),
                 double("card", value: "2", suite: "C"),
                 double("card", value: "4", suite: "A"),
                 double("card", value: "3", suite: "D")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.three_of_a_kind?).to eq(true)
      end
    end

    describe "#four_of_a_kind?" do
      it "returns true if there is four of the same values in the hand" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "4", suite: "D"),
                 double("card", value: "4", suite: "S"),
                 double("card", value: "4", suite: "A"),
                 double("card", value: "3", suite: "D")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.four_of_a_kind?).to eq(true)
      end
    end

    describe "#flush?" do
      it "should return true if all suites are the same" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "5", suite: "C"),
                 double("card", value: "2", suite: "C"),
                 double("card", value: "6", suite: "C"),
                 double("card", value: "K", suite: "C")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.flush?).to eq(true)
      end
    end

    describe "#straight?" do
      it "should return true if all suites are the same" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "5", suite: "D"),
                 double("card", value: "6", suite: "A"),
                 double("card", value: "7", suite: "C"),
                 double("card", value: "8", suite: "S")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.straight?).to eq(true)
      end
    end

    describe "#straight_flush?" do
      it "should return true if all suites are the same" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "5", suite: "C"),
                 double("card", value: "6", suite: "C"),
                 double("card", value: "7", suite: "C"),
                 double("card", value: "8", suite: "C")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.straight_flush?).to eq(true)
      end
    end

    describe "#royal_flush?" do
      it "returns true if hand represents a royal flush" do
        cards = [double("card", value: "13", suite: "C"),
                 double("card", value: "14", suite: "C"),
                 double("card", value: "11", suite: "C"),
                 double("card", value: "12", suite: "C"),
                 double("card", value: "10", suite: "C")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.royal_flush?).to eq(true)
      end
    end

    describe "#top_card" do
      it "returns the value of the card with the highest value" do
        cards = [double("card", value: "13", suite: "C"),
                 double("card", value: "14", suite: "C"),
                 double("card", value: "11", suite: "C"),
                 double("card", value: "12", suite: "C"),
                 double("card", value: "10", suite: "C")]

        poker_hand = PokerHand.new(cards)

        expect(poker_hand.top_card).to eq("14")
      end
    end

    describe "#score_hand" do
      it "should evaluate the hand and assign a score" do
        cards = [double("card", value: "4", suite: "C"),
                 double("card", value: "5", suite: "D"),
                 double("card", value: "7", suite: "A"),
                 double("card", value: "8", suite: "C"),
                 double("card", value: "6", suite: "S")]

        poker_hand = PokerHand.new(cards)
        poker_hand.score_hand

        expect(poker_hand.score).to eq(5)

        new_cards = [double("card", value: "2", suite: "C"),
                     double("card", value: "2", suite: "D"),
                     double("card", value: "6", suite: "A"),
                     double("card", value: "3", suite: "C"),
                     double("card", value: "3", suite: "S")]

        second_poker_hand = PokerHand.new(new_cards)
        second_poker_hand.score_hand

        expect(second_poker_hand.score).to eq(3)

        third_cards = [double("card", value: "2", suite: "C"),
                       double("card", value: "2", suite: "D"),
                       double("card", value: "3", suite: "A"),
                       double("card", value: "3", suite: "C"),
                       double("card", value: "3", suite: "S")]

        third_poker_hand = PokerHand.new(third_cards)
        third_poker_hand.score_hand

        expect(third_poker_hand.score).to eq(7)

        straight_flush_cards = [double("card", value: "4", suite: "C"),
                               double("card", value: "3", suite: "C"),
                               double("card", value: "2", suite: "C"),
                               double("card", value: "5", suite: "C"),
                               double("card", value: "6", suite: "C")]

        straight_flush_hand = PokerHand.new(straight_flush_cards)
        straight_flush_hand.score_hand

        expect(straight_flush_hand.score).to eq(11)


        royal_flush_cards = [double("card", value: "13", suite: "C"),
                             double("card", value: "14", suite: "C"),
                             double("card", value: "11", suite: "C"),
                             double("card", value: "12", suite: "C"),
                             double("card", value: "10", suite: "C")]

        royal_poker_hand = PokerHand.new(royal_flush_cards)
        royal_poker_hand.score_hand

        expect(royal_poker_hand.score).to eq(12)
      end
    end
  end
end
