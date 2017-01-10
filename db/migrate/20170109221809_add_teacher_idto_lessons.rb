class AddTeacherIdtoLessons < ActiveRecord::Migration[5.0]
  def change
  add_reference :lessons, :teacher, foreign_key: true
  end
end
