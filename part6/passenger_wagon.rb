class PassengerWagon < Wagon  

  @@wagons = []

  def initialize(name)
    @name = name
    @@wagons << self
  end

  def self.print_all_wagons
    if @@wagons.empty?
      puts "There are no wagons"
    else
      @@wagons.each { |w| puts "Hey, your wagon is : #{w}" }
    end
  end

  def to_s
    "Wagon name is #{@name}"
  end

end
