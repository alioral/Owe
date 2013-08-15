class ChangeDateFormat < ActiveRecord::Migration
  def up
  	change_column :debts, :deadline_at, :string
  end

  def down
  	change_column :debts, :deadline_at, :datetime
  end
end
