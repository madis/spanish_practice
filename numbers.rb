#!/usr/bin/env ruby
require_relative './lib/number_helper'

class Numbers
  class WordToNumber
    def initialize(number)
      @number = number
    end

    def question
      "¿Qué numero es #{NumberHelper.to_words(@number)}?"
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
      "¿Cómo se dice #{@number}?"
    end

    def answer
      NumberHelper.to_words(@number)
    end
  end

  def self.play
    wordifier = NumberHelper.new
    loop do
      number = rand(100)
      game = [NumberToWord, WordToNumber].sample.new(number)

      print game.question + " "
      actual_answer = gets.chomp
      expected_answer = game.answer

      if actual_answer == expected_answer
        puts "Correcto!"
      else
        puts "Incorrecto! Es #{expected_answer}"
      end
      `say -v Monica #{expected_answer}`
    end
  end
end

if __FILE__ == $0
  Numbers.play
end
