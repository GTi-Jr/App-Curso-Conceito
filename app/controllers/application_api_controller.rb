class ApplicationApiController < ApplicationController
  before_action :user_api
  respond_to :json
  private
  #LOGADO?
  def user_api
    unless user_signed_in?
      render :status => 422, :json => {success: false, errors: 'unauthenticated'}
    end
  end
end
