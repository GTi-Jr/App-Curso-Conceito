class RemoveWeekToEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_week, :String
  end
end
