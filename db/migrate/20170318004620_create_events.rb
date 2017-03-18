class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.time :event_hour_start
      t.time :event_hour_end
      t.string :event_week, default: "0,0,0,0,0,0,0"
      t.integer :user_id
      t.timestamps
    end
  end
end
#{"mo"=>0,"tu"=>0,"we"=>0,"th"=>0,"fr"=>0,"sa"=>0,"su"=>0}
#{mo:0,tu:0,we:0,th:0,fr:0,sa:0,su:0}