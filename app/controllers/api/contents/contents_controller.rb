class Api::Contents::ContentsController < ApplicationApiController
  def index
    pag            = params[:page]           ? params[:page]           : 1
    limit          = params[:limit]          ? params[:limit]          : 30
    subcategory_id = params[:subcategory_id] ? params[:subcategory_id] : nil

    contents =  ::Content.filter(subcategory_id, pag, limit)
    render :status => 200, :json => {success: true, limit: limit, page:pag, data: contents.as_json( :include => [{:subcategory => {:except => [:created_at, :updated_at]} } ] )}
  end
end
