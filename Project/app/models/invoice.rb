class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :category

  def price_with_vat
    self.price + self.price * self.vat_rate / 100
  end

end
