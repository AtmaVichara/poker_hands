require "rspec"
require "./lib/card"

describe "Card Spec" do
  describe "Attributes" do
    it "should have a valuea and suite" do
      card = Card.new("2C")
      expect(card.value).to eq("2")
      expect(card.suite).to eq("C")

      new_card = Card.new("AA")
      expect(new_card.value).to eq("14")
      expect(new_card.suite).to eq("A")
    end
  end
end
