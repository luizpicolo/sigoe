# frozen_string_literal: true

class AddCpfToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :cpf, :string
  end
end
