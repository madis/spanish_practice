class NumberHelper
  ZERO = 'cero'

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

  HUNDRED = 'cien'

  HUNDREDS = {
    100 => 'ciento',
    200 => 'doscientos',
    300 => 'trescientos',
    400 => 'quatrocientos',
    500 => 'quinientos',
    600 => 'seiscientos',
    700 => 'setecientos',
    800 => 'ochocientos',
    900 => 'novecientos'
  }

  THOUSAND = 'mil'

  def self.to_words(number, in_progress = [])
    if number == 0 && in_progress.empty?
      in_progress << ZERO
    elsif number.between?(1, 10)
      in_progress << UP_TO_TEN[number]
    elsif number.between?(11, 19)
      in_progress << TEENS[number]
    elsif number.between?(20, 29)
      in_progress << TWENTIES[number]
    elsif number.between?(30, 99)
      remaining = number % 10
      tens_part = number - remaining
      answer = "#{TENS[tens_part]}"
      answer <<  " y #{UP_TO_TEN[remaining]}" if remaining > 0
      in_progress << answer
    elsif number == 100
      in_progress << HUNDRED
    elsif number.between?(101, 999)
      reminder = number % 100
      exact_hundred = number - reminder
      to_words(reminder, in_progress << HUNDREDS[exact_hundred])
    elsif number.between?(1000, 9999)
      below_thousand = number % 1000
      nearest_thousand = number - below_thousand
      thousands = nearest_thousand / 1000
      if thousands == 1
        to_words(below_thousand, in_progress << "#{THOUSAND}")
      else
        to_words(below_thousand, in_progress << "#{UP_TO_TEN[thousands]} #{THOUSAND}")
      end
    else
      in_progress
    end

    in_progress.join(' ')
  end

end
