module InstanceCounter

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_accessor :instances

  end

end
