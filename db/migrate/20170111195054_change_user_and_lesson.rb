class ChangeUserAndLesson < ActiveRecord::Migration[5.0]
  def change
  	add_reference :subscribeds, :lesson
  	add_reference :subscribeds, :user

  end
end
