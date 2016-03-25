require 'uri'
require 'open-uri'
require 'json'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_END']
gumroad_access_token = ENV['GUMROAD_ACCESS_TOKEN']

