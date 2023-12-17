class LabreportsController < ApplicationController
  before_action :set_labreport, only: %i[ show edit update destroy ]

  # GET /labreports or /labreports.json
  def index
    @labreports = Labreport.includes(:user).all
  end

  # GET /labreports/1 or /labreports/1.json
  def show
  end

  # GET /labreports/new
  def new
    @labreport = Labreport.new
  end

  # GET /labreports/1/edit
  def edit
  end

 # GET /labreports/1/mark
 def mark
    pp(1)
 end
 def mark_update
    param = Labreport.find(params[:id])
    pp(param)
    param.grade = params[:grade]
    param.save
#Если сохранилось, то Back to labreports
#Если не сохранилось, то ошибка
    respond_to do |format|
        if param.save
            pp(param.grade)
            format.html { redirect_to labreports_path, notice: "Grade was successfully created." }
            format.json { render :show, status: :created, location: @labreport }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @labreport.errors, status: :unprocessable_entity }
        end
    end

 end
  # POST /labreports or /labreports.json
  def create

    # Получите значение email из параметров
    email = labreport_params[:email]

    # найти пользователя по email
    user = User.find_by(email: email)

    # Проверьте, был ли найден пользователь
    if user.present?

        labreport_params_ = labreport_params.except(:email)
        labreport_params_[:user_id] = user.id
        
        # Если пользователь найден, создайте новый отчет с user_id равным id найденного пользователя
        @labreport = Labreport.new(labreport_params_)
        respond_to do |format|
            if @labreport.save
                pp(@labreport)
                format.html { redirect_to labreport_url(@labreport), notice: "Labreport was successfully created." }
                format.json { render :show, status: :created, location: @labreport }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @labreport.errors, status: :unprocessable_entity }
            end
        end
    else
        pp(222)
        # Если пользователь не найден, обработайте эту ситуацию, например, выдайте сообщение об ошибке
        respond_to do |format|
        format.html { render :new, status: :unprocessable_entity, alert: "User with provided email not found." }
        format.json { render json: { error: "User with provided email not found." }, status: :unprocessable_entity }
        end
    end
  end

# PATCH/PUT /labreports/1 or /labreports/1.json
def update
    pp(2)
    # Получите значение email из параметров
    email = labreport_params[:email]

    # найти пользователя по email
    user = User.find_by(email: email)

    # Проверьте, был ли найден пользователь
    if user.present?

        labreport_params_ = labreport_params.except(:email)
        labreport_params_[:user_id] = user.id

        # Если пользователь найден, создайте новый отчет с user_id равным id найденного пользователя
        @labreport = Labreport.new(labreport_params_)
        respond_to do |format|
            if @labreport.update(labreport_params_)
                format.html { redirect_to labreport_url(@labreport), notice: "Labreport was successfully updated." }
                format.json { render :show, status: :ok, location: @labreport }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @labreport.errors, status: :unprocessable_entity }
            end
        end
    else
        pp(222)
        # Если пользователь не найден, обработайте эту ситуацию, например, выдайте сообщение об ошибке
        respond_to do |format|
        format.html { render :new, status: :unprocessable_entity, alert: "User with provided email not found." }
        format.json { render json: { error: "User with provided email not found." }, status: :unprocessable_entity }
        end
    end
end

  # DELETE /labreports/1 or /labreports/1.json
  def destroy
    @labreport.destroy

    respond_to do |format|
      format.html { redirect_to labreports_url, notice: "Labreport was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # set_labreport: Этот метод используется для нахождения объекта "Labreport" по его идентификатору (ID). Он выполняется перед определенными действиями и находит объект "Labreport" в базе данных.
    def set_labreport
      @labreport = Labreport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #   labreport_params: Этот метод определяет список разрешенных параметров, которые могут быть переданы в методах create и update. Это сделано для безопасности и предотвращения массового присвоения (mass assignment) значений, которые не должны быть изменены пользователем.
    def labreport_params
       
      params.require(:labreport).permit(:email, :number_report, :title, :description, :file_name, :grade)
    end
end
