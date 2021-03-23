require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def init_DB
  @DB = SQLite3::Database.new 'leprosorium.db'
  @DB.results_as_hash = true
end

before do
  init_DB
end

configure do
  init_DB
  @DB.execute 'CREATE TABLE IF NOT EXISTS Posts
              (
                id integer PRIMARY KEY AUTOINCREMENT,
                created_date date,
                content text
               )'
  @DB.execute 'CREATE TABLE IF NOT EXISTS Comments
              (
                id integer PRIMARY KEY AUTOINCREMENT,
                created_date date,
                content text
                post_id integer
               )'

end

get '/' do
  @results = @DB.execute 'select * from Posts order by id desc'
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  content = params[:content]

  if content.length <= 0
  @error = 'Type post text'
   return erb :new
  end

  @DB.execute 'insert into Posts (content, created_date) values (?, datetime());', [content]

  redirect to '/'
    #erb "You typed: #{content}"
end

get '/details/:post_id' do
  post_id = params[:post_id]

  results = @DB.execute 'select * from Posts where id = ?', [post_id]
  @row = results[0]

  @comments = @DB.execute 'select * from Comments where post_id = ? order by id', [post_id]

  erb :details

end

post '/details/:post_id' do
  post_id = params[:post_id]
  content = params[:content]

  @DB.execute 'insert into Comments (content, created_date, post_id) values (?, datetime(), ?);', [content, post_id]

  redirect to ('/details/' + post_id)
    # erb "cooment #{content} post id #{post_id}"
end