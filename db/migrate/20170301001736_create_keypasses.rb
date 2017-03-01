class CreateKeypasses < ActiveRecord::Migration[5.0]
  def change
    create_table :keypasses do |t|
      t.string :title
      t.string :key
      t.string :local_service
      t.text :description

      t.timestamps
    end
  end
end
