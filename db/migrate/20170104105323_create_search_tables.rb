class CreateSearchTables < ActiveRecord::Migration[5.0]
  def change
    create_table :search_tables do |t|

      t.timestamps
    end
  end
end
