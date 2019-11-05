# frozen_string_literal: true

class AddIsResolvedToIncident < ActiveRecord::Migration[5.1]
  def change
    add_column :incidents, :is_resolved, :integer
  end
end
