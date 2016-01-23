class Train
  include Manufacturer
  attr_reader :speed, :id, :type
  attr_accessor :wagons

  @@trains = {}

  # denied to use parent class for object instances
  def initialize(id, type)
    @id = id
    @wagons = []
    @speed = 0
    @type = type
    @@trains[id] = self
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
    @route = route
    @current_station = @route.first_station
  end

  def move_to_next_station
    @route.stations.each_with_index do |station, index|
      if station.name == @current_station.name
        @current_station = @route.stations[index + 1]
        puts "Train arrived to the station #{station.name}"
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

  def current_station
    @current_station
  end

  def next_station
    @route.stations.each_with_index do |station, index|
      @route.stations[index + 1] if station.name == @current_station.name
    end
  end

  protected

  # the purpose of these methods is to remove these checks from child classes,
  # so we should not be able to execute these methods on Train class directly
  def attache_wagon
    return "Failed to attache wagon. Train is in motion" if @speed.zero?
  end

  def detach_wagon
    return "Failed to dettach wagon. Train is in motion" if @speed.zero?
    return "All wagons has been detached already" if @wagons.empty?
  end

end
