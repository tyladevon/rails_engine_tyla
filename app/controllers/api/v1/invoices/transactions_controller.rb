class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    invoices = Invoice.find(params[:id])
    transactions = Transaction.where(invoice_id: params[:id])
    serialized_transactions = TransactionSerializer.new(transactions)
    render json: serialized_transactions
  end

end
