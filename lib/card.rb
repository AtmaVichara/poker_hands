class Card

  attr_reader :value, :suite

  def initialize(attrs)
    @value = set_values(attrs[0])
    @suite = attrs[1]
  end

  def set_values(value)
    substitute = {"A" => "14", "K" => "13", "Q" => "12", "J" => "11", "T" => "10"}
    substitute.has_key?(value) ? substitute[value] : value
  end

end
