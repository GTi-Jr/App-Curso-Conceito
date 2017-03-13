class Subcategory < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :category

  def self.filter(category_id, pag, limit)
    reset_query_state
    @subcategories = subcategories.paginate(:page => pag, :per_page => limit)

    unless category_id.nil?
      @subcategories = subcategories.where('category_id = ?', category_id)
    end

    @subcategories || Subcategory.none
  end

  def as_json(options = {})
    super(options.merge({ except: [:created_at,:updated_at] }))
  end

  private

  def self.subcategories
    @subcategories || Subcategory
  end

  def self.reset_query_state
    @subcategories = nil
  end
end
