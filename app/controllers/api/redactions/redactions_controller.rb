class Api::Redactions::RedactionsController < ApplicationApiController
  skip_before_action :verify_authenticity_token
  before_action :redactions_params



  def create
    redaction = Redaction.new(redactions_params)
    if redaction.save
      render :status => 200, :json => {success: true, action: 'create' , data: redaction.as_json}
  end
end
  
  private
  
  def redactions_params
    params.permit(:picture, :howreceive, :redaction_title)
  end


  
end

