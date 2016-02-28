class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations, through: :railway_station_routes
  has_many :railway_station_routes

  validates :name, presence: true
end
