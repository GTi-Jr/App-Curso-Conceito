class Content < ApplicationRecord
	belongs_to :subcategory
	mount_uploader :file, FileUploader
end
