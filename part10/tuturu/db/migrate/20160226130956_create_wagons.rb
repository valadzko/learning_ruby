class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :class_type
      t.timestamps null: false
    end
  end
end
