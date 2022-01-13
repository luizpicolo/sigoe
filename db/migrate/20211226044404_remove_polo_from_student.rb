class RemovePoloFromStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :polo_id
  end
end
