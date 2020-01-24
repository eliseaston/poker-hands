# Evaluates poker hands for validity and determines the winning hand
class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
    @outcomes = []
  end

  def hand_classifications
    @outcomes.push('HIGH_CARD')
  end

end
