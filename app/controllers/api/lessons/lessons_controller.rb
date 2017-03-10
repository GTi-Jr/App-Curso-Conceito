class Api::Lessons::LessonsController < ApplicationApiController
  def index
    pag     = params[:page]    ? params[:page]    : 1
    limit   = params[:limit]   ? params[:limit]   : 30
    mes     = params[:mes]     ? params[:mes]     : nil
    ano     = params[:ano]     ? params[:ano]     : nil
    materia = params[:subcategory_id] ? params[:subcategory_id] : nil

    lessons =  ::Lesson.filter(mes, ano, materia, pag, limit)
    render :status => 200, :json => {success: true, limit: limit, page:pag, data: lessons}
  end
end
