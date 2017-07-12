class StudentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_student, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Estudantes"

    @students = Student.order("#{set_order}": :desc)
                       .search(params[:search])
                       .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Estudantes", :students_path
    add_breadcrumb "Novo estudante"

    @students = Student.new
  end

  def create
    @students = Student.new(student_params)
    if @students.save
      redirect_to students_path, flash: { success: 'Estudante cadastro com sucesso' }
    else
      flash.now[:error] = @students.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Estudantes", :users_path
    add_breadcrumb "Atualizar estudante"
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, flash: { success: 'Estudante atualizado com sucesso' }
    else
      flash.now[:error] = @student.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @student.destroy
      flash[:success] = "Estudante deletado com sucesso"
      redirect_back(fallback_location: users_path)
    else
      flash.now[:error] = @student.errors.full_messages
      render :new
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def set_order
    params[:order] == "" || params[:order].nil? ? 'id' : params[:order]
  end

  def set_amount_return
    params[:return] == "" || params[:return].nil? ? '15' : params[:return]
  end

  def student_params
    params.require(:student).permit(
      :name, :photo, :course_id, :responsible, :responsible_contact, :contact
    )
  end
end
