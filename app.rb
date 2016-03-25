require 'uri'
require 'open-uri'
require 'json'
require 'idobata'
#require 'pry'

Idobata.hook_url = ENV['IDOBATA_END']
gumroad_access_token = ENV["GUMROAD_ACCESS_TOKEN"]

target_url  = "https://api.gumroad.com/v2/products/?access_token="
base_url    = target_url + "#{gumroad_access_token}"

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)	#extract as json

prev_tsales	= total_sales							#storing previous var to diffrent var
total_sales = json['products'][0]['sales_count']	#looking for field and putting the value as var
tsales_diff = total_sales - prev_tsales				#subtacting the diffrence between old and new var

#if prev_tsales < total_sales
#	emoji = :naku
#end

Idobata::Message.create(source:"今日の売上は、¥" + total_sales +"円です！" + "前回の売上との差額は" + tsales_diff) 	#combing and making the sentence
