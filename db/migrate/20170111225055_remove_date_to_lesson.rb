class RemoveDateToLesson < ActiveRecord::Migration[5.0]
  def change
  	remove_column :lessons, :date
  	add_column :lessons, :date, :date
  end
end
