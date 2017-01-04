class Api::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in @user, :event => :authentication #this will throw if @user is not activated
      #set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      render :status => 200, :json => {success: true, name: @user.name, image: @user.image, birthday: @user.birthday }	
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
      render :status => 422, :json => { :errors => @user.errors.full_messages }
    end
  end
end