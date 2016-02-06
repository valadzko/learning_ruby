class Train
  include Manufacturer
  attr_reader :speed, :id, :type
  attr_accessor :wagons

  self.class.trains ||= {}

  # english support only
  ID_FORMAT = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/i

  # denied to use parent class for object instances
  def initialize(id, type)
    @id = id
    @wagons = []
    @speed = 0
    @type = type
    validate!
    @@trains[id] = self
  end

  def each_wagon
    @wagon.each { |wagon| yield wagon }
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.find(id)
    @@trains[id].inspect
  end

  def increase_speed(amount = 10)
    @speed += amount
  end

  def stop
    @speed = 0
  end

  def accept_route(route)
    raise 'Route is not valid' unless route.valid?
    @route = route
    @current_station = @route.first_station
  end

  def move_to_next_station
    @route.stations.each_with_index do |station, index|
      if station.name == @current_station.name
        @current_station = @route.stations[index + 1]
      end
    end
  end

  def move_to_final_destination
    loop do
      break if @current_station.name == @route.last_station.name
      move_to_next_station
    end
  end

  def prev_station
    @route.stations.each_with_index do |station, index|
      @route.stations[index - 1] if station.name == @current_station.name
    end
  end

  attr_reader :current_station

  def next_station
    @route.stations.each_with_index do |station, index|
      @route.stations[index + 1] if station.name == @current_station.name
    end
  end

  protected

  def validate!
    raise 'Train ID must have this format: 3 letters/numbers, \
    dash (not required), 2 letters/numbers' unless id =~ ID_FORMAT
    raise 'Unknown train type' unless type == 'passenger' || type == 'cargo'
    true
  end

  def attache_wagon
    raise 'Failed to attache wagon. Train is in motion' if @speed.zero?
  end

  def detach_wagon
    raise 'Failed to dettach wagon. Train is in motion' if @speed.zero?
    raise 'All wagons has been detached already' if @wagons.empty?
  end
end
