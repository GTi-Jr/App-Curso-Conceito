class AddCategToLesson < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :category, foreign_key: true
  end
end
