class CreateRedactions < ActiveRecord::Migration[5.0]
  def change
    create_table :redactions do |t|
      t.string :picture
      t.string :whoreceive

      t.timestamps
    end
  end
end
