class RailwayStationRoute < ActiveRecord::Base
  belongs_to :route
  belongs_to :railway_station
end
