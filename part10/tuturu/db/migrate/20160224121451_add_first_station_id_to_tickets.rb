class AddFirstStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :first_station, index: true, foreign_key: true
  end
end
