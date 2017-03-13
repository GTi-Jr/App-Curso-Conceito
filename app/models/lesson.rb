class Lesson < ApplicationRecord
  belongs_to :subcategory
  belongs_to :teacher

  def self.filter(mes, ano, materia_id, pag, limit)
    reset_query_state
    @lessons = lessons.paginate(:page => pag, :per_page => limit)

    unless mes.nil?
      @lessons = lessons.where('extract(month from date_t) = ?', mes)
    end

    unless ano.nil?
      @lessons = lessons.where('extract(year from date_t) = ?', ano)
    end

    unless materia_id.nil?
      @lessons = lessons.where('subcategory_id = ?', materia_id)
    end

    @lessons || Lesson.none
  end

  def as_json(options = {})
    super(options.merge({ except: [:created_at,:updated_at] }))
  end

  private

  def self.lessons
    @lessons || Lesson
  end

  def self.reset_query_state
    @lessons = nil
  end


end
