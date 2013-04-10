require 'rubygems'
require 'celluloid'
require 'benchmark'

class CelluloidTest
  def expensive_method
    sleep(5)
  end

  def future_expensive_method
    future = Celluloid::Future.new { expensive_method}
  end
end

celluloid = CelluloidTest.new
iterations = 10

Benchmark.bm do |x|
  x.report('normal')  {
    iterations.times do
      celluloid.expensive_method
    end
  }

  x.report('celluloid') {
    futures = Array.new
    iterations.times do
      futures << celluloid.future_expensive_method
    end
    futures.map{|future| future.value}
  }
end