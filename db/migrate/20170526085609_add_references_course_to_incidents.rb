# frozen_string_literal: true

class AddReferencesCourseToIncidents < ActiveRecord::Migration[5.0]
  def change
    add_reference :incidents, :course, foreign_key: true, index: true
  end
end
