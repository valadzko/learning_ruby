class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations, through: :railway_station_routes
  has_many :railway_station_routes

  validates :name, presence: true

  def update_stations_order(order)
    puts "In the route update_stations_order!!!"
    order.each do |station_id, new_index|
      station = railway_stations.where(id: station_id).first
      station.set_index_in_route(new_index, self)
    end
  end

  def update_times(arrival_times, departure_times)
    arrival_times.each do |station_id, t|
      station = railway_stations.where(id: station_id).first
      station.set_arrivale_time(Time.new(t['date(1i)'], t['date(2i)'], t['date(3i)'], t['date(4i)'], t['date(5i)']), self)
    end
    departure_times.each do |station_id, t|
      station = railway_stations.where(id: station_id).first
      station.set_departure_time(Time.new(t['date(1i)'], t['date(2i)'], t['date(3i)'], t['date(4i)'], t['date(5i)']), self)
    end
  end

end
