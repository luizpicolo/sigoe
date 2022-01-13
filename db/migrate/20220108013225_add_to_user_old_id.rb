class AddToUserOldId < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :old_id, :integer, index: true
  end
end
