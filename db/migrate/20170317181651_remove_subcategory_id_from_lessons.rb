class RemoveSubcategoryIdFromLessons < ActiveRecord::Migration[5.0]
  def change
    remove_reference :lessons, :subcategory, foreign_key: true
  end
end
