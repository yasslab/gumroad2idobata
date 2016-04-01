require 'uri'
require 'open-uri'
require 'json'
require 'idobata'
require './art'

Idobata.hook_url 	 = ENV['IDOBATA_END']
gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']

target_url  = "https://api.gumroad.com/v2/products/?access_token="
base_url    = target_url + "#{gumroad_access_token}"

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)    				#extract as json

prev_tsales = @total_sales_sum 			#storing previous var to diffrent var
total_items = json['products'].length	#get the array value stored under products
total_sales = [] 						#make an array list to store each product's sales count

#Loop each product array to get sales_count
total_items.times do |x|
	total_sales << json['products'][x]['sales_count']
end

@total_sales_sum = total_sales.inject(0, :+)  #add each array value and store as a sum

#Dealing with emoji's being sent 
emoji_array = @total_sales_sum.to_s.split(//)
emoji_array_count = emoji_array.length

emoji_readable = []

emoji_array_count.times do |x|
    uriage(emoji_array.at(x))
    emoji_readable << @body
end

Idobata::Message.create(source:"#{emoji_readable * "\n"}")