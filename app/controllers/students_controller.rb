# frozen_string_literal: true

class StudentsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  before_action :set_student, only: %i[edit destroy update]
  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Estudantes'

    @students = Student.joins(:course)
        .where(params_return)
        .order("#{set_order}": :desc)
        .search(params[:search])
        .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Estudantes', :students_path
    add_breadcrumb 'Novo estudante'

    @students = Student.new
  end

  def create
    @students = Student.new(student_params)
    if @students.save(validate: false)
      redirect_to students_path, flash: { success: 'Estudante cadastro com sucesso' }
    else
      flash.now[:error] = @students.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Estudantes', :users_path
    add_breadcrumb 'Atualizar estudante'
  end

  def update
    if @student.update(check_password(student_params))
      redirect_to students_path, flash: { success: 'Estudante atualizado com sucesso' }
    else
      flash.now[:error] = @student.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @student.destroy
      flash[:success] = 'Estudante deletado com sucesso'
      redirect_back(fallback_location: students_path)
    else
      flash.now[:error] = @student.errors.full_messages
      render :new
    end
  end

  def send_xls
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Estudantes', :users_path
    add_breadcrumb 'Importar XLS'
  end

  def import_xls
    course = Course.find(params[:course])
    book = Spreadsheet.open params[:xls].tempfile.path
    students_attributes = book.worksheet 0
    students_attributes.each 1 do |attributes|
      Student.import(attributes, course)
    end
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def check_password(student_params)
    if student_params[:password].empty?
      student_params.delete(:password)
      student_params.delete(:password_confirmation)
    end
    student_params
  end

  def params_return
    if !set_polo.empty?
      { courses: set_polo }
    else
      set_polo
    end
  end

  def student_params
    params.require(:student).permit(
      :name, :photo, :course_id, :responsible, :responsible_contact, :contact, :password, :password_confirmation, :ra, :cpf, :course_situation, :enrollment, :school_group_id
    )
  end
end
