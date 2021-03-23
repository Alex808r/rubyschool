print 'Enter your password: '
password = gets.strip

input = File.open 'passwords.txt', 'r'

while (line = input.gets)
  line.strip!
  if password.include? line
    puts "Your password weak"
    exit
  end

  end

puts "Your password is not weak"

