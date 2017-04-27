require 'csv'
class ConvertInvoiceFromCsv
   attr_accessor :file_name

   def initialize(file_name)
     @file_name = file_name
   end

   def save_data
     csv_data = File.read(file_name)
     csv_reader = CSV.parse(csv_data,headers: true,) do |row|
       convert_row = row.to_hash
       unless Invoice.find_by_number convert_row['invoice number']
         invoice = Invoice.new(number: convert_row['invoice number'], price: convert_row['invoice price'], vat_rate: convert_row['invoice vat rate'], issued_at: convert_row['invoice issued at'])

         client = Client.find_by_name convert_row['client name']
         client.blank? ? invoice.build_client(name: convert_row['client name'], company_number: convert_row['company number']) : invoice.client = client

         category = Category.find_by_name(convert_row['category name'])
         category.blank? ? invoice.build_category(name: convert_row['category name']) : invoice.category = category
         invoice.save
       end
     end
   end
end
