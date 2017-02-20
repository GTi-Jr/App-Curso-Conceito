class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :file
      t.references :subcategory, foreign_key: true
      t.timestamps
    end
  end
end
