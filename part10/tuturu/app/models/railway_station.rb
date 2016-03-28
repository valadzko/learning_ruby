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
end
