class RemoveTimesToLesson < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :lesson_hour_start, :time
    remove_column :lessons, :lesson_hour_end, :time
    
    add_column :lessons, :lesson_hour_start, :datetime
    add_column :lessons, :lesson_hour_end, :datetime
  end
end
