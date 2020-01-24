# Poker Hands

This program is a poker hand evaluator. It can be passed a selection of hands of cards (in the format of an array of strings), and evaluate each one to find the best scoring hand available for that set of cards.

## To run the program

Fork and clone this repository.<br>
In the command line, require the file `poker_hand_evaluator.rb` and create a new instance of the `PokerHandEvaluator` class, passing in an array of hands as the argument.<br>
Call the `.hand_classifications` on this instance and it will return the best scoring category for each hand, as an array.

```
Ellies-MacBook-Air:poker_hands ellieaston$ irb
2.6.0 :001 > require './poker_hand_evaluator.rb'
 => true
2.6.0 :002 >     TWO_PAIR = %w[8H 8S 4S 7D 7C].shuffle.join(' ')
 => "8H 8S 4S 7D 7C"
2.6.0 :003 >     FLUSH = %w[QD KD AD 3D 2D].shuffle.join(' ')
 => "2D 3D AD KD QD"
2.6.0 :004 >     FULL_HOUSE = %w[JC JS JD 6D 6H].shuffle.join(' ')
 => "JS 6D JC JD 6H"
2.6.0 :005 >     ROYAL_FLUSH = %w[AH KH QH JH 0H].shuffle.join(' ')
 => "JH QH 0H AH KH"
2.6.0 :006 > evaluator = PokerHandEvaluator.new([TWO_PAIR, FLUSH, FULL_HOUSE, ROYAL_FLUSH])
 => #<PokerHandEvaluator:0x00007ffa1b11b7b0 @hands=["8H 8S 4S 7D 7C", "2D 3D AD KD QD", "JS 6D JC JD 6H", "JH QH 0H AH KH"], @outcomes=[]>
 2.6.0 :007 > evaluator.hand_classifications
 => ["TWO_PAIR", "FLUSH", "FULL_HOUSE", "ROYAL_FLUSH"]
```

## To run the tests

Navigate to the directory in the command line and type `ruby ./poker_hand_evaluator_PART_1_test.rb` into the command line.

## Code structure

My program consists of two classes:<br>
* `PokerHandEvaluator`, which has one method, `.hand_classifications`
* `Hand`, which has multiple methods that are all called from the `.classify` method.

The `.hand_classifications` method in the `PokerHandEvaluator` class iterates through the array of hands it is passed on initialization, creates a new `Hand` object for each of them, and then calls the `.classify` method for each one. This returns a String outcome with the highest scoring category for each hand, which is added to the `PokerHandEvaluator`'s `@outcomes` attribute. Finally, the `PokerHandEvaluator` returns the `@outcomes` array with the full list of the highest scoring categories.

The `.classify` method in the `Hand` class first calls the `.set_values` and `set_suits` methods, which create a separate array for both the values and suits for the cards in the hand, and stores them both as instance properties. The `.classify` method then uses a switch statement to check the hand for each category, starting with the highest scoring one.

I decided to create the separate `Hand` class to decide the scoring category for each hand as it seemed a more cohesive and logical approach to me for the hand to decide its own scoring category.

## My approach

I used the existing test suite to strictly TDD my program. I followed the order of the tests rather than the order of highest scoring categories, because it seemed to me that the code needed to pass each of the tests in order increased in complexity. (i.e., I started by writing the `high_card?` method to pass the `it 'identifies HIGH_CARD hands'` test, then moved on to `one_pair`, `two_pair`, `three_of_a_kind`, `full_house` etc.) When all of the tests were passing in isolation and collectively, I reordered the switch statement to be in order of high scores, rather than in order of complexity.

I renamed some of the tests so that they were easier to call in isolation (i.e., `MULTIPLE_HANDS`, `NORMAL_FLUSH`, `NORMAL_STRAIGHT` etc.) I also added a new test (`HIGH_STRAIGHT`) in order to test my code for both low straight and high straight hands.

I did a git commit for every new passing test. When appropriate, I refactored after every passing test, in order to keep my code DRY.

I decided to create and call the `set_values` and `set_suits` methods before checking the hand against all possible categories to keep my code dry. I considered combining these into one `set_values_and_suits` method, but decided against it in the interest of SRP.

## Next steps

In my `Hand` `.classify` method, I initially wrote a long `if/else` statement, which I have refactored to a switch statement for readability. If I had more time, as a next step I would consider using polymorphism to create a new class/subclasses for scoring hand, and within the `.classify` method I could then iterate through these classes until the hand had been correctly identified.

I had a look at the extension challenges in part B. I feel relatively confident that I understand the logic and with more time that I could write the code for the additional validations around size of hand and repetition of cards etc. Minitest is a new test framework to me though, so I think I would need more time to write and implement error messages in the exact format required by the tests.
