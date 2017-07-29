class AddCourseSituationToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :course_situation, :integer
  end
end
