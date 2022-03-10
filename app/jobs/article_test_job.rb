class ArticleTestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Hello"
    # Do something later
  end
end
