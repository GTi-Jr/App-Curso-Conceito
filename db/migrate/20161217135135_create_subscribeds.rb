class CreateSubscribeds < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribeds do |t|
      t.boolean :is_present
      t.timestamps
    end
  end
end
