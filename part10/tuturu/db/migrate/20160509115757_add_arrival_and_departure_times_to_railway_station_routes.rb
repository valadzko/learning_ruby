class AddArrivalAndDepartureTimesToRailwayStationRoutes < ActiveRecord::Migration
  def change
    add_column :railway_station_routes, :arrival_time, :datetime
    add_column :railway_station_routes, :departure_time, :datetime
  end
end
