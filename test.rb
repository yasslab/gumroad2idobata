require 'test/unit'
require 'open-uri'
require 'json'
require 'date'

class Gumroad2IdobataTest
  
  def setup
    gumroad_access_token  = ENV['GUMROAD_ACCESS_TOKEN']
    base_url   = "https://api.gumroad.com/v2/sales/?access_token="
    @target_url = base_url + "#{gumroad_access_token}&before=#{Date.today}&after=#{Date.today - 1}"
  end

  def sale_get(page_url)
    sales = JSON.parse(open(@target_url + page_url).read)
  end

end
sales_data = {}  
sales_count = 0

loop do
  sales_data = sale_get(sales_data['next_page_url'])
  sales_count += sales_data['sales'].size
  break if sales_data['next_page_url'].nil?

end

puts sales_count