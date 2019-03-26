class DropKeypassTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :keypasses
  end
end
