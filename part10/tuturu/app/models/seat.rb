class Seat < ActiveRecord::Base
  belongs_to :wagon
  belongs_to :ticket

  validates :seat_number, presence: true
  validates :seat_type, presence: true, inclusion: { in: %w(top bottom) }
end
