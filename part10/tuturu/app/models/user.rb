class User < ActiveRecord::Base
  has_many :Tickets
end
