class AddInitialToPolo < ActiveRecord::Migration[7.0]
  def change
    add_column :polos, :inicial, :string, index: true
  end
end
