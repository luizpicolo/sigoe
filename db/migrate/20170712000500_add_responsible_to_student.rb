class AddResponsibleToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :responsible, :string
  end
end
