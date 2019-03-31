require_relative '../lib/number_helper'

RSpec.describe NumberHelper do
  subject { described_class }

  TEST_DATA = {
    5 => 'cinco',
    10 => 'diez',
    18 => 'dieciocho',
    22 => 'veintidós',
    44 => 'cuarenta y cuatro',
    100 => 'cien',
    101 => 'ciento uno',
    129 => 'ciento veintinueve',
    195 => 'ciento noventa y cinco',
    201 => 'doscientos uno',
    202 => 'doscientos dos',
    220 => 'doscientos veinte',
    221 => 'doscientos veintiuno',
    225 => 'doscientos veinticinco',
    238 => 'doscientos treinta y ocho',
    1_000 => 'mil',
    1_001 => 'mil uno',
    1_500 => 'mil quinientos',
    1_686 => 'mil seiscientos ochenta y seis',
    2_001 => 'dos mil uno'

  }
  TEST_DATA.each do |number, expected|
    it "#{number} translates to #{expected}" do
      expect(subject.to_words(number)).to eq expected
    end
  end
end
