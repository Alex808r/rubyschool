# require 'net/http'
# response = Net::HTTP.get 'localhost:4567', '/login'
# puts response

# ����� ��� ���
require 'net/http'
require 'uri'

uri = URI.parse 'http://localhost:4567'
response = Net::HTTP.get uri
puts response