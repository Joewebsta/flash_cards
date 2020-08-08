require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    deck.cards.shift
  end

  def number_correct
    turns.reduce(0) do |count, turn|
      count += 1 if turn.correct?
      count
    end
  end

  def number_correct_by_category(category)
    turns.reduce(0) do |count, turn|
      count += 1 if turn.correct? && turn.card.category == category
      count
    end
  end

  def percent_correct
    number_correct.to_f / turns.count * 100
  end

  def percent_correct_by_category(category); end
end

card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
new_turn = round.take_turn('Juneau')
# p new_turn.class
# p new_turn.correct?
# p round.turns
# p round.number_correct
# p round.current_card
round.take_turn('Venus')
# p round.turns.count
# p round.turns.last.feedback
# p round.number_correct
# p round.number_correct_by_category(:STEM)
p round.percent_correct
