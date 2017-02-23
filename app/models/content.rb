class Content < ApplicationRecord
  belongs_to :subcategory
  mount_uploader :file, FileUploader
  validates_presence_of :title, :subcategory_id, :file
end
