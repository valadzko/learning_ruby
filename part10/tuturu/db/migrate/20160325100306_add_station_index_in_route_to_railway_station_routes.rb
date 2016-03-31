class AddStationIndexInRouteToRailwayStationRoutes < ActiveRecord::Migration
  def change
    add_column :railway_station_routes, :station_index_in_route, :integer
  end
end
