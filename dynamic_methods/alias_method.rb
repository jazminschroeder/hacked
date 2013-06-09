class Wall
  def initialize
    @posts = ['post1', 'post2']
  end

  def print_posts
    puts @posts.join('-')
  end
end

#Re-open class to change print_posts method
class Wall
  alias_method :old_print_posts, :print_posts

  def print_posts
    do_something_else
    old_print_posts
  end

  def do_something_else
    puts "Do something else"
  end
end

wall = Wall.new
wall.print_posts