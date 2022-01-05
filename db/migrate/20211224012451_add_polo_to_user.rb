class AddPoloToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :polo, foreign_key: true, index: true
  end
end
