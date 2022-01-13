# frozen_string_literal: true

namespace :student do
  @initials = %w[AQ CB CX DR NA NV PP TL CG JD]

  desc 'Download students data by SigaEdu'
  task get_data: :environment do
    @initials.each do |initial|
      token_api = Digest::MD5.hexdigest "#{ENV['SECRETKEY1']}#{initial}#{ENV['SECRETKEY2']}"

      polo = Polo.find_by(inicial: initial)

      json_students = "#{ENV['URI_API']}/students?token=#{token_api}&campus=#{initial}"
      response = HTTParty.get(json_students, verify: true)
      data_students = response.parsed_response
      data_students.each do |data|
        
        school_group = SchoolGroup.find_by(name: data['turma'])
        school_group = SchoolGroup.new if school_group.blank?
        school_group.name = data['turma']
        school_group.polo = polo
        school_group.save(validate: false)

        student = Student.find_by(ra: data['ra'].to_i)
        student = Student.new if student.blank?
        student.name = data['estudante']
        student.ra = data['ra']
        student.school_group_id = school_group.id
        student.course_id = data['identificador_curso']
        student.cpf = data['cpf']
        student.birth_date = data['data_nascimento']
        student.course_situation = data['situacao_no_curso']
        student.enrollment = data['matricula']
        student.save(validate: false)
      end
    end
  end
end
