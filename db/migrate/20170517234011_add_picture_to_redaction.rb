class AddPictureToRedaction < ActiveRecord::Migration[5.0]
  def change
    add_column :redactions, :picture, :text
  end
end
