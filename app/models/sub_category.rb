class SubCategory < ApplicationRecord
		belongs_to :category
		validates :name, presence: true, uniqueness: { case_sensitive: false }
		validates :category, presence: true
end
