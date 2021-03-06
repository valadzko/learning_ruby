# trains
tr1 = Train.new(number: "123")
tr2 = Train.new(number: "356")
tr3 = Train.new(number: "228")
# railway stations
rs1 = RailwayStation.new(title: "Gomel")
rs2 = RailwayStation.new(title: "Minsk")
rs3 = RailwayStation.new(title: "Bobruisk")
rs4 = RailwayStation.new(title: "Paris") # mmm
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
#wagons and seats for tr1
(1..7).each do |wagon_index|
  if wagon_index < 5
    # create 4 coupe wagons
    CoupeWagon.create(train: tr1, top_seats: 37, bottom_seats: 37)
  else
    # create 3 economy wagon
    EconomyWagon.create(train: tr1, top_seats: 20, bottom_seats: 20, side_top_seats: 20, side_bottom_seats: 20)
  end
end
#wagons and seats for tr2
(1..4).each do |wagon_index|
  if wagon_index < 3
    # create 2 LuxuryWagon
    LuxuryWagon.create(train: tr2, bottom_seats: 37)
  else
    # create 2 SittingWagon
    SittingWagon.create(train: tr2, regular_seats: 37)
  end
end
#wagons and seats for tr3
(1..5).each {|x| LuxuryWagon.create(train: tr3, bottom_seats: 50)}

# associations
r1.railway_stations = [rs1, rs3, rs2]
r2.railway_stations = [rs2, rs4]

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

# set station indexes in routes
rs1.set_index_in_route(1,r1)
rs3.set_index_in_route(5,r1)
rs2.set_index_in_route(3,r1)

rs2.set_index_in_route(1,r2)
rs4.set_index_in_route(2,r2)
