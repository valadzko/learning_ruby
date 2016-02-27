class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :top_seats
      t.string :bottom_seats
      t.string :class_type
      t.timestamps null: false
    end
  end
end
