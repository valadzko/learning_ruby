class RailwayStationRoute < ActiveRecord::Base
  belongs_to :route
  belongs_to :railway_station

  validates :railway_station_id, uniqueness: {scope: :route_id}
  validates :station_index_in_route, uniqueness: {scope: :route_id}, allow_nil: true

  default_scope { order(:station_index_in_route) }

end
