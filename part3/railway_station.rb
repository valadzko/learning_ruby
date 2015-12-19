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
    puts "Train #{train_to send} has been sent" if @trains.delete(train_to_send)
  end

  def show_trains
    if @trains.any?
      @trains.each { |train| puts "Train at the station #{@name}: #{train.id} "}
    else
      puts "The are no trains at the #{@name} station at the moment"
    end
  end

  def show_freight_trains
    show_trains_by_type("freight")
  end

  def show_passenger_trains
    show_trains_by_type("passenger")
  end

  private

  def show_trains_by_type(type)
    if @trains.any?
      @trains.each do |train|
        next unless train.type == type
        puts "Freight train at the station #{@name} : #{train.id}"
      end
    end
  end

end
