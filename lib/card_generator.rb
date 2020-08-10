require_relative 'card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    File.readlines(filename).map do |line|
      question, answer, category = line.chomp.split(',')
      Card.new(question, answer, category)
    end
  end
end
