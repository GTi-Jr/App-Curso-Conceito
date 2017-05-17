class RemovePictureTypeFromRedaction < ActiveRecord::Migration[5.0]
  def change
    remove_column :redactions, :picture, :string
  end
end
