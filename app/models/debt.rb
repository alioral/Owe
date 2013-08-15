class Debt < ActiveRecord::Base
  attr_accessible :amount, :borrower, :deadline_at, :lender, :status, :provider
end
