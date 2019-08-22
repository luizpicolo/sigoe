# frozen_string_literal: true

class RenameSchoolClassToCorse < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :school_class_id, :course_id
  end
end
