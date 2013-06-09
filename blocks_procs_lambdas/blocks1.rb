def simple_block
  yield
end
simple_block { puts 'I am just a block'}

def triple_yield
  yield
  yield
  yield
end
triple_yield { puts 'I yield 3 times'}

def block_with_args
  yield 'args'
end
block_with_args {|arg| puts "The block gave me this: #{arg}"}

def with_my_name
  result = yield 'Jazmin'
  puts result
end
with_my_name {|name| name.upcase }

def with_args(name)
  yield name.upcase
end
with_args('jazmin'){|name| puts name}