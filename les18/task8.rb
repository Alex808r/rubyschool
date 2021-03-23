require 'net/http'
require 'uri'

def is_wrong_password? password
uri = URI.parse 'http://localhost:4567/login'
response = Net::HTTP.post_form(uri, :login => "admin", :password => password).body
puts response.include? 'Wrong'
end

puts is_wrong_password? '123123'

