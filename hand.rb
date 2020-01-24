class Hand

  def initialize(cards)
    @cards = cards.split(" ")
    @values = []
  end

  def three_of_a_kind?
    threes = @values.select{ |value| @values.count(value) == 3 }.uniq
    threes.length > 0
  end

  def two_pair?
    pairs = @values.select{ |value| @values.count(value) == 2 }.uniq
    pairs.length == 2
  end

  def pair?
    pairs = @values.select{ |value| @values.count(value) == 2 }.uniq
    pairs.length == 1
  end

  def set_values
    @cards.each do |card|
      @values.push(card[0])
    end
  end

end
