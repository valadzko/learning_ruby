class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :regular_seats
      t.integer :number
      t.string :type

      t.timestamps null: false
    end
  end
end
