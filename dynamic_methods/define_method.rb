class Order
  STATUSES = [:in_progress, :shipped, :cancelled, :closed]
  attr_accessor :status

  STATUSES.each do |status|
    define_method "is_#{status}?" do
      self.status == status
    end
  end

  define_method(:each_status) do |&block|
    STATUSES.each(&block)
  end

  define_method(:print_label) do |text|
    puts "Receiving text: #{text}"
  end

end

order = Order.new
order.status = :closed
puts order.is_closed?

order.each_status{|status| puts "Status: #{status}" }
order.print_label('Ship to alaska')
