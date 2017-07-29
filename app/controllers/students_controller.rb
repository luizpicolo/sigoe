class StudentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_student, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Estudantes"

    @students = Student.order("#{set_order}": :desc)
                       .search(params[:search])
                       .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "Diren", sector_actions_path('diren')
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
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Estudantes", :users_path
    add_breadcrumb "Atualizar estudante"
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
      flash[:success] = "Estudante deletado com sucesso"
      redirect_back(fallback_location: users_path)
    else
      flash.now[:error] = @student.errors.full_messages
      render :new
    end
  end

  def send_xls
  end

  def import_xls
    course_id = params[:course]
    file_path = params[:xls].tempfile.path

    course = Course.find(course_id)

    book = Spreadsheet.open file_path
    sheet1 = book.worksheet 0

    column_name = sheet1.first

    sheet1.each 1 do |row|
      student = course.students.find_by_ra(row[2])
      if student.present?
        student.update({
          name: row[3],
          course: course,
          contact: row[6],
          ra: row[2].to_i,
          enrollment: row[1],
          cpf: row[4],
          birth_date: row[5],
          course_situation: row[7]
        })
      else
        pwd = rand(000000000..999999999).to_s
        Student.create({
          name: row[3],
          course: course,
          contact: row[6],
          ra: row[2].to_i,
          enrollment: row[1],
          password: pwd,
          password_confirmation: pwd,
          cpf: row[4],
          birth_date: row[5],
          course_situation: row[7]
        })
      end
    end

    redirect_to students_path
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

  def check_password(user_params)
    if user_params[:password].empty?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
      user_params
    else
      user_params
    end
  end

  def student_params
    params.require(:student).permit(
      :name, :photo, :course_id, :responsible, :responsible_contact, :contact,
      :password, :password_confirmation, :ra, :cpf, :course_situation,
      :enrollment
    )
  end
end
