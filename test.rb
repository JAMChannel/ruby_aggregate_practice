# require 'json'

# File.open("test.json") do |file|
#   item = JSON.load(file)
# end


# File.open("test.json", "w") do |file|
#   # json = {taro: {name: "Taro", age: 25, height: 175}}
#   # str = JSON.dump(json, file)
#   hash = { taro: { name: 'Taro', age: 25, height: 175 } }, { ami: { name: 'Ami', age: 23, height: 165 } }
#   str = JSON.dump(hash, file)
#   puts str
#   # またコード内にある下記コードは、ハッシュ（コード内でいうjson）をJSON文字列に変換するために必要です。
#   # arranged_str = JSON.pretty_generate(hash)
#   # JSONに改行やインデントを入れて、見やすい形に整形
#   # puts arranged_str
# end

# require 'json'

# File.open('test.json') do |f|
#   hash = JSON.load(f)
#   puts hash
# end

# File.open('test.json', 'w') do |file|
#     hash = { taro: { name: 'Taro', age: 25, height: 175 } }, { ami: { name: 'Ami', age: 23, height: 165 } }
#     puts hash
#     str = JSON.dump(hash, file)
#     puts str
#     arranged_str = JSON.pretty_generate(str)
#     puts arranged_str
# end

# require 'json'

# File.open('test.json') do |f| 
#   array = JSON.load(f) array.each do |hash| 
#     user_id = hash['userId'] 
#     title = hash['title'] 
#     body = hash['body'] 
#     puts "ユーザー#{user_id}の記事は、タイトル：#{title} / 内容：#{body}です。" 
#   end 
# end

# require 'uri'
# require 'net/http'
# require 'json'

# Uri = 'https://jsonplaceholder.typicode.com/posts'


# JSON形式で取得
# results = Net::HTTP.get(URI.parse(Uri))

# # JSON形式をRubyで扱えるように変換
# results_hash = JSON.parse(results)

# results_hash.each do |hash|
#   user_id = hash['userId']
#   title = hash['title']
#   body = hash['body']

#   if user_id == 1
#         puts "ユーザーID：#{user_id}"
#         puts "タイトル：#{title}"
#         puts "内容：#{body}"
#     end
# end

require "json"
# File.open("test.json") do |file| # ファイル開いて読み込みモードへ
#   hash = JSON.load(file)
#   p hash
# end
# File.open("test.json", 'w') do |file| # ファイルを開いて書き出しモードへ
#   # str = JSON.dump({"id"=>1, "first_name"=>"Taro", "last_name"=>"Suzuki", "age"=>25} , file)
# end

File.open('test.json') do |f|
  hash = JSON.load(f)
  puts hash["first_name"]
  # hash = JSON.parse(f)
  # puts hash["first_name"]
end



# puts File.open('test.json')

# f = ["test.json"]

# hash = JSON.parse('
#   File.open('test.json')do |f|
#   hash = JSON.load(f)
#   puts hash["first_name"]
# end
#   ')
# puts hash["first_name"]
