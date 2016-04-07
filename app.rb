require 'uri'
require 'open-uri'
require 'json'
require 'idobata'
require './art'
require 'pry'

Idobata.hook_url	= ENV['IDOBATA_END']
#Idobata.hook_url	= ENV['IDOBATA_LOCAL_END']
gumroad_access_token	= ENV['GUMROAD_ACCESS_TOKEN']

target_url  = "https://api.gumroad.com/v2/products/?access_token="
base_url    = target_url + "#{gumroad_access_token}"

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)    		#extract as json

#get the number of products and for each sales store it under total_sales 
total_sales = json['products'].map do |x|
	x['sales_count']
end

@total_sales_sum = total_sales.inject(0, :+)  #add each value and store as a sum

#check if there are change in the sales

#Dealing with emoji's being sent 
emoji_array = @total_sales_diff.to_s.split(//)

#binding pry
emoji_array_count = emoji_array.length
emoji_readable = []
emoji_array_count.times do |x|
	@body = uriage(emoji_array.at(x))
	emoji_readable  << @body
	end
Idobata::Message.create(source:"#{emoji_readable}")

