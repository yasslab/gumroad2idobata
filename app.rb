# -*- coding: utf-8 -*-

require 'open-uri'
require 'date'
require 'json'
require 'idobata'
#require 'pry'
require './art.rb'

Idobata.hook_url 	  = ENV['IDOBATA_END']
gumroad_access_token  = ENV['GUMROAD_ACCESS_TOKEN']


target_url  = "https://api.gumroad.com/v2/sales/?access_token="
base_url	= target_url + "#{gumroad_access_token}&before=#{Date.today}&after=#{Date.today - 1}"
#base_url	= target_url + "#{gumroad_access_token}&before=2016-4-10&after=2016-3-1"

i = 1  

<<<<<<< HEAD
if jsonCount['next_page_url'].nil? == false
  i = 1

  @jsonAll = JSON.parse(open(base_url + "&page=#{i}") { |io| data = io.read})
  while	@jsonAll['next_page_url'].nil? == false
    @jsonAll = JSON.parse(open(base_url + "&page=#{i}") { |io| data = io.read})
    i += 1
  end

  jsonFinalCount = JSON.parse(open(base_url+ "&page=#{i - 1}") { |io| data = io.read })
  total          = jsonFinalCount['sales'].size + ((i-2)*10)

  Idobata::Message.create(source:"設定された日付からの集計は #{total}")
else
  if jsonCount['next_page_url'].nil? == true  && jsonCount['sales'].size  > 0
    emoji_readable = []
    @body = uriage(jsonCount['sales'].size.to_s)
    emoji_readable  << @body

    Idobata::Message.create(source:"今日の購入数は " + "\n" + "#{emoji_readable*"\n"}")
  end
end
=======
json = JSON.parse(open(base_url){ |uri| data = uri.read })

if json['next_page_url'].nil? == false
	
  @each_json = JSON.parse(open(base_url + "&page=#{i}"){ |uri| data = uri.read})
    while  @each_json['next_page_url'].nil? == false 
      @each_json = JSON.parse(open(base_url + "&page=#{i}"){ |uri| data = uri.read})	
	  i += 1
    end

  last_json	= JSON.parse(open(base_url+ "&page=#{i - 1}"){ |uri| data = uri.read })
  rest_json = last_json['sales'].size + ((i-2)*10)

  Idobata::Message.create(source:"設定された日付からの集計は #{total}")

  else if json['next_page_url'].nil? == true  && json['sales'].size  > 0
    emoji_readable = []
	@body = uriage(jsonCount['sales'].size.to_s)
	emoji_readable  << @body

  Idobata::Message.create(source:"今日の購入数は " + "\n" + "#{emoji_readable*"\n"}")
  end

end
>>>>>>> c4d95dc... Fix variable name and spacing
