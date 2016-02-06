require './accessors.rb'
class Test
  extend Accessors

  attr_accessor_with_history :pppp, :rrr, :tt, :c
  strong_attr_acessor :str, String

end
