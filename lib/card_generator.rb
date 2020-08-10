require_relative 'card'

cards_file = File.open('cards.txt', 'r')
cards_file.each do |line|
  question, answer, category = line.chomp.split(',')
  card = Card.new(question, answer, category)
  p card
end
