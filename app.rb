require 'uri'
require 'open-uri'
require 'json'
require 'idobata'
require './art'
require 'pry'

Idobata.hook_url	= ENV['IDOBATA_END']
Idobata.hook_url	= ENV['IDOBATA_LOCAL_END']
gumroad_access_token	= ENV['GUMROAD_ACCESS_TOKEN']

target_url  = "https://api.gumroad.com/v2/products/?access_token="
base_url    = target_url + "#{gumroad_access_token}"

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)    		#extract as json

#get the number of products and sum each sales under total_sales_sum
@total_sales_sum = json['products'].inject(0){|sum, product| sum + product['sales_count']}

Idobata::Message.create(source:"今日の購入数は#{@total_sales_sum}")
