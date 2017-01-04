class SubCategory < ApplicationRecord
		belongs_to :category
		validates :name, presence: true, uniqueness: { case_sensitive: true }
		validates :category, presence: true

end
