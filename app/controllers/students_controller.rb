class StudentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_student, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "AUDI", sector_actions_path('audi')
    add_breadcrumb "Estudantes"

    @students = Student.order('students.id asc').search(params[:search]).page(params[:page])
  end

  def new
    add_breadcrumb "AUDI", sector_actions_path('audi')
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
    add_breadcrumb "AUDI", sector_actions_path('serti')
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
      redirect_to :back, flash: { success: "Estudante deletado com sucesso" }
    else
      flash.now[:error] = @student.errors.full_messages
      render :new
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :name, :photo, :course_id
    )
  end
end
