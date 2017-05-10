class DropTicketTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :tickets
  end
end
