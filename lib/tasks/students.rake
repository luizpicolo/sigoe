# frozen_string_literal: true

namespace :student do
  desc 'Download students data by SigaEdu'
  task get_data: :environment do
    json_students = "http://#{ENV['URI_API']}/students?token=#{ENV['TOKEN_API']}&campus=#{ENV['CAMPUS_URI_API']}"
    response = HTTParty.get(json_students)
    data_students = response.parsed_response
    data_students.each do |data|
      json_student = "http://#{ENV['URI_API']}/students?token=#{ENV['TOKEN_API']}&campus=#{ENV['CAMPUS_URI_API']}&id=#{data['id']}"
      response = HTTParty.get(json_student)
      data_student = response.parsed_response.first

      p data_student

      p 'Created School Group'

      school_group = SchoolGroup.find_by_name(data_student['turma'])
      school_group = SchoolGroup.new unless school_group.present?
      school_group.name = data_student['turma']
      p school_group.save(validate: false)

      p 'Created Student'
      student = Student.find_by_ra(data['ra'].to_i)
      student = Student.new unless student.present?
      student.name = data['estudante']
      student.ra = data['ra']
      student.school_group_id = school_group.id
      student.course_id = data['identificador_curso']
      student.cpf = data['cpf']
      student.birth_date = data['data_de_nascimento']
      student.course_situation = data['situacao_no_curso']
      student.enrollment = data['matricula']
      student.save(validate: false)
    end
  end
end
