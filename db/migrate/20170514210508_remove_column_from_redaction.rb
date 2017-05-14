class RemoveColumnFromRedaction < ActiveRecord::Migration[5.0]
  def change
    remove_column :redactions, :whoreceive, :string
  end
end
