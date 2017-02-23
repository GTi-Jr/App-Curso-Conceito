class Api::Subscribe::SubscribesController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  #is_present, lesson_id, user_id
  def request_sub
    params[:is_present] = false
    params[:user_id] = current_user.id
    subscribe = Subscribed.process(subscribe_params)
    if subscribe[:status]
      render :status => 200, :json => {success: true}
    else
      render :status => 422, :json => {success: false, errors: subscribe[:message] }
    end
  end

  private
  def subscribe_params
    params.permit(:lesson_id, :user_id, :is_present)
  end

end
