class Dog
  def do_trick(trick)
    puts "trick #{trick}"
  end
end

class MethodLogger
  def log(class_name, method_name)
    class_name.class_eval do
      alias_method :original_method, method_name
      define_method method_name do |*args|
        puts 'Call to method'
        send :original_method, *args

      end
    end
  end
end

logger = MethodLogger.new
logger.log(Dog, :do_trick)

dog = Dog.new.do_trick('talk')


