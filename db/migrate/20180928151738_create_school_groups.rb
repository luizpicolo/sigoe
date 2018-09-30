class CreateSchoolGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :school_groups do |t|
      t.string :name, index: true
      t.string :identifier, index: true

      t.timestamps
    end
  end
end
