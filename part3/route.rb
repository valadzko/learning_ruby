class Route
  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station, index)
    @stations.insert(index - 1, station)
  end

  def add_first_station(station)
    @stations.unshift(station)
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end

  def intermediate_stations
    @stations[1,-2]
  end

  def show_route
    route_stations = ""
    @stations.each {|station| route_stations += " #{station.name} "}
    puts  "All stations in the route: #{route_stations}"
  end

end
