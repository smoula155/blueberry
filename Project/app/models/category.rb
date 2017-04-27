class Category < ActiveRecord::Base
  has_many :invoices
end
