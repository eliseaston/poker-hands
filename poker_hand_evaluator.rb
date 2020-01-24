# Evaluates poker hands for validity and determines the winning hand
require_relative 'hand'

class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @outcomes = []
  end

  def hand_classifications
    @hands.each do |hand|
      @outcomes.push(Hand.new(hand).classify)
    end
    @outcomes
  end

end
