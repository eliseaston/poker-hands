# Evaluates poker hands for validity and determines the winning hand
class PokerHandEvaluator

  def initialize(hands)
    @hands = hands
  end

  def hand_classifications
    ['HIGH_CARD']
  end

end
