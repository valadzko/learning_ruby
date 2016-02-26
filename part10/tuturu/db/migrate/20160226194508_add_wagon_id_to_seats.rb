class AddWagonIdToSeats < ActiveRecord::Migration
  def change
    add_belongs_to :seats, :wagon, index: true, foreign_key: true
  end
end
