class CategoriesController < BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
  	@categories= Category.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end
  
  def new
    @categories= Category.new
  end 

  def create

    @categories = Category.new(category_params)
    @categories.name = @categories.name.mb_chars.upcase
    respond_to do |format|
    #3if @categories.name = !Category.name.empty?
      if @categories.save
        format.html { redirect_to categories_path, notice1: 'Categoria foi criado com sucesso.' }
      else
        format.html { render :new }
        #format.json { render json: @categories.errors, status: :unprocessable_entity }
      end
    #else
      format.html { render :new }
	   #end
    end
  end

  def edit
  end

  def update 
    respond_to do |format|
      if @categories.update(category_params)
        format.html { redirect_to  categories_path , notice: 'Categoria foi editado com sucesso.' }
      else
         format.html { render :edit }
         #format.json { render json: @categories.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @categories = Category.find(params[:id])
    SubCategory.where(category: params[:id]).destroy_all
    @categories.destroy
    respond_to do |format|
      format.html { redirect_to categories_path(@categories) }
      format.xml  { head :ok }
    end
  end

  def set_category
      @categories = Category.find(params[:id])
  end
  
  def category_params
      params.require(:category).permit(:name)
  end


  def search
    @categories_suggestions = SearchTable.searchcategory(queryString: params[:queryString].strip.downcase)

    render json: @categories_suggestions 
  end



end
