class AddPoloToStudent < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :polo, null: true, foreign_key: true
  end
end
