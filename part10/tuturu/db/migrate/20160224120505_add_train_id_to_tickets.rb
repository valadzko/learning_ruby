class AddTrainIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :train, index: true, foreign_key: true
  end
end
