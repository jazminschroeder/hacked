describe 'Frame' do
  before do
    @frame = Frame.new
  end
  it 'ends after 2 rolls' do
    @frame.roll(2)
    @frame.roll(3)
    @frame.finished?.must_equal true
  end

  it 'tracks spares' do
    @frame.roll(5)
    @frame.roll(5)
    @frame.is_spare?.must_equal true
  end

  it 'tracks strikes' do
    @frame.roll(10)
    @frame.is_strike?.must_equal true
  end

  it 'tracks individual rolls' do
    @frame.roll(1)
    @frame.roll(2)
    @frame.first_roll.must_equal 1
    @frame.second_roll.must_equal 2
  end
end