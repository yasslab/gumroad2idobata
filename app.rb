# -*- coding: utf-8 -*-
require 'open-uri'
require 'date'
require 'json'
require 'idobata'
#require 'pry'
require './art.rb'

class Gumroad
  def initialize(token)
    @base_url  = "https://api.gumroad.com"
    @token_url = "&access_token=#{token}"
    @start_page_url = "/v2/sales/?before=#{Date.today}&after=#{Date.today - 1}"
  end

  def sales_page_get(page_url)
    page_url ||= @start_page_url 
    target_url = @base_url  + page_url + @token_url
    JSON.parse(open(target_url).read)
  end
end

gumroad = Gumroad.new(ENV['GUMROAD_ACCESS_TOKEN'])
Idobata.hook_url = ENV['IDOBATA_LOCAL_END']

sales_data = {}  #example: {"success":true,"sales":[....],"next_page_url":[]}
sales_count = 0

loop do
  sales_data = gumroad.sales_page_get(sales_data['next_page_url'])
  sales_count += sales_data['sales'].size
  break if sales_data['next_page_url'].nil? 
end

Idobata::Message.create(source:"#{uriage(sales_count)}")