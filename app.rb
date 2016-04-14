require 'open-uri'
require 'date'
require 'json'
require 'idobata'
require 'pry'
require './art.rb'


class Gumroad
  def initialize(token)
    @base_url  = "https://api.gumroad.com"
    @token_url = "&access_token=#{token}"
    @start_page_url = "/v2/sales/?before=#{Date.today}&after=#{Date.today - 1}"
  end


def sold_item_getter(i)
  @item_list = JSON.parse(open(@target_url + "&page=#{i}").read)
end
binding
if sold_item_getter(1)
	    while  @item_list['next_page_url'] 
      @item_list = JSON.parse(open(@target_url + "&page=#{i}").read)	
	  i += 1
    end

  last_json  = JSON.parse(open(@target_url+ "&page=#{i - 1}").read)
  total  = last_json['sales'].size + ((i-2)*10)

  Idobata::Message.create(source:"設定された日付からの集計は #{total}")

elsif json['next_page_url'] == false  &&  json['sales'].size  > 0
  emoji_readable = []
  @body = uriage(json['sales'].size)
  emoji_readable  << @body

  Idobata::Message.create(source:"今日の購入数は " + "\n" + "#{emoji_readable*"\n"}")
  end
