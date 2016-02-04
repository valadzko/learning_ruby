class PassengerWagon < Wagon

  @@wagons = []

  def initialize(id, seats_number)
    super(id)
    @seats_number = seats_number
    @taken_seats_number = 0
    @@wagons << self
  end

  def type
    "passenger"
  end

  # bad naming
  def take_seat
    if @taken_seats_number + 1 <= @seats_number
      @taken_seats_number += 1
    else
      raise "All seats are taken!"
    end
  end

  def taken_seats
    @taken_seats_number
  end

  def available_seats
    @seats_number - taken_seats
  end

  def self.print_all_wagons
    if @@wagons.empty?
      puts "There are no wagons"
    else
      @@wagons.each { |w| puts "Hey, your wagon is : #{w}" }
    end
  end

  def to_s
    "Wagon name is #{@id}"
  end

end
