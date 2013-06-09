class Configuration
  attr_accessor :username, :key

  def initialize(&block)
    yield self if block_given?
  end
end

configuration = Configuration.new do |config|
  config.username = 'username'
  config.key = 'key'
end
puts configuration.username