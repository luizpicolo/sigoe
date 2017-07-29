class AddBirthDateToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :birth_date, :date
  end
end
