class AddSubscribersToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :subscribers, :integer, default: 0
  end
end
