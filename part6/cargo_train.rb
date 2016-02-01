class CargoTrain < Train

  def initialize(id)
    super(id, "cargo")
  end

  def attache_wagon
    super
    @wagons << CargoWagon.new
  end

  def detach_wagon
    super
    @wagons.shift
  end

end
