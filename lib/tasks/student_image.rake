# frozen_string_literal: true

namespace :student_image do
  desc 'Download students image by SigaEdu'
  task download: :environment do
    require 'mechanize'
    require 'open-uri'

    @agent = Mechanize.new
    @agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    page = @agent.get('https://10.1.0.38/administrativo/')
    form = @agent.page.forms.first

    form.field_with(name: 'data[Usuario][login]').value = ENV['USER_SIGA']
    form.field_with(name: 'data[Usuario][senha]').value = ENV['PASSWORD_SIGA']
    form.method = 'POST'
    page = form.submit

    Student.all.each do |student|
      puts 'https://10.1.0.38/administrativo/pessoa_fisicas/foto/' + student.ra.to_s
      page = @agent.get('https://10.1.0.38/administrativo/pessoa_fisicas/foto/' + student.ra.to_s)
      File.open('public/uploads/tmp/' + student.ra.to_s + '.jpg', 'wb') do |file|
        file.puts page.body
        student.photo = file
        p student.save(validate: false)
      end
    end
  end
end
