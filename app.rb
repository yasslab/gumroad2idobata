require 'open-uri'
require 'json'
require 'idobata'
#require 'omniauth-gumroad'

#use OmniAuth::Builder do
#    provider :gumroad, ENV['GUMROAD_APPLICATION_ID'], ENV['GUMROAD_APP_SECRET']
#end

Idobata.hook_url = ENV['IDOBATA_END']
#OmniAuthの使い方がわからないため、tokenを利用した
@gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']

@target_url = "https://api.gumroad.com/v2/products/?gumroad_access_token="
@base_url	= @target_url + "#{@gumroad_access_token}"

uri = open(@base_url)
data = test.read
json = JSON.parse(data)	#extract as json

total_sales = json['products'][0]['sales_count']	#looking for field and putting the value as var

Idobata::Message.create(source:"Total Sales:" + total_sales) 	#combing and making the sentence
#Problem
# => I need help in oauth
#IDEA
# => IF the total sales is equal from previous run; break? excep.?
