module Api
  module V1
    class TransactionsController < ApplicationController
      def new
        errors = Transactions::Validate.new(
          amount: params[:amount],
          transaction_type: params[:transaction_type],
          bank_account_id: params[:bank_account_id],
          recipient_id: params[:recipient_id]).execute!
        if errors.size > 0
          render json: { errors: errors }, status: 402
        else
          bank_account = Transactions::Perform.new(
            amount: params[:amount],
            transaction_type: params[:transaction_type],
            bank_account_id: params[:bank_account_id],
            recipient_id: params[:recipient_id]).execute!
          render json: { balance: bank_account.balance }
        end
      end
    end
  end
end
