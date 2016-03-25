require 'uri'
require 'open-uri'
require 'json'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_END']
gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']

uri  = open(base_url)
data = uri.read
json = JSON.parse(data)    #extract as json