# frozen_string_literal: true

every :day, at: '1:00 am' do
  runner 'rake student_image:download'
end
