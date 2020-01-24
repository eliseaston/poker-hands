class Hand

  def initialize(cards)
    @cards = cards.split(" ")
  end

  def pair?
    values = []
    @cards.each do |card|
      values.push(card[0])
    end
    pairs = values.select{ |value| values.count(value) == 2 }.uniq
    pairs.length == 1
  end

end
