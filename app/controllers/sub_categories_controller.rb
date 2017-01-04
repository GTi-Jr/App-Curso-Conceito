class SubCategoriesController < BaseController
 before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
  	@sub_categories= SubCategory.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end
  
  def new
    @sub_categories= SubCategory.new
  end 

  def create

    @sub_categories = SubCategory.new(sub_category_params)
    @sub_categories.name = @sub_categories.name.mb_chars.upcase
    respond_to do |format|  
        #if @sub_categories.unique
      if @sub_categories.save
         format.html { redirect_to sub_categories_path, notice1: 'Subcategoria foi criado com sucesso.' }
      else
        format.html { render :new }
        #format.html { redirect_to new_sub_category, notice1: 'Subcategoria já existe.' }
        format.json { render json: @sub_categories.errors, status: :unprocessable_entity }
      end
       #else
        #format.html { redirect_to new_sub_category, notice1: 'Subcategoria já existe.' }
	 #end
  end
end

  def edit
  end

  def update 
    respond_to do |format|
      if @sub_categories.update(sub_category_params)
        format.html { redirect_to  sub_categories_path , notice: 'Subcategoria foi editado com sucesso.' }
      else
         format.html { render :edit }
         format.json { render json: @sub_categories.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sub_categories = SubCategory.find(params[:id])
    respond_to do |format|
      if @sub_categories.destroy
      format.html { redirect_to sub_categories_path, notice: 'Subcategoria foi apagada com sucesso.' }
      format.xml  { head :ok }
      end
    end
  end
   
  def search
    @sub_categories_suggestions = SearchTable.searchsub_category(queryString: params[:queryString].strip.upcase)

    render json: @sub_categories_suggestions, :include => {:category => {:only => :name}}
    
  end

  def set_sub_category
      @sub_categories = SubCategory.find(params[:id])
  end
  
  def sub_category_params
      params.require(:sub_category).permit(:name, :category_id)
  end


end
