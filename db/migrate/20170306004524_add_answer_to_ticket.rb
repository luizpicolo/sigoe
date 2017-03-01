class AddAnswerToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :answer, :int, index: true
  end
end
