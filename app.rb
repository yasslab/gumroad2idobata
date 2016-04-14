# -*- coding: utf-8 -*-
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

  def sales_data_getter(pager_url)
    page_url ||= @first_page_url  #same as .replace? ask @yasulab
    target_url = @base_url  + page_url + @token_url
    JSON.parse(open(target_url).read)
  end
end

gumroad = Gumroad.new(ENV['GUMROAD_ACCESS_TOKEN'])
Idobata.hook_url = ENV['IDOBATA_END']

sales_item_data = {} #{} => hash [] => array
sales_count = 0

loop do
  sales_item_data = gumroad.sales_data_getter(sales_item_data['next_page_url'])
  sales_count += sales_item_data['next_page_url'].size
  break if sales_item_data['next_page_url'].nil?
end

Idobata::Message.create(source:"#{uriage(sales_count)}")