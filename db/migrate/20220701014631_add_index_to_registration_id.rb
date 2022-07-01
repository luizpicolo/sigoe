class AddIndexToRegistrationId < ActiveRecord::Migration[7.0]
  def change
    add_index :students, :registration_id
  end
end
