require 'open-uri'
require 'date'
require 'json'
require 'idobata'
require 'pry'

Idobata.hook_url	= ENV['IDOBATA_END']
Idobata.hook_url	= ENV['IDOBATA_LOCAL_END']
gumroad_access_token	= ENV['GUMROAD_ACCESS_TOKEN']

target_url  = "https://api.gumroad.com/v2/sales/?access_token="
base_url    = target_url + "#{gumroad_access_token}&before=#{Date.today}&after=#{Date.today - 1}" 

base_url    = target_url + "#{gumroad_access_token}&before=2016-3-31&after=2015-10-1" 

json = JSON.parse(open(base_url) { |io| data = io.read })
sale = json['sales'].inject(0){|sum, product| sum + product['price']}

Idobata::Message.create(source:"今日の購入数は#{json['sales'].size}")
