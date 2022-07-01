class AddRegistrationIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :registration_id, :integer
  end
end
