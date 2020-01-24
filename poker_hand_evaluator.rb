# Evaluates poker hands for validity and determines the winning hand
require_relative 'hand'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @outcomes = []
  end

  def hand_classifications
    hand = Hand.new(@hands[0])
    if hand.two_pair?
      @outcomes.push('TWO_PAIR')
    elsif hand.pair?
      @outcomes.push('ONE_PAIR')
    else
      @outcomes.push('HIGH_CARD')
    end
  end

end
