class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :teachers

  def as_json(options = {})
    super(options.merge({ except: [:created_at,:updated_at] }))
  end
end
