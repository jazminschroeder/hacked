class UserList
  def initialize
    @users = %w(John Jess Mario Robert Chris)
  end

  def reverse_names
    @users.each do |user|
      puts user.reverse
    end
  end

  def upcase_names
    @users.each do |user|
      puts user.upcase
    end
  end
end
user_list = UserList.new
user_list.reverse_names
user_list.upcase_names

#Using a block to refactor
class UserList
  def initialize
    @users = %w(John Jess Mario Robert Chris)
  end

  def each
    @users.each do |user|
      puts yield user
    end
  end
end
user_list = UserList.new
user_list.each {|user| user.reverse}
user_list.each {|user| user.upcase}