class SummaryCategorieSerializer < ActiveModel::Serializer
  attributes :date, :price_with_vat ,:price
  has_one :category

  def price_with_vat
    (self.object.percent_vat_rate + self.price).to_f
  end

  def date
    self.object.date.beginning_of_month.to_date
  end
end
