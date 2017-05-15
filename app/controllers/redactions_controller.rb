class RedactionsController < BaseController
  before_action :set_redaction, only: [ :destroy]

  # GET /redactions
  # GET /redactions.json
  def index
    @redaction = Redaction.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end


  # GET /redactions/new
  def new
    @redaction = Redaction.new
  end

  # POST /redactions
  # POST /redactions.json
  def create
    @redaction = Redaction.new(redaction_params)

    respond_to do |format|
      if @redaction.save
        format.html { redirect_to @redaction, notice: 'Redaction was successfully created.' }
        format.json { render :show, status: :created, location: @redaction }
      else
        format.html { render :new }
        format.json { render json: @redaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redactions/1
  # DELETE /redactions/1.json
  def destroy
    @redaction.destroy
    respond_to do |format|
      format.html { redirect_to redactions_url, notice: 'Redaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redaction
      @redaction = Redaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redaction_params
      params.require(:redaction).permit(:picture, :howreceive, :redaction_title)
    end
end
