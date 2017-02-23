class ContentsController < BaseController
  before_action :set_content, only: [:edit, :update, :destroy]

  def index
    @contents = Content.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end

  def new
    @contents = Content.new
    !params[:file].nil? ? @content.file = params[:file] : ''
  end

  def create
    @contents = Content.new(content_params)
    respond_to do |format|
      if @contents.save
        format.html { redirect_to contents_path, notice: 'Conteudo foi criado com sucesso.' }
      else
        format.html { render :new }
        #format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contents.update(content_params)
        format.html { redirect_to  contents_path , notice: 'Conteudo foi editado com sucesso.' }
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
        @content.remove_file! #APAGAR O ARQUIVO. OBS: NÃO APAGA A PASTA
        format.html { redirect_to contents_path, notice: 'Conteudo foi apagada com sucesso.' }
        format.xml  { head :ok }
      end
    end
  end

  def search
    @search_contents = SearchTable.search_contents(queryString: params[:queryString].strip.downcase)
    render json: @search_contents, :include => {:subcategory => {:only => :name}}
  end

  private

  def set_content
    @contents = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :subcategory_id, :file)
  end
end
