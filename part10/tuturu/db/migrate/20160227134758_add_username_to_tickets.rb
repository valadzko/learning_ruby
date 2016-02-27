class AddUsernameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :username, :string
  end
end
