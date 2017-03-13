class Subscribed < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :lesson_id, message: "ID %{value} já foi cadastrado nesta aula."

  def self.process(options)
    @subscribed_new = Subscribed.new(options)
    if @subscribed_new.save
      return {status: true, message: ''}
    else
      return {status: false, message:  @subscribed_new.errors.messages }
    end
  end

  def as_json(options = {})
    super(options.merge({ except: [:created_at,:updated_at] }))
  end

end
