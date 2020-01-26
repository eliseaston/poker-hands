require_relative 'poker_hand_evaluator'

return unless ARGV.any?
evaluator = PokerHandEvaluator.new(ARGV)
puts evaluator.hand_classifications
