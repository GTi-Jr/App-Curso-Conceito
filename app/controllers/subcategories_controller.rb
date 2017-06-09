class SubcategoriesController < BaseController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  def index
    @subcategories = Subcategory.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end

  def new
    @subcategories = Subcategory.new
  end

  def create
    @subcategories = Subcategory.new(subcategory_params)
    @subcategories.name = @subcategories.name.mb_chars.upcase
    respond_to do |format|
      if @subcategories.save
        format.html { redirect_to subcategories_path, notice: 'Subcategoria foi criado com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @subcategories.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @subcategories.update(subcategory_params)
        format.html { redirect_to  subcategories_path , notice: 'Subcategoria foi editado com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @subcategories.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subcategories = Subcategory.find(params[:id])
    respond_to do |format|
      if @subcategories.destroy
        format.html { redirect_to subcategories_path, notice: 'Subcategoria foi apagada com sucesso.' }
        format.xml  { head :ok }
      end
    end
  end

  def search
    @subcategories_suggestions = SearchTable.searchsubcategory(queryString: params[:queryString].strip.downcase)
    render json: @subcategories_suggestions, :include => {:category => {:only => :name}}
  end

  def set_subcategory
    @subcategories = Subcategory.find(params[:id])
  end

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
