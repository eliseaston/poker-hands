# Poker Hands

This program is a poker hand evaluator. It can be passed a selection of hands of cards (in the format of an array of strings), and evaluate each one to find the best scoring hand available for that set of cards.

## To run the program

Fork and clone this repository.<br>
In the command line, type `ruby poker_hands.rb "ARGUMENT"`, passing in a string of cards to represent a hand, e.g. `ruby poker_hands.rb "AD JD QD KD 0D"`<br>
You can also chain together multiple hands, e.g. `ruby poker_hands.rb "AD JD QD KD 0D" "3C 4C 9C JC 0H"`

```
Ellies-MacBook-Air:poker_hands ellieaston$ ruby poker_hands.rb "AD JD QD KD 0D"
 => ROYAL_FLUSH
Ellies-MacBook-Air:poker_hands ellieaston$ ruby poker_hands.rb "AD JD QD KD 0D" "3C 4C 9C JC 0H"
 => ROYAL_FLUSH
 => HIGH_CARD
```

## To run the tests

Navigate to the directory in the command line and type `ruby ./poker_hand_evaluator_PART_1_test.rb` into the command line.

## Code structure

My program consists of two classes:<br>
* `PokerHandEvaluator`, which has one method, `.hand_classifications`
* `Hand`, which has multiple methods that are all called from the `.classify` method.

The `.hand_classifications` method in the `PokerHandEvaluator` class iterates through the array of hands it is passed on initialization, creates a new `Hand` object for each of them, and then calls the `.classify` method for each one. This returns a String outcome with the highest scoring category for each hand, which is added to the `PokerHandEvaluator`'s `@outcomes` instance variable. Finally, the `PokerHandEvaluator` returns the `@outcomes` array with the full list of the highest scoring categories.

The `.classify` method in the `Hand` class first calls the `.set_values` and `.set_suits` methods, which create a separate array for both the values and suits for the cards in the hand, and stores them both as instance variables. The `.classify` method then uses a switch statement to check the hand for each category, starting with the highest scoring one.

I decided to create the separate `Hand` class to decide the scoring category for each hand because it seemed a more cohesive and logical to me for the hand to decide its own scoring category.

## My approach

I used the existing test suite to strictly TDD my program. I followed the order of the tests rather than the order of highest scoring categories, because it seemed to me that the code needed to pass each of the tests in order increased in complexity. (i.e., I started by writing the `high_card?` method to pass the `it 'identifies HIGH_CARD hands'` test, then moved on to `one_pair`, `two_pair`, `three_of_a_kind`, `full_house` etc.) When all of the tests were passing in isolation and collectively, I reordered the switch statement to be in order of high scores, rather than in order of complexity.

I renamed some of the tests so that they were easier to call in isolation (i.e., `MULTIPLE_HANDS`, `NORMAL_FLUSH`, `NORMAL_STRAIGHT` etc.) I also added a new test (`HIGH_STRAIGHT`) in order to test my code for both low straight and high straight hands.

I did a git commit after every new passing test. When appropriate, I refactored after every passing test, in order to keep my code DRY.

I decided to create and call the `set_values` and `set_suits` methods before checking the hand against all possible categories to keep my code DRY. I did consider combining these into one `set_values_and_suits` method, but I decided against it in the interest of SRP.

## Next steps

In my `Hand` `.classify` method, I initially wrote a long `if/else` statement, which I have refactored to a switch statement for readability. If I had more time, as a next step I would consider using polymorphism to create a new class/subclasses for each type of scoring hand. Within the `.classify` method I could then iterate through these classes until the hand had been correctly identified.

I had a look at the extension challenges in part B. I feel relatively confident that I understand the logic, and that with more time I could write the code for the additional validations around size of hand and repetition of cards etc. However, Minitest is a new test framework to me, so I think I would need more time to write and implement error messages in the exact format required by the tests.
