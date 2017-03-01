class AddSiapeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :siape, :integer
  end
end
