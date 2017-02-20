class RemoveTeacherFromLessons < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :teacher, :string
  end
end
