class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :RailwayStations
  has_many :Trains
end
