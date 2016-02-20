class Train < ActiveRecord::Base
  has_one :Route
  has_many :Tickets
end
