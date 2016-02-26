class Wagon < ActiveRecord::Base
  belongs_to :train
  has_many :seats
  
  validates :class_type, inclusion: { in: %w(first_class econom_class) }, presence: true
end
