require 'sqlite3'

db = SQLite3::Database.new 'tesr.sqlite'

db.execute "INSERT INTO tesr (name, price) VALUES ('Jaguar', 7777)"
db.close


db.execute "INSERT INTO BarberShop (name, price) VALUES ('Jaguar', 7777)"


INSERT INTO Users (name, phone, datastamp, barber, color) VALUES ('Mike', 7777, 06, 'Jack', 'Black');

INSERT INTO Contants (email, message) VALUES ('asdaf@dfadsf.ru', 'message here');
