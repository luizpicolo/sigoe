class AddIndexEntities < ActiveRecord::Migration[5.0]
  def change
    add_index(:students, :name)
    add_index(:courses, [:name, :initial])
    add_index(:keypasses, :title)
    add_index(:sectors, [:name, :initial, :slug])
  end
end
