class RemoveBlockedFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :blocked, :boolean

  end
end
