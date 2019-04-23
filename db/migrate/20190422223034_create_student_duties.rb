class CreateStudentDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :student_duties do |t|
      t.string :item

      t.timestamps
    end
  end
end
