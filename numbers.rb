#!/usr/bin/env ruby
require_relative './lib/number_helper'
require_relative './lib/random_in_range_generator'

class Numbers
  class WordToNumber
    def initialize(number)
      @number = number
    end

    def question
      "¿Qué numero es: #{NumberHelper.to_words(@number)}?"
    end

    def answer
      @number.to_s
    end
  end

  class NumberToWord
    def initialize(number)
      @number = number
    end

    def question
      "¿Cómo se dice: #{@number}?"
    end

    def answer
      NumberHelper.to_words(@number)
    end
  end

  def self.play
    wordifier = NumberHelper.new
    numbers_source = RandomInRangeGenerator.new

    loop do
      number = numbers_source.next
      game = [NumberToWord, WordToNumber].sample.new(number)

      print game.question + " "
      actual_answer = gets.chomp
      expected_answer = game.answer

      if actual_answer.downcase == expected_answer.downcase
        `afplay /System/Library/Sounds/Tink.aiff`
        puts "¡Correcto!"
      else
        `afplay /System/Library/Sounds/Basso.aiff`
        puts "¡Incorrecto! Es #{expected_answer}"
      end
      `say -v Monica #{expected_answer}`
    end
  end
end

if __FILE__ == $0
  Numbers.play
end
