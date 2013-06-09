class BowlingGame
  attr_accessor :name, :rolls, :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def played_frames
    frames = []
    @rolls.each do |pins|
      frames << Frame.new if frames.empty? || frames.last.finished? || frames.last.is_strike?
      frames.last.roll(pins)
    end
    frames
  end

  def build_score_table
    @frames = played_frames
    @table_rows = []
    0.upto(@frames.size-1){ |n| @table_rows << score_frame(n) }
  end

  def print_score_table
    build_score_table
    puts "#{name} final score: #{@score}"
    puts "Frame | Roll1| Roll2 | Score"
    @table_rows.each {|row| printf("%3s %10s %10s %10s\n", *row) }
  end

  def score_frame(frame_number)
    frame = @frames[frame_number]
    if frame_number > 9
      ['*', frame.first_roll, nil, nil]
    else
      @score += frame.score
      if frame.is_strike?
        @score += @frames[frame_number+1].rolls[0]
        @score += @frames[frame_number+1].rolls[1] || @frames[frame_number+2].rolls[0]
      elsif frame.is_spare?
        @score += @frames[frame_number+1].rolls[0]
      end
      [frame_number+1, frame.first_roll, frame.second_roll, @score]
    end
  end
end