class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :teacher
      t.datetime :date
      t.time :lesson_hour_start
      t.time :lesson_hour_end
      t.integer :limit

      t.timestamps
    end
  end
end
