class AddTicketIdToSeats < ActiveRecord::Migration
  def change
    add_belongs_to :seats, :ticket, index: true, foreign_key: true
  end
end
