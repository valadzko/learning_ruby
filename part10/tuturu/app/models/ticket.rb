class Ticket < ActiveRecord::Base
  belongs_to :user
  has_one :train
  has_one :first_station class_name: :RailwayStation
  has_one :last_station class_name: :RailwayStation
end
