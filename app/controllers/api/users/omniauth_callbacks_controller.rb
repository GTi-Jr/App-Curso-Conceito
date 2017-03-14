class Api::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json
  before_action :check_params
  before_action :check_error_blocked, only: [:facebook]

  def facebook
   
      render :status => 200, :json => {success: true, params: check_params }
   
  end

  def check_error_blocked
   
  end

  def check_params
    params.permit(:name, :image, :birthday, :uid, :token, :email)
  end

end

