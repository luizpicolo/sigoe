class AddLocalToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :local, :int
  end
end
