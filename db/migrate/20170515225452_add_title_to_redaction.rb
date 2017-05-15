class AddTitleToRedaction < ActiveRecord::Migration[5.0]
  def change
    add_column :redactions, :redaction_title, :string
  end
end
