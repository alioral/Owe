class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :lender
      t.string :borrower
      t.integer :amount
      t.integer :status
      t.datetime :deadline_at
      
      t.timestamps
    end
  end
end
