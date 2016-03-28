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
json = JSON.parse(data)    #extract as json

prev_tsales    = @total_sales                        #storing previous var to diffrent var
@total_sales = json['products'][0]['sales_count']    #looking for field and putting the value as var

emoji = ":moneybag:"
emoji_array = []
@total_sales.times do |x|
    emoji_array << emoji
end

Idobata::Message.create(source:"#{emoji_array.join("")}")