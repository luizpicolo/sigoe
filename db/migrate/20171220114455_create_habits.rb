class CreateHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :habits do |t|
      t.references :patient, foreign_key: true, index: true
      t.integer :sleep_rest
      t.integer :amount_sleep_hours
      t.integer :physical_activity
      t.integer :amount_physical_activity
      t.integer :amount_fruit_vegetable
      t.integer :amount_red_meat
      t.integer :amount_white_meat
      t.integer :amount_juice
      t.integer :amount_water
      t.integer :amount_tea
      t.text :other_information

      t.timestamps
    end
  end
end
