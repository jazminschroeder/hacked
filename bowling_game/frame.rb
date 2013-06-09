class Frame
  attr_accessor :rolls, :score

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def finished?
    @rolls.size == 2
  end

  def score
    @rolls.reduce(:+)
  end

  def is_spare?
    score == 10 && !is_strike?
  end

  def is_strike?
    @rolls.first == 10
  end

  def first_roll
    pins = @rolls[0]
    return '-' if pins == 0
    return 'X' if pins == 10
    pins
  end

  def second_roll
    pins = @rolls[1]
    return '-' if pins == 0
    return '/' if is_spare?
    pins
  end
end