module InstanceCounter
  # def self.included(base)
  #     base.send :attr_accessor, :instances_count
  #     base.extend self.class.instances
  # end
  #
  # class << self
  #   attr_accessor :instances_count
  # end
  #
  # def self.instances
  #   self.instances_count
  # end
  #
  # def self.instances=(count)
  #
  # protected
  #
  # @@instances_count = 0
  #
  # def register_instance
  #   self.instances_count += 1
  # end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    

  end

end
