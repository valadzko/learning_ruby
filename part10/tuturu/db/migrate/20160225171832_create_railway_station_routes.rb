class CreateRailwayStationRoutes < ActiveRecord::Migration
  def change
    create_table :railway_station_routes do |t|
      t.belongs_to :route, index: true
      t.belongs_to :railway_station, index: true
      t.timestamps null: false
    end
  end
end
