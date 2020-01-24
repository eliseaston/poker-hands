# Evaluates poker hands for validity and determines the winning hand
require_relative 'hand'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @outcomes = []
  end

  def hand_classifications
    hand = Hand.new(@hands[0])
    hand.set_values
    if hand.three_of_a_kind?
      @outcomes.push('THREE_OF_A_KIND')
    elsif hand.two_pair?
      @outcomes.push('TWO_PAIR')
    elsif hand.pair?
      @outcomes.push('ONE_PAIR')
    else
      @outcomes.push('HIGH_CARD')
    end
  end

end
