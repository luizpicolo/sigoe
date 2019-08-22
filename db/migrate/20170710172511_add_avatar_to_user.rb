# frozen_string_literal: true

class AddAvatarToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
  end
end
