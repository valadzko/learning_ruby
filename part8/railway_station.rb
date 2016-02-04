class RailwayStation
  attr_reader :name

  @@stations = {}

  def self.all
    @@stations
  end

  def each_train
    @trains.each { |train| yield train }
  end

  def self.show_trains_for_stations
    @@station.each do |station|
      station.each_train do |t|
        puts "Train id = #{t.id}, type = #{t.type}, wagons = #{t.wagons}"
        t.each_wagon do |w|
          puts "Wagon id: #{w.id}, type: #{w.type}"
          if w.type == 'cargo'
            puts "Available volume: #{w.available_volume},\
             taken volume: #{w.taken_volume}"
          elsif w.type == 'passenger'
            puts "Available seats: #{w.available_seats}, \
            taken seats: #{w.taken_seats}"
          end
        end
      end
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations[name] = self
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
      @trains.each { |train| puts "Train at #{@name}: #{train.id} " }
    else
      puts "The are no trains at the #{@name} station at the moment"
    end
  end

  def to_s
    "Station #{name}"
  end

  def show_freight_trains
    show_trains_by_type('freight')
  end

  def show_passenger_trains
    show_trains_by_type('passenger')
  end

  private

  def validate!
    raise 'Station name is not defined' if @name.nil?
    raise 'Station name length cant be less than 3 letter!' if @name.lenght < 3
    true
  end

  # private, because it is used only for internal purposes of the class Train
  def show_trains_by_type(type)
    if @trains.any?
      @trains.each do |train|
        puts "Freight train at #{@name} : #{train.id}" if train.type == type
      end
    end
  end
end
