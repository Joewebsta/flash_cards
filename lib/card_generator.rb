require_relative 'card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def open_file; end

  def cards
    cards_file = File.open(filename, 'r')
    cards = cards_file.map do |line|
      question, answer, category = line.chomp.split(',')
      Card.new(question, answer, category.to_sym)
    end
    cards
  end
end
