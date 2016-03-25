require 'uri'
require 'open-uri'
require 'json'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_END']
gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)    #extract as json

prev_tsales    = @total_sales                        #storing previous var to diffrent var
@total_sales = json['products'][0]['sales_count']    #looking for field and putting the value as var