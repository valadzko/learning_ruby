class AddRouteIdToTrains < ActiveRecord::Migration
  def change
    add_belongs_to :trains, :route, index: true, foreign_key: true
  end
end
