namespace :course do
  desc "Download Courses data by SigaEdu"
  task :get_data => :environment do
    url = "http://#{ENV['URI_API']}/courses?token=#{ENV['TOKEN_API']}"
    response = HTTParty.get(url, verify: true)
    data_courses = response.parsed_response
    data_courses.each do |data|
      course = Course.find_by_id(data['id'].to_i)
      course = Course.new unless course.present?        
      if course.present?        
        course.id = data['id']
      end
      course.name = data['curso']
      course.initial = data['curso']
      course.save(validate: false)
    end
  end
end