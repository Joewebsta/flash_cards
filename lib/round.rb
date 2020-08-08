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
    (number_correct / turns.count.to_f * 100).round(2)
  end

  def percent_correct_by_category(category)
    total_cards_by_category = turns.reduce(0) do |count, turn|
      count += 1 if turn.card.category == category
      count
    end

    (number_correct_by_category(category) / total_cards_by_category.to_f * 100).round(2)
  end
end
