# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# trains
tr1 = Train.new(number: "123")
tr2 = Train.new(number: "356")
tr3 = Train.new(number: "228")
# railway stations
rs1 = RailwayStation.new(title: "Gomel Station")
rs2 = RailwayStation.new(title: "Minsk Station")
rs3 = RailwayStation.new(title: "Bobruisk Station")
rs4 = RailwayStation.new(title: "Paris Station") # mmm
# routes
r1 = Route.new(name: "Gomel-Bobruisk-Minsk")
r2 = Route.new(name: "Minsk-Paris")
# users
user1 = User.new(username: "Tom") # (Gomel - Minsk), (Minsk - Paris)
user2 = User.new(username: "Jerry") # (Gomel - Minsk)
user3 = User.new(username: "Tim") # (Bobruisk - Minsk)
# tickets
ticket1 = Ticket.new(user: user1, train: tr3, first_station: rs2, last_station: rs4)
ticket2 = Ticket.new(user: user2, train: tr1, first_station: rs1, last_station: rs2)
ticket3 = Ticket.new(user: user3, train: tr1, first_station: rs3, last_station: rs2)
ticket4 = Ticket.new(user: user1, train: tr1, first_station: rs1, last_station: rs2)
# associations
tr1.route = r1
tr2.route = r1
tr3.route = r2

# save objects
tr1.save!
tr2.save!
tr3.save!

rs1.save!
rs2.save!
rs3.save!
rs4.save!

r1.save!
r2.save!

user1.save!
user2.save!
user3.save!

ticket1.save!
ticket2.save!
ticket3.save!
ticket4.save!
