require 'sinatra'

get '/' do
  erb :index
end

post '/' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = "Thank you"
  @message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}."

  f = File.open 'users.txt', 'a' # сохранение в файл, путем дописывания в конец списка
  f.write "User: #{@user_name}, Phone #{@phone}, date #{@date_time}.\n"
  f.close
  erb :message
end

get '/result' do
  send_file 'users.txt'
end

get '/admin' do
  @logfile = File.open('users.txt', 'r')
  erb :admin
end

get '/admin1' do
  @logfile = File.open('users.txt', 'r')
  erb :admin1
end

get '/panel' do
  erb :panel
 end

post '/panel' do
  @login = params[:aaa]
  @password = params[:bbb]

  if @login == 'admin' && @password == 'secret'
    @logfile = File.open('users.txt', 'r')
    erb :admin
  else
    @report = '<p> Access denied!</p>'
    erb :panel
  end
end

post '/admin' do
  "Hello World"
  @logfile = File.open('users.txt', 'r')
  erb :admin
end
