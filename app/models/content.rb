class Content < ApplicationRecord
  belongs_to :subcategory
  mount_uploader :file, FileUploader
  validates_presence_of :title, :subcategory_id, :file

  def self.filter(subcategory_id, pag, limit)
    reset_query_state
    @contents = contents.paginate(:page => pag, :per_page => limit)

    unless subcategory_id.nil?
      @contents = contents.where('subcategory_id = ?', subcategory_id)
    end

    @contents || Content.none
  end

  private

  def self.contents
    @contents || Content
  end

  def self.reset_query_state
    @contents = nil
  end
end
