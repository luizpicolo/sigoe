# frozen_string_literal: true

class AddIndexEntities < ActiveRecord::Migration[5.0]
  def change
    add_index(:students, :name)
    add_index(:courses, %i[name initial])
    add_index(:keypasses, :title)
    add_index(:sectors, %i[name initial slug])
  end
end
