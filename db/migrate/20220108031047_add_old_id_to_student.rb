class AddOldIdToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :old_id, :integer, index: true
  end
end
