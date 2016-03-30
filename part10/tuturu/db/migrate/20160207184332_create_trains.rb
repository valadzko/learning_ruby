class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :number
      t.string :wagons_desc_order, default: '0'

      t.timestamps null: false
    end
  end
end
