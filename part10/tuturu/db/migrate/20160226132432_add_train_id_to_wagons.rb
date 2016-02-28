class AddTrainIdToWagons < ActiveRecord::Migration
  def change
    add_belongs_to :wagons, :train, index: true, foreign_key: true
  end
end
