class SummaryMonthSerializer < ActiveModel::Serializer
  attributes :date, :price_with_vat, :price

  def price_with_vat
    (self.object.percent_vat_rate + self.price).to_f
  end

  def date
    self.object.date.to_date
  end
end
