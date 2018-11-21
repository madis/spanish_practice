#!/usr/bin/env ruby

class Numbers
  UP_TO_TEN = {
    1 => 'uno',
    2 => 'dos',
    3 => 'tres',
    4 => 'cuatro',
    5 => 'cinco',
    6 => 'seis',
    7 => 'siete',
    8 => 'ocho',
    9 => 'nueve',
    10 => 'diez'
  }

  TEENS = {
    11 => 'once',
    12 => 'doce',
    13 => 'trece',
    14 => 'catorce',
    15 => 'quince',
    16 => 'dieciséis',
    17 => 'diecisiete',
    18 => 'dieciocho',
    19 => 'diecinueve',
  }

  TWENTIES = {
    20 => 'veinte',
    21 => 'veintiuno',
    22 => 'veintidós',
    23 => 'veintitrés',
    24 => 'veinticuatro',
    25 => 'veinticinco',
    26 => 'veintiseis',
    27 => 'veintisiete',
    28 => 'veintiocho',
    29 => 'veintinueve'
  }

  TENS = {
    30 => 'treinta',
    40 => 'cuarenta',
    50 => 'cincuenta',
    60 => 'sesenta',
    70 => 'setenta',
    80 => 'ochenta',
    90 => 'noventa'
  }

  def to_words(number)
    if number <= 10
      UP_TO_TEN[number]
    elsif number.between?(11, 19)
      TEENS[number]
    elsif number.between?(20, 29)
      TWENTIES[number]
    elsif number > 30
      remaining = number % 10
      tens_part = number - remaining
      "#{TENS[tens_part]} y #{UP_TO_TEN[remaining]}"
    end
  end


  def self.play
    wordifier = Numbers.new
    loop do
      number = rand(100)
      puts "Cómo se dice #{number}?"
      actual_answer = gets.chomp
      expected_answer = wordifier.to_words(number)
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
