class CargoWagon < Wagon
  def initialize(id, volume_capacity)
    super(id)
    @volume_capacity = volume_capacity
    @taken_volume = 0
  end

  def type
    'cargo'
  end

  # bad naming, too
  def take_volume(volume)
    if @taken_volume + volume <= @volume_capacity
      @taken_volume += volume
    else
      raise 'There is not enough available volume in this wagon'
    end
  end

  attr_reader :taken_volume

  def available_volume
    @volume_capacity - taken_volume
  end
end
