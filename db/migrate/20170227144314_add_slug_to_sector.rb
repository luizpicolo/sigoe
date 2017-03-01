class AddSlugToSector < ActiveRecord::Migration[5.0]
  def change
    add_column :sectors, :slug, :string
  end
end
