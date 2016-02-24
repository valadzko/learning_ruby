class AddLastStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :last_station, index: true, foreign_key: true
  end
end
