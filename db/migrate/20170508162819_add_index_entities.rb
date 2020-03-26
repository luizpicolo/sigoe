# frozen_string_literal: true		

class AddIndexEntities < ActiveRecord::Migration[5.0]		
  def change		
    add_index(:students, :name)		
    add_index(:courses, %i[name initial])				
  end		
end