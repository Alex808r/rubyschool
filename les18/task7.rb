require 'net/http'
require 'uri'

uri = URI.parse 'http://localhost:4567/login'
response = Net::HTTP.post_form(uri, :login => "aaa", :password => "bbb").body
#puts response
puts response.include? 'Wrong'