class AddSchoolGroupIdToStudent < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :school_group, foreign_key: true
  end
end
