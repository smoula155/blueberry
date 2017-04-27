class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number, limit: 8
      t.integer :vat_rate
      t.integer :issued_at
      t.decimal :price
      t.references :client_id, index: true
      t.references :category_id, index: true
      t.timestamps
    end
  end
end
