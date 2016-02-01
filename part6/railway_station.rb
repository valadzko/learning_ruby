class RailwayStation
  attr_reader :name

  @@stations = {}

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations[name] = self
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def accept_train(train)
    @trains << train if train.valid?
  end

  def send_train(train_to_send)
    @trains.delete(train_to_send) if train_to_send.valid?
  end

  def show_trains
    if @trains.any?
      @trains.each { |train| puts "Train at the station #{@name}: #{train.id} "}
    else
      puts "The are no trains at the #{@name} station at the moment"
    end
  end

  def to_s
    "Station #{name}"
  end

  def show_freight_trains
    show_trains_by_type("freight")
  end

  def show_passenger_trains
    show_trains_by_type("passenger")
  end

  private

  def validate!
    raise "Station name is not defined" if @name.nil?
    raise "Station name length can not be less than 3 letter!" if @name.lenght < 3
    true
  end

  # private, because it is used only for internal purposes of the class Train
  def show_trains_by_type(type)
    if @trains.any?
      @trains.each do |train|
        puts "Freight train at the station #{@name} : #{train.id}" if train.type == type
      end
    end
  end

end
