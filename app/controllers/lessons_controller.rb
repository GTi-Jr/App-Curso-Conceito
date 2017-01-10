class LessonsController < BaseController
   before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
  	@lessons= Lesson.all.order('id DESC').paginate(page: params[:page], per_page: 50)
  end
  
  def new
    @lessons= Lesson.new
  end 

  def create

    @lessons = Lesson.new(lesson_params)
    respond_to do |format|
      if @lessons.save
        format.html { redirect_to lessons_path, notice1: 'Aula foi cadastrada com sucesso.' }
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
      if @lessons.update(lesson_params)
        format.html { redirect_to  lessons_path , notice: 'Aula foi editada com sucesso.' }
      else
         format.html { render :edit }
         #format.json { render json: @categories.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lessons = Lesson.find(params[:id])
    @lessons.destroy
    respond_to do |format|
      format.html { redirect_to lessons_path(@lessons) }
      format.xml  { head :ok }
    end
  end

  def set_lesson
      @lessons = Lesson.find(params[:id])
  end
  def search
    @lessons_suggestions = SearchTable.searchlesson(queryString: params[:queryString].strip.downcase)

    render json: @lessons_suggestions, :include => {:subcategory => {:only => :name}, :teacher => {:only => :name}}
  end
  def lesson_params
      params.require(:lesson).permit(:teacher_id, :date, :lesson_hour_start, :lesson_hour_end, :limit, :subcategory_id)
  end

end

