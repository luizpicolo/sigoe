# frozen_string_literal: true

namespace :student do
  desc 'Download students data by SigaEdu'
  task get_data: :environment do
    url = "http://#{ENV['URI_API']}/students?token=#{ENV['TOKEN_API']}&campus=#{ENV['CAMPUS_URI_API']}"
    response = HTTParty.get(url)
    data_students = response.parsed_response
    data_students.each do |data|
      student = Student.find_by_ra(data['ra'].to_i)
      student = Student.new unless student.present?
      student.name = data['estudante']
      student.ra = data['ra']
      student.course_id = data['identificador_curso']
      student.cpf = data['cpf']
      student.birth_date = data['data_de_nascimento']
      student.course_situation = data['situacao_no_curso']
      student.save(validate: false)
    end
  end
end
