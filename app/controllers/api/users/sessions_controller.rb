class Api::Users::SessionsController < Devise::SessionsController
  #skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token
  before_action :check_params_facebook, only: [:gti_login_face]
  before_action :check_params_facebook_val, only: [:gti_login_face]
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #def new
  #    render :status => 200, :json => {success: true }
  #end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    render :status => 200, :json => {success: true}
  end

  def gti_login_face
    @user = User.from_omniauth(check_params_facebook)
    sign_in @user
    render :status => 200, :json => {success: true, data: @user }
  end

  private

  def check_params_facebook
    params.permit(:name, :image, :birthday, :uid, :token, :email).tap do |list|
      list[:name] =  params[:name]
      list[:image] =  params[:image]
      list[:uid] =  params[:uid]
      list[:token] =  params[:token]
      list[:email] =  params[:email]
    end
  end

  def check_params_facebook_val
    check_params_facebook.map do |k,v|
      if v.nil?
        render :status => 200, :json => {success: false, erros: "#{k} não pode ser vazio" }
        return true
      end
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
