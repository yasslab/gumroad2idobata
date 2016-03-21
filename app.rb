require 'open-uri'
require 'json'
require 'idobata'
#require 'omniauth-gumroad'

#use OmniAuth::Builder do
#    provider :gumroad, ENV['GUMROAD_APPLICATION_ID'], ENV['GUMROAD_APP_SECRET']
#end

Idobata.hook_url = ENV['IDOBATA_END']
#OmniAuthの使い方がわからないため、tokenを利用した
gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']

uri = open('https://api.gumroad.com/v2/products/?gumroad_access_token')
data.uri.read