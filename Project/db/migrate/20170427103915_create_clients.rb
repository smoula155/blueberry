class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :company_number, limit: 8
      t.timestamps
    end
  end
end
