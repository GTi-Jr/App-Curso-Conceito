class Api::Categories::CategoriesController < ApplicationApiController
  def index
    pag     = params[:page]    ? params[:page]    : 1
    limit   = params[:limit]   ? params[:limit]   : 30

    categories =  ::Category.paginate(:page => pag, :per_page => limit)
    render :status => 200, :json => {success: true, limit: limit, page:pag, data: categories}
  end
end
