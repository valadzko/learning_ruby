class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :top_seats
      t.string :bottom_seats
      t.string :side_top_seats
      t.string :side_bottom_seats
      t.string :reqular_seats
      t.string :class_type
      t.string :type

      t.timestamps null: false
    end
  end
end
