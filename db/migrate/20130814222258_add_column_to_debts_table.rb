class AddColumnToDebtsTable < ActiveRecord::Migration
  def self.up
  	add_column :debts, :provider, :string
  end

  def self.down
  	remove_column :debts, :provider
  end
end
