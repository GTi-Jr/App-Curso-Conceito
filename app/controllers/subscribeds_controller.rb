class SubscribedsController < BaseController
  before_action :set_subscribed

  def index
  end
  
  
  def edit 

  end

 def updatesubs
    @subscribed = Subscribed.find(params[:id])
    @subscribed.update(is_present: params[:is_present])
  end 

  def set_subscribed
  	@all_subscribed = Subscribed.where(lesson_id: params[:id])
  end
def search
    @subscribed_suggestions = SearchTable.searchsubscribed(queryString: params[:queryString].strip.downcase)
    render json: @subscribed_suggestions, :include => {:user => { :name => :image} } 
  end

 
  def subscribed_params
      params.require(:subscribed).permit(:user_id, :lesson_id, :is_present)
  end
end
