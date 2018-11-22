require_relative '../lib/number_helper'

RSpec.describe NumberHelper do
  subject { described_class }

  it 'knows 0 - 10' do
    expect(subject.to_words(5)).to eq 'cinco'
    expect(subject.to_words(10)).to eq 'diez'
  end

  it 'knows 11 - 19' do
    expect(subject.to_words(18)).to eq 'dieciocho'
  end

  it 'knows 20 - 29' do
    expect(subject.to_words(22)).to eq 'veintidós'
  end

  it 'knows 30+' do
    expect(subject.to_words(44)).to eq 'cuarenta y cuatro'
  end
end
