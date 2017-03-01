class AddSectorToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :sector, foreign_key: true, index: true
  end
end
