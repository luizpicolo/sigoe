class CoursesController < ApplicationController
  load_and_authorize_resource

  before_action :set_course, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Cursos"

    order = params[:order] == "" || params[:order].nil? ? 'id' : params[:order]
    amount_return = params[:return] == "" || params[:return].nil? ? '15' : params[:return]

    @students = Course.order("courses.#{order} asc")
                       .search(params[:search])
                       .page(params[:page]).per(amount_return)
  end

  def new
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Cursos", :courses_path
    add_breadcrumb "Novo curso"

    @courses = Course.new
  end

  def create
    @courses = Course.new(course_params)
    if @courses.save
      redirect_to courses_path, flash: { success: 'Curso cadastro com sucesso' }
    else
      flash.now[:error] = @courses.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Cursos", :courses_path
    add_breadcrumb "Atualizar curso"
  end

  def update
    if @courses.update(courses_path)
      redirect_to courses_path, flash: { success: 'Curso atualizado com sucesso' }
    else
      flash.now[:error] = @courses.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @courses.destroy
      flash[:success] = "Curso deletado com sucesso"
      redirect_back(fallback_location: courses_path)
    else
      flash.now[:error] = @courses.errors.full_messages
      render :new
    end
  end

  private

  def set_course
    @courses = Course.find(params[:id])
  end

  def course_params
    params.require(:student).permit(:name)
  end
end
