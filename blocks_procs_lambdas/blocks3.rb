class User
  attr_reader :friends, :interests
  def self.find(username)
    new
  end

  def initialize
    @friends = %w(Friend1 Friend2 Friend3 Friend4)
    @interests = %w(Interest1 Interest2 Interest3)
  end
end

def find_friends(username)
  user = User.find(username)
  user.friends
  rescue
    puts 'Do Something'
end

def find_interests(username)
  user = User.find(username)
  user.interests
  rescue
    puts 'DoSomething'
end

username = 'jazmin'
puts find_friends(username)
puts find_interests(username)

# Using Around Blocks
puts '============== Using Blocks'
def find(username)
  user = User.find(username)
  yield user
  rescue
    puts 'DoSomething'
end

find(username){ |user| puts user.friends }
find(username){ |user| puts user.interests}