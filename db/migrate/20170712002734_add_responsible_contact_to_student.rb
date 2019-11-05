# frozen_string_literal: true

class AddResponsibleContactToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :responsible_contact, :string
  end
end
