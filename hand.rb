class Hand

  VALUES = {
  "A" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "0" => 10,
  "J" => 11,
  "Q" => 12,
  "K" => 13
  }

  def initialize(cards)
    @cards = cards.split(" ")
    @values = []
    @suits = []
  end

  def classify
    set_values
    set_suits
    case
    when royal_flush?
      'ROYAL_FLUSH'
    when straight_flush?
      'STRAIGHT_FLUSH'
    when straight?
      'STRAIGHT'
    when flush?
      'FLUSH'
    when four_of_a_kind?
      'FOUR_OF_A_KIND'
    when full_house?
      'FULL_HOUSE'
    when three_of_a_kind?
      'THREE_OF_A_KIND'
    when two_pair?
      'TWO_PAIR'
    when pair?
      'ONE_PAIR'
    else
      'HIGH_CARD'
    end
  end

  def royal_flush?
    straight_flush? && @values.sum == 60
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    @values.sort!
    @values = [10, 11, 12, 13, 14] if @values == [1, 10, 11, 12, 13]
    @values.each_cons(2).all? { |a, b| a == b - 1}
  end

  def flush?
    @suits.uniq.length == 1
  end

  def four_of_a_kind?
    fours = @values.select{ |value| @values.count(value) == 4 }.uniq
    fours.length > 0
  end

  def full_house?
    three_of_a_kind? && pair?
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
      @values.push(VALUES[card[0]])
    end
  end

  def set_suits
    @cards.each do |card|
      @suits.push(card[1])
    end
  end

end
