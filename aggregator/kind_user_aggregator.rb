require "byebug"
require 'json'

class KindUserAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  # 実装してください
  def exec
    pc = []
    channel_names.each do |channel_name|
      count = load(channel_name)
      comment = count["messages"]
      react = comment.select{|n|n.include?("reactions")}  # 配列でreactionsを全部取得
      react.each do |r|
        a = r.dig("reactions") # reactionsの値をハッシュで取得
        a.each do |b|
          c = b.dig("users") # usersの値をハッシュで取得
          c.each do |d|
            pc << d          # 値をeachで個別にして配列に追加
          end
        end
      end
    end
    stamp = pc.group_by(&:itself).map{ |k, v| [k, v.count] }.to_h  #重複しているusersをカウントする
    stamp_sort = stamp.sort_by { |_, v| v }.reverse.to_h # valueを降順
    stamp_take = stamp_sort.first(3)   # 回答が配列での引き出しになっていたので配列で3つに絞る
    stamp_take.map { |n| "{:user_id=>#{n[0]}, :reaction_count=>#{n[1]}}," } # 配列を代入して回答の形を寄せる

  end

  def load(channel_name)
    dir = File.expand_path("../data/#{channel_name}", File.dirname(__FILE__))
    file = File.open(dir)
    JSON.load(file)
  end
end