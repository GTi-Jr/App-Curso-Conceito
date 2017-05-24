class AddHowReceiveToRedaction < ActiveRecord::Migration[5.0]
  def change
    add_column :redactions, :howreceive, :string
  end
end
