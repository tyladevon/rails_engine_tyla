class InvoiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :customer_id, :merchant_id, :status
  belongs_to :customer
  belongs_to :merchant

end
