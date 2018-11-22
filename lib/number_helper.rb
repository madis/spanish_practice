class NumberHelper
  UP_TO_TEN = {
    0 => 'cero',
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

  def self.to_words(number)
    if number <= 10
      UP_TO_TEN[number]
    elsif number.between?(11, 19)
      TEENS[number]
    elsif number.between?(20, 29)
      TWENTIES[number]
    elsif number >= 30
      remaining = number % 10
      tens_part = number - remaining

      answer = "#{TENS[tens_part]}"
      answer <<  " y #{UP_TO_TEN[remaining]}" if remaining > 0
      answer
    end
  end

end
