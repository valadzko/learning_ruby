class Wagon < ActiveRecord::Base
  belongs_to :train

  #validates :number, presence: true, uniqueness: {scope: :train_id}
  validates :class_type, inclusion: { in: %w(first_class econom_class), \
    message: "Please type 'first_class' or 'econom_class'" },  presence: true
end
