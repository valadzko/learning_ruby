class Wagon
  include Manufacturer
  attr_reader id

  def initialize(id)
    @id = id
  end

  def type
  end
end
