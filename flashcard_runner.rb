require './lib/card'
require './lib/deck'

card1 = Card.new('What is 1 + 1?', 2, :math)
card2 = Card.new('What is 5 * 5?', 25, :math)
card3 = Card.new('What is 100 / 10?', 10, :math)
card4 = Card.new('What language is Ruby on Rails written in?', 'Ruby', :code)
card5 = Card.new('What does CSS stand for?', 'Cascading style sheets', :code)
card6 = Card.new('What does OOP stand for?', 'Object oriented programming', :code)
card7 = Card.new('What is the capital of MA?', 'Boston', :geography)
deck = Deck.new([card1, card2, card3, card4, card5, card6, card7])
