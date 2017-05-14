class Redaction < ApplicationRecord
	mount_base64_uploader :picture, PictureUploader


	def as_json(options = {})
    super(options.merge({ except: [:created_at,:updated_at] }))
  end

end
