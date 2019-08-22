# frozen_string_literal: true

class AddSignedInToInsident < ActiveRecord::Migration[5.1]
  def change
    add_column :incidents, :signed_in, :datetime, default: nil, index: true
  end
end
