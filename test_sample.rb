require 'test/unit'
require 'open-uri'
require 'json'


class TestSample < Test::Unit::TestCase
  def setup
    gumroad_access_token  = ENV['GUMROAD_ACCESS_TOKEN']
    base_url   = "https://api.gumroad.com/v2/sales/?access_token="
    @target_url = base_url + "#{gumroad_access_token}&before=2016-03-31&after=2016-01-01"
  end

  def test_gumroad_api
    sales = JSON.parse(open(@target_url).read)
    p sales
    
    assert_false sales['next_page_url'].nil?
  end
  
  def test_creating_hash
    emoji_string = Hash.new
    emoji_string[1] = ":cloud::moneybag::moneybag::moneybag::cloud::cloud:"
    
    assert_true emoji_string.class == Hash
  end

end
