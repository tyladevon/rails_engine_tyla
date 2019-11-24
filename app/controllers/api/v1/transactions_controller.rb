class Api::V1::TransactionsController < ApplicationController

  def index
    transactions = Transaction.all
    serialized_transaction = TransactionSerializer.new(transactions)
    render json: serialized_transaction
  end

  def show
    transaction = Transaction.find(params[:id])
    serialized_transaction = TransactionSerializer.new(transaction)
    render json: serialized_transaction
  end

  def find
   transaction = Transaction.find_by(find_params)
   serialized_transaction = TransactionSerializer.new(transaction)
   render json: serialized_transaction
  end

  def find_all
      transaction = Transaction.where(find_params)
      serialized_transaction = TransactionSerializer.new(transaction)
      render json: serialized_transaction
  end

  def random
    transaction = Transaction.random
    serialized_transaction = TransactionSerializer.new(transaction)
    render json: serialized_transaction
  end

  private

  def find_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end
