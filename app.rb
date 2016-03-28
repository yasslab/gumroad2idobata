require 'uri'
require 'open-uri'
require 'json'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_END']
gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']
target_url  = "https://api.gumroad.com/v2/products/?access_token="
base_url    = target_url + "#{gumroad_access_token}"

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)    				#extract as json

prev_tsales = @total_sales_sum 			#storing previous var to diffrent var
total_sales = [] 						#make an array list to store each product's sales count
total_items = json['products'].length	#get the array value stored under products

#Loop each product array to get sales_count
total_items.times do |x|
	total_sales << json['products'][x]['sales_count']
end

@total_sales_sum = total_sales.inject(0, :+)  #add each array value and store as a sum

#Dealing with emoji's being sent 
emoji 		= ":moneybag:"
emoji_array = []

@total_sales_sum.times do |a|
    emoji_array << emoji
end

Idobata::Message.create(source:"#{emoji_array.join("")}")
