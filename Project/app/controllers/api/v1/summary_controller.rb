module Api::V1
  class SummaryController < ApplicationController

    def categories
      respond_to do |format|
          format.json { render json: @invoices, root: 'invoices' }
        end
    end

    def months
      @summary_month = Invoice.select(Invoice.arel_table[:issued_at].as('date')).select(Invoice.arel_table[:price].sum.as("price")).select((Invoice.arel_table[:price] * Invoice.arel_table[:vat_rate]/100).sum.as('percent_vat_rate')).group(Arel::Nodes::NamedFunction.new('MONTH', [Invoice.arel_table[:issued_at]]))
      respond_to do |format|
          format.json { render json: @summary_month, root: 'summary', each_serializer: SummaryMonthSerializer }
      end
    end
  end
end
