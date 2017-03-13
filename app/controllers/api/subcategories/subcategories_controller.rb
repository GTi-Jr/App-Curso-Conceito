class Api::Subcategories::SubcategoriesController < ApplicationApiController
  def index
    pag          = params[:page]        ? params[:page]        : 1
    limit        = params[:limit]       ? params[:limit]       : 30
    category_id  = params[:category_id] ? params[:category_id] : nil

    subcategories =  ::Subcategory.filter(category_id, pag, limit)
    render :status => 200, :json => {success: true, limit: limit, page:pag, data: subcategories.as_json( :include => [{:category => {:except => [:created_at, :updated_at]} } ] )}
  end
end
