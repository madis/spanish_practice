class RandomInRangeGenerator
  GROUPS = {
    0..99 => 4,
    100..999 => 2,
    1000..1999 => 1,
    2000..9999 => 1
  }

  def initialize
    @round = []
  end

  def next
    @round = generate_next_round if @round.empty?
    consume_next(@round)
  end

  private

  def generate_next_round
    GROUPS.flat_map { |range, count| count.times.map { rand(range) } }.reverse
  end

  def consume_next(numbers)
    numbers.pop
  end
end

