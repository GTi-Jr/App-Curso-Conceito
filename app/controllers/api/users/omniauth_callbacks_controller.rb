class Api::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json
  before_action :check_error_blocked, only: [:facebook]

  def facebook
    if @user.persisted? && !@user.blocked
      sign_in @user, :event => :authentication #this will throw if @user is not activated
      #set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      render :status => 200, :json => {success: true, name: @user.name, image: @user.image, birthday: @user.birthday }	
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
      render :status => 422, :json => { success: false,:errors => @user.errors.messages }
    end
  end

  def check_error_blocked
    @user = User.from_omniauth(request.env["omniauth.auth"]) 
    @user.errors.add(:blocked, :invalid, message: "true") 
  end
end