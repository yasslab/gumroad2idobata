require 'open-uri'
require 'date'
require 'json'
require 'idobata'
#require 'pry'
require './art.rb'

Idobata.hook_url      = ENV['IDOBATA_END']
gumroad_access_token  = ENV['GUMROAD_ACCESS_TOKEN']


base_url    = "https://api.gumroad.com/v2/sales/?access_token="
target_url  = base_url + "#{gumroad_access_token}&before=#{Date.today}&after=#{Date.today - 1}"
# target_url  = base_url + "#{gumroad_access_token}&before=2016-4-13&after=2016-1-1"
i = 1  

json = JSON.parse(open(target_url).read)
if json['next_page_url']
	
  @each_json = JSON.parse(open(target_url + "&page=#{i}").read)
    while  @each_json['next_page_url'] 
      @each_json = JSON.parse(open(target_url + "&page=#{i}").read)	
	  i += 1
    end

  last_json  = JSON.parse(open(target_url+ "&page=#{i - 1}").read)
  total  = last_json['sales'].size + ((i-2)*10)

  Idobata::Message.create(source:"設定された日付からの集計は #{total}")

elsif json['next_page_url'] == false  &&  json['sales'].size  > 0
  emoji_readable = []
  @body = uriage(json['sales'].size)
  emoji_readable  << @body

  Idobata::Message.create(source:"今日の購入数は " + "\n" + "#{emoji_readable*"\n"}")
  end
