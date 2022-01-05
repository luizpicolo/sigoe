class AddPoloToCourse < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :polo, null: true, foreign_key: true
  end
end
