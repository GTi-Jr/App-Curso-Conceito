class UsersController < BaseController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users= User.all.order('id DESC').paginate(page: params[:page], per_page: 50)

  end

  def new
    @users = User.new
  end

  def create

    @users = User.new(user_params)
    respond_to do |format|
      if @users.save
        format.html { redirect_to users_path, notice1: 'Aluno foi criado com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
end
  end

  def edit
  end

  def update 
    respond_to do |format|
      if @users.update(user_params)
        format.html { redirect_to  users_path , notice: 'Aluno foi editado com sucesso.' }
      else
         format.html { render :edit }
         format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    respond_to do |format|
      format.html { redirect_to users_path(@users) }
      format.xml  { head :ok }
    end
  end

  def set_user
      @users = User.find(params[:id])
    #  @users.photo = params[:file]
  end
  
  def user_params
      params.require(:user).permit(:name, :email, :birthday, :phone_number)
  end
end
