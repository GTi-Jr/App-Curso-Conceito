class TeachersController < BaseController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
  	@teachers = Teacher.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end
  
  def new
    @teachers = Teacher.new
  end 

  def create
    @teachers = Teacher.new(teacher_params)
    respond_to do |format|  
      if @teachers.save
         format.html { redirect_to teachers_path, notice: 'Professor foi cadastrado com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @teachers.errors, status: :unprocessable_entity }
      end
  end
end

  def edit
  end

  def update 
    respond_to do |format|
      if @teachers.update(teacher_params)
        format.html { redirect_to  teachers_path , notice: 'Professor foi editado com sucesso.' }
      else
         format.html { render :edit }
         format.json { render json: @teachers.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teachers = Teacher.find(params[:id])
    respond_to do |format|
      if @teachers.destroy
      format.html { redirect_to teachers_path, notice: 'Professor foi apagado com sucesso.' }
      format.xml  { head :ok }
      end
    end
  end
   
  def search
    @teachers_suggestions = SearchTable.searchTeachers(queryString: params[:queryString].strip.downcase)
    render json: @teachers_suggestions, :include => {:category => {:only => :name}}
  end

  def set_teacher
      @teachers = Teacher.find(params[:id])
  end
  
  def teacher_params
      params.require(:teacher).permit(:name, :category_id)
  end


end


