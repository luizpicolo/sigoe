class CreateMorbids < ActiveRecord::Migration[5.1]
  def change
    create_table :morbids do |t|

      t.timestamps
    end
  end
end
