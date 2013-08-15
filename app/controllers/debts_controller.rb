class DebtsController < ApplicationController
	layout :resolve_layout

	def index
		@debts = Debt.order('created_at DESC').find_all_by_lender_and_status(session[:user].uid, 0)
  end

  def show
    @debt = Debt.find(params[:id])
  end

  def create
    @debt = Debt.new(params[:debt])
    @debt.lender = session[:user].uid
    @debt.status = ENV['DEBT_STATUS_OPEN'].to_i
    @debt.save

    redirect_to debts_path
  end

  def new
    @debt = Debt.new
  end

  def edit
    @debt = Debt.find(params[:id])
  end

  def update
    @debt = Debt.find(params[:id])
    @debt.update_attributes(params[:debt])

    redirect_to debts_path
  end

  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy

    redirect_to debts_path
  end


  def archieve
    #assuming the debts with closed status are paid
    @debtPaid = Debt.find_all_by_lender_and_status(session[:user].uid, 
                                                   ENV['DEBT_STATUS_CLOSED']) 
    @debtUnpaid = Debt.find_all_by_lender_and_status(session[:user].uid, 
                                                     ENV['DEBT_STATUS_OPEN'])

  end

	private

	def resolve_layout
      case action_name
      when "index", "new", "edit", "show", "archieve"
        if session[:user].nil?
          "application"
        else
          "product"
        end
      else
        "application"
      end
    end
end
