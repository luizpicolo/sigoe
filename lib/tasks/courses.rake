# frozen_string_literal: true

require 'digest'

namespace :course do
  @initials = %w[AQ CB CX DR NA NV PP TL CG JD]

  desc 'Download Courses data by SigaEdu'
  task get_data: :environment do
    @initials.each do |initial|
      token_api = Digest::MD5.hexdigest "#{ENV['SECRETKEY1']}#{initial}#{ENV['SECRETKEY2']}"

      polo = Polo.find_by(inicial: initial)

      url = "#{ENV['URI_API']}/courses?token=#{token_api}&campus=#{initial}"
      response = HTTParty.get(url, verify: true)
      data_courses = response.parsed_response
      data_courses.each do |data|
        course = Course.find_by(id: data['id'].to_i)
        course = Course.new if course.blank?
        course.id = data['id'] if course.present?
        course.name = data['nome']
        course.initial = data['nome_reduzido']
        course.polo = polo
        course.save(validate: false)
      end
    end
  end
end
