class AddTitleToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :title, :string
  end
end
