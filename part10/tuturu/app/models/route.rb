class Route < ActiveRecord::Base
  validates :name, presence: true
  has_many :railway_stations
  has_many :trains
end
