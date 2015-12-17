class Route
  attr_accessor :stations

  def initialize
    @stations = []
  end

  def add_station(station)
    @stations << station
  end

  def add_first_station(station)
    @stations.unshift(station)
  end

  def remove_station(station)
    stations.each
  end

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
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
