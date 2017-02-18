class DropVisits < ActiveRecord::Migration
  def change
      drop_table :visits
      drop_table :ahoy_events
  end
end
