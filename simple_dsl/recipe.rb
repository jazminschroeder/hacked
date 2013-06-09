class Recipe
  def initialize(name, &block)
    @name = name
    @recipe = {}
    self.instance_eval(&block)
  end

  def ingredients(ingredients)
    @recipe[:ingredients] = ingredients
  end

  def preparation(preparation)
    @recipe[:preparation] = preparation
  end

  def time(time)
    @recipe[:time] = time
  end

  def share
    recipe = <<-EOF
      Let's make #{@name}!
      ingredients: - #{@recipe[:ingredients]}
      preparation: - #{@recipe[:preparation]}
      time: - #{@recipe[:time]}
    EOF
    recipe
  end
end

pancakes = Recipe.new('pancakes') do
  ingredients 'ingredients'
  preparation 'preparation'
  time 'time'
end

puts pancakes.share