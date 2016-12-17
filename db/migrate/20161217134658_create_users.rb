class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :possword
      t.string :email
      t.string :photo
      t.string :name
      t.string :birthday
      t.boolean :blocked

      t.timestamps
    end
  end
end
