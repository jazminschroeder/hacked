#Using struct instead of a class
Dog = Struct.new(:name, :age)
max = Dog.new('Max', 4)
puts max.age

#Adding methods to a struct
Cat = Struct.new(:name, :age) do
  def formatted_name
    "My name is #{name}"
  end
end
aria = Cat.new('Aria', 1)
puts aria.formatted_name