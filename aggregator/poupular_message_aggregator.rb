require "byebug"
require 'json'

class PopularMessageAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  # 実装してください
  def exec
    pc = []
    channel_names.each do |channel_name|
      user_count = load(channel_name)
      comment = user_count["messages"]
      react = comment.select{|n|n.include?("reactions")} 
      react.each do |r|
        a = r.dig("reactions")
        stamp = a.inject(0) {|sum, hash| sum + hash["count"]}
        text_slack = r.dig("text")
        pc << [text_slack,stamp]
      end

    end
    pc__sort = pc.sort_by { |_, v| v }.reverse.to_h
    stamp_take = pc__sort.first(1)
    stamp_take.map { |n| "{:text=>#{n[0]}, :reaction_count=>#{n[1]}}," } 
  end

  def load(channel_name)
    dir = File.expand_path("../data/#{channel_name}", File.dirname(__FILE__))
    file = File.open(dir)
    JSON.load(file)
  end
end