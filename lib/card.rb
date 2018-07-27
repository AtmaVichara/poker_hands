class Card

  attr_reader :value, :suite

  def initialize(attrs)
    @value = attrs[0]
    @suite = attrs[1]
  end

end
