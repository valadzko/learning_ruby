class RailwayStation
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    puts "Train #{train.id} has arrived to the station #{@name}"
    @trains << train
  end

  def send_train(train_to_send)
    @trains.each do |train|
      if train.id == train_to_send.id
        puts "Train #{train.id} has been sent"
        @trains.delete(train)
      end
    end
  end

  def show_trains
    if @trains.any?
      @trains.each { |train| puts "Train at the station #{@name}: #{train.id} "}
    else
      puts "The are no trains at the #{@name} station at the moment"
    end
  end

  def show_freight_trains
    if @trains.any?
      @trains.each do |train|
        next unless train.type == "freight"
        puts "Freight train at the station #{@name} : #{train.id}"
      end
    end
  end

  def show_passenger_trains
    if @trains.any?
      @trains.each do |train|
        next unless train.type == "passenger"
        puts "Passenger train at the station #{@name} : #{train.id}"
      end
    end
  end

end
