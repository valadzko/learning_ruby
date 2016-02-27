class Train < ActiveRecord::Base
  belongs_to :route
  has_many :tickets
  has_many :wagons

  def wagons_by_type(wagon_type)
    wagons.where(class_type: wagon_type) if wagons.present?
  end

  def total_seats_number_by_wagon_type_and_seat_type(wagon_type, seat_type)
    number = 0
    filtered_wagons = wagons_by_type wagon_type
    if filtered_wagons.present?
      if (seat_type == :top_seats)
        filtered_wagons.each {|w| number += w.top_seats.to_i }
      elsif (seat_type == :bottom_seats)
        filtered_wagons.each {|w| number += w.bottom_seats.to_i }
      end
    end
    number
  end
end
