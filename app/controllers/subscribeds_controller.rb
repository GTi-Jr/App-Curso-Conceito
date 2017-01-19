class SubscribedsController < BaseController
  before_action :set_subscribed

  def index
  end
  
  
  def edit 

  end

 def update
    @subscribed = Subscribed.find(params[:id])
    @subscribed.update_attributes(params[:subscribed])
    redirect_to @lessons
  end

  def set_subscribed
  	@all_subscribed = Subscribed.where(lesson_id: params[:id])
  end

 
  def subscribed_params
      params.require(:subscribed).permit(:user_id, :lesson_id, :is_present)
  end
end
