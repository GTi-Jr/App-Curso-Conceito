class AddWeekToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_week, :string, dafault: "0,0,0,0,0,0,0"
  end
end
