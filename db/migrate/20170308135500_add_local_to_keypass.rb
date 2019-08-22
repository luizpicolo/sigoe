# frozen_string_literal: true

class AddLocalToKeypass < ActiveRecord::Migration[5.0]
  def change
    add_column :keypasses, :local, :int
  end
end
