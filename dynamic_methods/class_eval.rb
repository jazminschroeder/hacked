class User
end

User.class_eval do
  def self.new_method
    puts 'new method'
  end
end

User.new_method
