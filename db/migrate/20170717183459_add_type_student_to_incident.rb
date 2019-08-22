# frozen_string_literal: true

class AddTypeStudentToIncident < ActiveRecord::Migration[5.1]
  def change
    add_column :incidents, :type_student, :integer
  end
end
