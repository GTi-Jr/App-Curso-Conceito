class ContentsController < BaseController
  before_action :set_content, only: [:edit, :update, :destroy]

  def index
  	@contents = Content.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end
  
  def new
    @content = Content.new
  end 


  def create
    @content = Content.new(content_params)
    respond_to do |format|  
      if @content.save
        format.html { redirect_to content_path, notice1: 'Conteudo foi criado com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update 
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to  content_path , notice: 'Conteudo foi editado com sucesso.' }
      else
         format.html { render :edit }
         format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content = Content.find(params[:id])
    respond_to do |format|
      if @content.destroy
      format.html { redirect_to content_path, notice: 'Conteudo foi apagada com sucesso.' }
      format.xml  { head :ok }
      end
    end
  end

  private 

  def set_content
    @content = Content.find(params[:id])
   # @content.file = params[:file]
  end
  
  def content_params
    params.require(:content).permit(:name)
  end

end
