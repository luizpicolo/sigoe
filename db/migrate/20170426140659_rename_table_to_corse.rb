# frozen_string_literal: true

class RenameTableToCorse < ActiveRecord::Migration[5.0]
  def change
    rename_table :school_classes, :courses
  end
end
