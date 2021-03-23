require 'sqlite3'

db = SQLite3::Database.new 'tesr.sqlite'

db.execute "INSERT INTO tesr (name, price) VALUES ('Jaguar', 7777)"
db.close
