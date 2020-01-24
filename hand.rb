class Hand

  def initialize(cards)
    @cards = cards.split(" ")
    @values = []
    @suits = []
  end

  def classify
    set_values
    set_suits
    if straight?
      'STRAIGHT'
    elsif flush?
      'FLUSH'
    elsif four_of_a_kind?
      'FOUR_OF_A_KIND'
    elsif full_house?
      'FULL_HOUSE'
    elsif three_of_a_kind?
      'THREE_OF_A_KIND'
    elsif two_pair?
      'TWO_PAIR'
    elsif pair?
      'ONE_PAIR'
    else
      'HIGH_CARD'
    end
  end

  def straight?
    convert_values
    @values.sort!
    @values.each_cons(2).all? { |a, b| a == b - 1}
  end

  def flush?
    @suits.uniq.length == 1 ? true : false
  end

  def four_of_a_kind?
    fours = @values.select{ |value| @values.count(value) == 4 }.uniq
    fours.length > 0
  end

  def full_house?
    three_of_a_kind? && pair? ? true : false
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

  def set_suits
    @cards.each do |card|
      @suits.push(card[1])
    end
  end

  def convert_values
    @special_cards = ['0', 'J', 'Q', 'K', 'A']
    @special_values = {
      '0' => 10,
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 1
    }
    @values.map! do |value|
      @special_cards.include?(value) ? value = @special_values[value] : value.to_i
    end
  end

end
