class AddSubcategoryIdToLessons < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :subcategory, foreign_key: true
  end
end
