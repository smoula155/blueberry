class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number, limit: 8
      t.integer :vat_rate
      t.datetime :issued_at
      t.decimal :price
      t.references :client, index: true
      t.references :category, index: true
      t.timestamps
    end
  end
end
