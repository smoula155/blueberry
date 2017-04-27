class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :number , :price_with_vat, :price, :vat_rate, :issued_at
  has_one :client
  has_one :category
end
