class CreatePolos < ActiveRecord::Migration[7.0]
  def change
    create_table :polos do |t|
      t.string :name, null: false, index: true
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
