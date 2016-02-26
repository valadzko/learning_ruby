class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :seat_number
      t.string :seat_type
      t.timestamps null: false
    end
  end
end
