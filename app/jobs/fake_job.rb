class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "Before doing what I need to do"
    puts "Working..."
    sleep 1
    puts "Working..."
    sleep 1
    puts "Working..."
    sleep 1
    puts "Done doing what I need to do"
  end
end
