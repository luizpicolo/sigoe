class AddUserToKeypass < ActiveRecord::Migration[5.0]
  def change
    add_column :keypasses, :user, :string
  end
end
