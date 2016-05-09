class RailwayStation < ActiveRecord::Base
  has_many :routes, through: :railway_station_routes
  has_many :railway_station_routes

  def index_in_route(route)
    self.railway_station_routes.where(route: route).first.station_index_in_route
  end

  def set_index_in_route(index, route)
    rsr = self.railway_station_routes.where(route: route).first
    rsr.station_index_in_route = index
    rsr.save!
  end

  def set_arrivale_time(time, route)
    rsr = self.railway_station_routes.where(route: route).first
    rsr.arrival_time = time
    rsr.save!
  end

  def set_departure_time(time, route)
    rsr = self.railway_station_routes.where(route: route).first
    rsr.departure_time = time
    rsr.save!
  end

  def arrival_time(route)
    puts "Your arrival_date from db: #{self.railway_station_routes.where(route: route).first.arrival_time}"
    self.railway_station_routes.where(route: route).first.arrival_time
  end

  def departure_time(route)
    self.railway_station_routes.where(route: route).first.departure_time
  end


end
