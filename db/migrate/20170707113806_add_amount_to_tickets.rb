class AddAmountToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :amount, :integer
  end
end
