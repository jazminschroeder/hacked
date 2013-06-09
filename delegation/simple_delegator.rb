class Women
  def best_seller
    'shoes'
  end
end

class Men
  def best_seller
    'tools'
  end
end

class Sales < SimpleDelegator
  def initialize
    @women = Women.new
    @men = Men.new
  end
end