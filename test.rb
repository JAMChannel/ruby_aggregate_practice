require 'json'

File.open("test.json") do |file|
  item = JSON.load(file)
end

