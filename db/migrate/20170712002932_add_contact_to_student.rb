class AddContactToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :contact, :string
  end
end
