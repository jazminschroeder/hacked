require 'minitest/spec'
require 'minitest/autorun'
require_relative 'bowling_game'
require_relative 'frame'

describe 'BowlingGame' do
  before do
    @bowling = BowlingGame.new('John')
  end

  it 'starts game' do
    @bowling.name.must_equal 'John'
  end

  it 'counts played frames' do
    @bowling.rolls = [6,2,3]
    @bowling.played_frames.size.must_equal 2
  end

  it 'counts strike as played game' do
    @bowling.rolls = [10,2]
    @bowling.played_frames.size.must_equal 2
  end

  it 'counts total score' do
    @bowling.rolls = [9,0,3,1]
    @bowling.build_score_table
    @bowling.score.must_equal 13
  end

  it 'adds points from spares' do
    @bowling.rolls = [5,5,3]
    @bowling.build_score_table
    @bowling.score.must_equal 16
  end

  it 'adds poins for strikes' do
    @bowling.rolls = [10,2,2]
    @bowling.build_score_table
    @bowling.score.must_equal 18
  end

  it 'prints bowling score' do
    @bowling.rolls = [6, 2, 7, 1, 10, 9, 0, 8, 2, 10, 10, 3, 5, 7, 2, 5, 5, 8]
    @bowling.print_score_table
  end
end