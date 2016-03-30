class Wagon < ActiveRecord::Base
  belongs_to :train

  validates :number, uniqueness: {scope: :train_id}, allow_nil: true

  before_validation :define_wagon_number

  private

  def define_wagon_number
    return if self.number
    max_number = train.wagons.maximum(:number) || 0
    self.number = max_number + 1
  end
end
