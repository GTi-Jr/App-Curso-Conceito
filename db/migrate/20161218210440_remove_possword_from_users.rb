class RemovePosswordFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :possword, :string
  end
end
