require './lib/card'
require './lib/deck'
require './lib/round'

card1 = Card.new('What is 1 + 1?', '2', :math)
card2 = Card.new('What is 5 * 5?', '25', :math)
card3 = Card.new('What is 100 / 10?', '10', :math)
card4 = Card.new('What language is Ruby on Rails written in?', 'Ruby', :code)
card5 = Card.new('What does CSS stand for?', 'Cascading style sheets', :code)
card6 = Card.new('What does OOP stand for?', 'Object oriented programming', :code)
card7 = Card.new('What is the capital of MA?', 'Boston', :geography)

deck = Deck.new([card1, card2, card3, card4, card5, card6, card7])
round = Round.new(deck)

def start(round)
  display_welcome(round)

  round.tot_cards.times do
    display_card_info(round)
    display_current_question(round)
    user_guess = gets.chomp

    turn = round.take_turn(user_guess)
    display_turn_feedback(turn)
  end
end

def display_welcome(round)
  puts "Welcome! You're playing with #{round.tot_cards} cards."
  puts '-------------------------------------------------'
end

def display_card_info(round)
  puts
  puts "This is card number #{round.turn_num} out of #{round.tot_cards}."
end

def display_current_question(round)
  puts round.current_card.question
end

def display_turn_feedback(turn)
  puts turn.feedback
end

start(round)
