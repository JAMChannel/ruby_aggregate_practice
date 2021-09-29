require "byebug"
require 'json'


class HighMotivationUserAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  # 実装してください
  def exec
    posts = []
    channel_names.each do |channel_name|
      count = load(channel_name)
      comment = count["messages"]
      comment = comment.count
      text = {:channel_name => channel_name,:message_count => comment }
      posts << text
    end

    three_count = posts.sort_by { |n| n[:message_count] }.reverse
    three_count.take(3)

  end

  def load(channel_name)
    dir = File.expand_path("../data/#{channel_name}", File.dirname(__FILE__))
    file = File.open(dir)
    JSON.load(file)
  end
end

