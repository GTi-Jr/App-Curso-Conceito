class Api::Redactions::RedactionsController < ApplicationApiController
	skip_before_filter :verify_authenticity_token
  

  def create

    redactions = Redactions.new(redactions_params)
    redactions.save!
    
    render :status => 200, :json => {success: true, action: 'create' , data: redactions.as_json}
  	puts "recebeu chamada no json"
  end

  private
  
  def redactions_params
    params.permit(:picture, :howreceive)
  end


  
end
