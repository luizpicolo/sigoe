class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :from, index: true
      t.string :to, index: true
      t.string :subject
      t.integer :priority, default: 0
      t.text :description
      t.integer :status, index: true, default: 0
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
