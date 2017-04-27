class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :number , :price_with_vat, :price, :vat_rate, :issued_at, :invoice_number
  has_one :client
  has_one :category

  def invoice_number
    self.object.number
  end
end
