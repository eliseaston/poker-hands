# Evaluates poker hands for validity and determines the winning hand
require_relative 'hand'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @outcomes = []
  end

  def hand_classifications
    hand = Hand.new(@hands[0])
    @outcomes.push(hand.classify)
  end

end
