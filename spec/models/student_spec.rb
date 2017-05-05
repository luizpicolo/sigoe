# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  course_id  :integer
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
