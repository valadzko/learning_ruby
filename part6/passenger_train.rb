class PassengerTrain < Train

  def initialize(id)
    super(id, "passenger")
  end

  def attache_wagon
    super
    @wagons << PassengerWagon.new 
  end

  def detach_wagon
    super
    @wagons.shift
  end

end
