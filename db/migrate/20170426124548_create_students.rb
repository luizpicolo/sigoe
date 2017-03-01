class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.references :school_class, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
