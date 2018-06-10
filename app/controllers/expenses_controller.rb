class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @expenses = current_user.expenses.order("date DESC")

      def index
        @expenses = current_user.expenses.order("date DESC")

        if params[:concept].present?
          @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
        end
        if params[:category_id].present?
          @expenses = @expenses.where("category_id = ?", params[:category_id])
        end
      end
    else
      redirect_to new_user_session_path
    end
  end
end
